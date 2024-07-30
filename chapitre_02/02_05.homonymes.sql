SELECT * FROM pg_extension;

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;
CREATE EXTENSION IF NOT EXISTS pg_trgm;

SELECT SIMILARITY('Noura Alaoui', 'Nourra Alawuy');
SELECT SIMILARITY('Noura Alaoui', 'Samia Benani');
SELECT levenshtein('Noura Alaoui', 'Nourra Alawuy');
SELECT levenshtein('Noura Alaoui', 'Samia Benani');

SELECT dmetaphone('Noura Alaoui'), dmetaphone_alt('Noura Alaoui');
SELECT dmetaphone('Nourra Alawuy'), dmetaphone_alt('Nourra Alawuy');
SELECT dmetaphone('Samia Benani'), dmetaphone_alt('Samia Benani');

WITH t AS (
	SELECT 
		contactid,
		CONCAT_WS(' ', c.prenom, c.nom, c.datedenaissance) AS chaine
	FROM contact.contact c
	LIMIT 10
)
SELECT *,
	dmetaphone_alt(t1.chaine) AS meta1,
	dmetaphone_alt(t2.chaine)  AS meta2,
	levenshtein(t1.chaine, t2.chaine) AS "levenshtein"
FROM t t1
JOIN t t2 ON t1.contactid <> t2.contactid
--	AND levenshtein(t1.chaine, t2.chaine) < 5
ORDER BY "levenshtein";
