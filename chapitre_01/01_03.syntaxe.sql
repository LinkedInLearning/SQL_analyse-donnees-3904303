SELECT
    EXTRACT(YEAR FROM datefacture) AS annee,
    EXTRACT(MONTH FROM datefacture) AS mois,
    SUM(montantht) AS ca
FROM inscription.facture f
WHERE datefacture = '2024-01-01'
GROUP BY EXTRACT(YEAR FROM datefacture), EXTRACT(MONTH FROM datefacture)
ORDER BY annee, mois;  