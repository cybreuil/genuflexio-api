# Verify differences between sql :seedRomanImages and oldseed to check if missing images
import re
import sys
from pathlib import Path

EXPECTED_COLUMNS_OLD = [
    "image_url",
    "title",
    "image_type",
    "alt_text",
    "creator",
    "date_label",
    "repository",
    "credit",
    "license",
    "source_url",
]

EXPECTED_COLUMNS_NEW = [
    "image_url",
    "title",
    "image_type",
    "alt_text",
    "creator",
    "date_label",
    "century",
    "repository",
    "credit",
    "license",
    "source_url",
]


def remove_sql_comments(sql):
    """Remove -- comments while preserving quoted strings."""
    result = []
    i = 0
    in_string = False

    while i < len(sql):
        char = sql[i]

        # SQL string
        if char == "'":
            # SQL escaped quote: ''
            if in_string and i + 1 < len(sql) and sql[i + 1] == "'":
                result.append("''")
                i += 2
                continue

            in_string = not in_string
            result.append(char)
            i += 1
            continue

        # SQL comment
        if not in_string and char == "-" and i + 1 < len(sql) and sql[i + 1] == "-":
            while i < len(sql) and sql[i] != "\n":
                i += 1

            if i < len(sql):
                result.append("\n")
                i += 1

            continue

        result.append(char)
        i += 1

    return "".join(result)


def extract_images_insert(sql):
    """
    Extract:
        INSERT INTO images (...)
        VALUES
        (...),
        (...);

    Returns:
        columns, tuples
    """

    sql = remove_sql_comments(sql)

    pattern = re.compile(
        r"""
        INSERT\s+INTO\s+images
        \s*\((.*?)\)
        \s*VALUES
        """,
        re.IGNORECASE | re.DOTALL | re.VERBOSE,
    )

    match = pattern.search(sql)

    if not match:
        raise ValueError("Impossible de trouver INSERT INTO images (...) VALUES")

    columns_raw = match.group(1)

    columns = [c.strip() for c in columns_raw.split(",") if c.strip()]

    values_start = match.end()

    # Stop at the first semicolon after VALUES
    values_part = sql[values_start:]
    semicolon = values_part.find(";")

    if semicolon != -1:
        values_part = values_part[:semicolon]

    tuples = parse_tuples(values_part)

    return columns, tuples


def parse_tuples(text):
    """
    Parse SQL tuples:
        ('a', 'b', 17, NULL),
        ('x', 'y', 18, NULL)

    Handles commas and parentheses inside quoted strings.
    """

    tuples = []

    i = 0
    n = len(text)

    while i < n:
        # Find next opening parenthesis
        while i < n and text[i] != "(":
            i += 1

        if i >= n:
            break

        start = i
        depth = 0
        in_string = False

        while i < n:
            char = text[i]

            if char == "'":
                if in_string and i + 1 < n and text[i + 1] == "'":
                    i += 2
                    continue

                in_string = not in_string

            elif not in_string:
                if char == "(":
                    depth += 1
                elif char == ")":
                    depth -= 1

                    if depth == 0:
                        tuples.append(text[start : i + 1])
                        i += 1
                        break

            i += 1

    return tuples


def split_tuple_values(tuple_sql):
    """
    Split:
        ('abc', 'hello, world', 17, NULL)

    into individual SQL values.
    """

    content = tuple_sql.strip()[1:-1]

    values = []
    current = []
    in_string = False

    i = 0

    while i < len(content):
        char = content[i]

        if char == "'":
            current.append(char)

            # SQL escaped quote ''
            if in_string and i + 1 < len(content) and content[i + 1] == "'":
                current.append("'")
                i += 2
                continue

            in_string = not in_string

        elif char == "," and not in_string:
            values.append("".join(current).strip())
            current = []

        else:
            current.append(char)

        i += 1

    if current:
        values.append("".join(current).strip())

    return values


def normalize_value(value):
    """Normalize harmless formatting differences."""
    value = value.strip()

    # Normalize NULL
    if value.upper() == "NULL":
        return "NULL"

    return value


def tuple_to_values(tuple_sql):
    return [normalize_value(v) for v in split_tuple_values(tuple_sql)]


