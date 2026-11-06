BEGIN;

-- =========================================================
-- DEV ONLY : compte admin de test
-- =========================================================
-- NE PAS exécuter en production. Non appelé par db-reset.sh.
--
--   email        : admin@genuflexio.local
--   mot de passe : admin1234
--
-- Le hash est un Argon2id généré avec les mêmes paramètres que
-- service::hash_password (argon2 0.5, défauts : m=19456, t=2, p=1).
--
-- Usage :
--   psql "$DATABASE_URL" -f data/seedDevAdmin.sql
--
-- Re-runnable : met à jour le mot de passe si le compte existe déjà.
-- =========================================================

INSERT INTO users (email, password_hash, role)
VALUES (
    'rip',
    '$argon2id$v=19$m=19456,t=2,p=1$iyd7bJ418jQ9mdxpuC7nWw$gLW8pVmZLIE6QYgD3FnGTrAPXileaSfjpBLygavXmfM',
    'admin'
)
ON CONFLICT (email) DO UPDATE
    SET password_hash = EXCLUDED.password_hash,
        role          = EXCLUDED.role;

COMMIT;
