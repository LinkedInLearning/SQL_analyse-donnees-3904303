CREATE TEMPORARY TABLE resultat
AS
SELECT
    EXTRACT(YEAR FROM datefacture) AS annee,
    EXTRACT(MONTH FROM datefacture) AS mois,
    SUM(montantht) AS ca
FROM inscription.facture f
GROUP BY EXTRACT(YEAR FROM datefacture), EXTRACT(MONTH FROM datefacture);
--ORDER BY annee, mois

/*
SELECT
    EXTRACT(YEAR FROM datefacture) AS annee,
    EXTRACT(MONTH FROM datefacture) AS mois,
    SUM(montantht) AS ca
INTO #resultat
FROM inscription.facture f
GROUP BY EXTRACT(YEAR FROM datefacture), EXTRACT(MONTH FROM datefacture)
*/

SELECT *
FROM resultat;

-- CREATE INDEX ...