def get_image_url(values):
    if not values:
        return None

    return values[0]


def compare(old_file, new_file):
    old_sql = Path(old_file).read_text(encoding="utf-8")
    new_sql = Path(new_file).read_text(encoding="utf-8")

    old_columns, old_tuples = extract_images_insert(old_sql)
    new_columns, new_tuples = extract_images_insert(new_sql)

    old_rows = [tuple_to_values(t) for t in old_tuples]
    new_rows = [tuple_to_values(t) for t in new_tuples]

    print("=" * 80)
    print("STRUCTURE")
    print("=" * 80)

    print(f"Anciennes colonnes : {len(old_columns)}")
    print(f"Nouvelles colonnes : {len(new_columns)}")

    print("\nAnciennes colonnes:")
    for i, col in enumerate(old_columns, 1):
        print(f"  {i:2}. {col}")

    print("\nNouvelles colonnes:")
    for i, col in enumerate(new_columns, 1):
        print(f"  {i:2}. {col}")

    # Check expected structure
    if old_columns != EXPECTED_COLUMNS_OLD:
        print("\n⚠️  ATTENTION: structure ancienne différente de celle attendue.")

    if new_columns != EXPECTED_COLUMNS_NEW:
        print("\n⚠️  ATTENTION: structure nouvelle différente de celle attendue.")

    print("\n" + "=" * 80)
    print("NOMBRE DE LIGNES")
    print("=" * 80)

    print(f"Ancien fichier : {len(old_rows)} lignes")
    print(f"Nouveau fichier : {len(new_rows)} lignes")
    print(f"Différence : {len(new_rows) - len(old_rows)}")

    # ------------------------------------------------------------------
    # Column count
    # ------------------------------------------------------------------

    print("\n" + "=" * 80)
    print("NOMBRE DE VALEURS PAR TUPLE")
    print("=" * 80)

    bad_old = []
    bad_new = []

    for index, row in enumerate(old_rows, 1):
        if len(row) != len(EXPECTED_COLUMNS_OLD):
            bad_old.append((index, len(row), row))

    for index, row in enumerate(new_rows, 1):
        if len(row) != len(EXPECTED_COLUMNS_NEW):
            bad_new.append((index, len(row), row))

    if bad_old:
        print(f"⚠️ {len(bad_old)} lignes incorrectes dans l'ancien fichier")
        for index, count, row in bad_old[:20]:
            print(f"  ligne tuple {index}: {count} valeurs")

    else:
        print("✓ Toutes les anciennes lignes ont 10 valeurs.")

    if bad_new:
        print(f"⚠️ {len(bad_new)} lignes incorrectes dans le nouveau fichier")
        for index, count, row in bad_new[:20]:
            print(f"  ligne tuple {index}: {count} valeurs")

    else:
        print("✓ Toutes les nouvelles lignes ont 11 valeurs.")

    # ------------------------------------------------------------------
    # URLs
    # ------------------------------------------------------------------

    old_by_url = {}
    new_by_url = {}

    for row in old_rows:
        url = get_image_url(row)

        if url:
            old_by_url.setdefault(url, []).append(row)

    for row in new_rows:
        url = get_image_url(row)

        if url:
            new_by_url.setdefault(url, []).append(row)

    old_urls = set(old_by_url)
    new_urls = set(new_by_url)

    missing = old_urls - new_urls
    added = new_urls - old_urls

    print("\n" + "=" * 80)
    print("COMPARAISON DES IMAGE_URL")
    print("=" * 80)

    print(f"Anciennes URLs uniques : {len(old_urls)}")
    print(f"Nouvelles URLs uniques : {len(new_urls)}")
    print(f"URLs disparues         : {len(missing)}")
    print(f"Nouvelles URLs         : {len(added)}")

    if missing:
        print("\n❌ URLs présentes dans l'ancien mais absentes du nouveau:")
        for url in sorted(missing):
            print(f"  - {url}")
    else:
        print("\n✓ Aucune image supprimée.")

    if added:
        print("\n➕ URLs nouvelles:")
        for url in sorted(added):
            print(f"  - {url}")
    else:
        print("\n✓ Aucune nouvelle image_url.")

    # ------------------------------------------------------------------
    # Duplicates
    # ------------------------------------------------------------------

    print("\n" + "=" * 80)
    print("DOUBLONS")
    print("=" * 80)

    old_duplicates = {url: rows for url, rows in old_by_url.items() if len(rows) > 1}

    new_duplicates = {url: rows for url, rows in new_by_url.items() if len(rows) > 1}

    if old_duplicates:
        print(f"⚠️ Ancien fichier: {len(old_duplicates)} URLs dupliquées")
        for url in sorted(old_duplicates):
            print(f"  - {url} ({len(old_duplicates[url])} fois)")
    else:
        print("✓ Aucun doublon dans l'ancien fichier.")

    if new_duplicates:
        print(f"⚠️ Nouveau fichier: {len(new_duplicates)} URLs dupliquées")
        for url in sorted(new_duplicates):
            print(f"  - {url} ({len(new_duplicates[url])} fois)")
    else:
        print("✓ Aucun doublon dans le nouveau fichier.")

    # ------------------------------------------------------------------
    # Compare same URLs
    # ------------------------------------------------------------------

    print("\n" + "=" * 80)
    print("COMPARAISON DES DONNÉES")
    print("=" * 80)

    changed = []

    common_urls = old_urls & new_urls

    for url in sorted(common_urls):
        old_row = old_by_url[url][0]
        new_row = new_by_url[url][0]

        # Map old/new columns by name
        old_dict = dict(zip(old_columns, old_row))
        new_dict = dict(zip(new_columns, new_row))

        differences = {}

        for column in old_columns:
            if column not in new_dict:
                differences[column] = (old_dict[column], "<MISSING>")
            elif old_dict[column] != new_dict[column]:
                differences[column] = (old_dict[column], new_dict[column])

        # century is intentionally new, so don't count it as a change
        if differences:
            changed.append((url, differences))

    if changed:
        print(f"⚠️ {len(changed)} images ont des données différentes.")

        for url, differences in changed[:50]:
            print(f"\n{url}")

            for column, (old_value, new_value) in differences.items():
                print(f"  {column}:")
                print(f"    OLD: {old_value}")
                print(f"    NEW: {new_value}")

        if len(changed) > 50:
            print(f"\n... et {len(changed) - 50} autres.")
    else:
        print("✓ Les données existantes sont identiques.")
        print("  (La colonne century est ignorée dans cette comparaison.)")

    # ------------------------------------------------------------------
    # Century validation
    # ------------------------------------------------------------------

    print("\n" + "=" * 80)
    print("VALIDATION DE CENTURY")
    print("=" * 80)

    century_problems = []

    if "century" in new_columns:
        century_index = new_columns.index("century")

        for index, row in enumerate(new_rows, 1):
            if len(row) <= century_index:
                continue

            value = row[century_index]

            if value.upper() == "NULL":
                century_problems.append((index, get_image_url(row), value, "NULL"))
                continue

            # Century should be an integer
            if not re.fullmatch(r"-?\d+", value):
                century_problems.append(
                    (index, get_image_url(row), value, "not an integer")
                )

        if century_problems:
            print(f"⚠️ {len(century_problems)} problèmes trouvés dans century:")

            for item in century_problems[:50]:
                index, url, value, reason = item
                print(f"  tuple {index}: {url}")
                print(f"    century = {value} ({reason})")

        else:
            print("✓ Toutes les valeurs century sont des entiers.")

    print("\n" + "=" * 80)
    print("RÉSUMÉ")
    print("=" * 80)

    problems = (
        len(bad_old) + len(bad_new) + len(missing) + len(new_duplicates) + len(changed)
    )

    if problems == 0:
        print("✅ Aucun problème détecté.")
        print("   Les anciennes images sont toutes présentes.")
        print("   La colonne century est correctement ajoutée.")
    else:
        print("⚠️ Des différences/problèmes ont été détectés.")
        print("   Regarde les sections ci-dessus.")


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage:\n  python verify_sql.py ancien.sql nouveau.sql")
        sys.exit(1)

    compare(sys.argv[1], sys.argv[2])
