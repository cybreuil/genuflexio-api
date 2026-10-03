# Verify differences between sql :seedRomanImages and oldseed to check if missing comms

import sys
from pathlib import Path

if len(sys.argv) != 3:
    print("Usage:")
    print("  python verifySql2.py ancien.sql nouveau.sql")
    sys.exit(1)


old_file = sys.argv[1]
new_file = sys.argv[2]


def extract_comments(filename):
    lines = Path(filename).read_text(encoding="utf-8").splitlines()

    comments = []

    for line_number, line in enumerate(lines, 1):
        stripped = line.strip()

        if stripped.startswith("--"):
            comments.append((line_number, stripped))

    return comments


old_comments = extract_comments(old_file)
new_comments = extract_comments(new_file)


print("=" * 80)
print("COMPARAISON DES COMMENTAIRES")
print("=" * 80)

print()
print(f"Ancien : {len(old_comments)} commentaires")
print(f"Nouveau : {len(new_comments)} commentaires")
print()


# Compare les commentaires dans leur ordre
max_comments = max(len(old_comments), len(new_comments))

differences = 0

for i in range(max_comments):
    old = old_comments[i] if i < len(old_comments) else None
    new = new_comments[i] if i < len(new_comments) else None

    if old is None:
        differences += 1

        print("=" * 80)
        print(f"❌ DIFFÉRENCE #{differences}")
        print("=" * 80)
        print()
        print("Le nouveau fichier contient un commentaire supplémentaire :")
        print()
        print(f"Nouveau ligne {new[0]}:")
        print(f"  {new[1]}")
        print()

        continue

    if new is None:
        differences += 1

        print("=" * 80)
        print(f"❌ DIFFÉRENCE #{differences}")
        print("=" * 80)
        print()
        print("L'ancien fichier contient un commentaire supplémentaire :")
        print()
        print(f"Ancien ligne {old[0]}:")
        print(f"  {old[1]}")
        print()

        continue

    if old[1] != new[1]:
        differences += 1

        print("=" * 80)
        print(f"❌ DIFFÉRENCE #{differences}")
        print("=" * 80)

        print()
        print(f"Commentaire #{i + 1}")
        print()

        print(f"ANCIEN - ligne {old[0]}:")
        print(f"  {old[1]}")

        print()

        print(f"NOUVEAU - ligne {new[0]}:")
        print(f"  {new[1]}")

        print()


print("=" * 80)

if differences == 0:
    print("✅ Tous les commentaires sont identiques et dans le même ordre.")
else:
    print(f"❌ {differences} divergence(s) trouvée(s).")

print("=" * 80)
