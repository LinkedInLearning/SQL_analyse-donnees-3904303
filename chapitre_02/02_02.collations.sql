SELECT *
FROM contact.contact c
WHERE prenom = 'Adèle';

SELECT * FROM pg_collation WHERE collname = 'insensible';

DROP COLLATION insensible;
CREATE COLLATION insensible (provider = icu,
                    locale = 'und-u-kc-false-ks-level1', deterministic = false);

SELECT *
FROM contact.contact c
WHERE prenom COLLATE insensible = 'adele';

SELECT *
FROM contact.contact c
WHERE prenom ILIKE 'adèle';