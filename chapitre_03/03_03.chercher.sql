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
	SUM(ca) OVER (ORDER BY annee_facture ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
FROM t;
