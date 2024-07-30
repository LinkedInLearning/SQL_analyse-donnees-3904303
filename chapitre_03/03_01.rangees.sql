WITH ca AS (
	SELECT
	    EXTRACT(YEAR FROM datefacture) AS annee,
	    EXTRACT(MONTH FROM datefacture) AS mois,
	    SUM(montantht) AS ca
	FROM inscription.facture f
	WHERE f.datefacture IS NOT NULL
	GROUP BY EXTRACT(YEAR FROM datefacture), EXTRACT(MONTH FROM datefacture)
)
SELECT *,
	RANK() OVER w,
	DENSE_RANK() OVER w,
	NTILE(4) OVER w
FROM ca
WINDOW w AS (PARTITION BY annee ORDER BY ca DESC)
ORDER BY annee, mois;

