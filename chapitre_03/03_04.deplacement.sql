SELECT * FROM facturation;

SELECT * FROM facturation WHERE societeid = 1;

WITH t AS (
	SELECT 
		annee_facture,
		SUM(montantht) AS ca
	FROM facturation 
	WHERE societeid = 1
	GROUP BY annee_facture
)
SELECT *,
	SUM(ca) OVER (),
	SUM(ca) OVER (ORDER BY annee_facture ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW),
	LAG(ca) OVER (ORDER BY annee_facture),
	ca / LAG(ca) OVER (ORDER BY annee_facture) * 100 AS evolution_ca,
	ca / SUM(ca) OVER () * 100
FROM t;
