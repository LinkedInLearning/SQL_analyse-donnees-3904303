-- extraire des parties de date
SELECT 
	c1.prenom, c1.nom, TO_CHAR(c1.datedenaissance, 'DD/MM/YYYY') AS datedenaissance,
	c2.prenom, c2.nom, TO_CHAR(c2.datedenaissance, 'DD/MM/YYYY') AS datedenaissance
FROM contact.contact c1
JOIN contact.contact c2
	ON c1.contactid > c2.contactid 
	AND EXTRACT(YEAR FROM c1.datedenaissance) = EXTRACT(YEAR FROM c2.datedenaissance)
	AND EXTRACT(MONTH FROM c1.datedenaissance) = EXTRACT(MONTH FROM c2.datedenaissance)
	AND levenshtein(c1.nom, c2.nom) < 2;
	
SELECT 
	c1.prenom, c1.nom, TO_CHAR(c1.datedenaissance, 'DD/MM/YYYY') AS datedenaissance,
	c2.prenom, c2.nom, TO_CHAR(c2.datedenaissance, 'DD/MM/YYYY') AS datedenaissance
FROM contact.contact c1
JOIN contact.contact c2
	ON c1.contactid > c2.contactid 
	AND DATE_TRUNC('month', c1.datedenaissance) = DATE_TRUNC('month', c2.datedenaissance)
	AND levenshtein(c1.nom, c2.nom) < 2;
	
-- regrouper
SELECT
    EXTRACT(YEAR FROM datefacture) AS annee,
    EXTRACT(MONTH FROM datefacture) AS mois,
    SUM(montantht) AS ca
FROM inscription.facture f
GROUP BY EXTRACT(YEAR FROM datefacture), EXTRACT(MONTH FROM datefacture)
ORDER BY annee, mois

SELECT
    TO_CHAR(DATE_TRUNC('month', datefacture), 'YYYY.MM') AS annee_mois,
    SUM(montantht) AS ca
FROM inscription.facture f
GROUP BY DATE_TRUNC('month', datefacture)
ORDER BY annee_mois