SELECT *
FROM contact.contact
LIMIT 20;

SELECT 
	CONCAT_WS(' ', titre, INITCAP(prenom), UPPER(nom)) AS nom,
	--telephone,
	REGEXP_REPLACE(telephone, '(\d\d)(?=\d\d)', '\1 ', 'g') AS telephone,
	--datedenaissance,
	--EXTRACT(YEAR FROM datedenaissance) AS annee_de_naissance,
	TO_CHAR(datedenaissance, 'DD/MM/YYYY') AS "date de naissance"
FROM contact.contact
LIMIT 20;