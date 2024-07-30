SELECT 
	annee_facture,
	ROUND(AVG(montantht), 2) AS moyenne,
	ROUND(STDDEV_POP(montantht), 2) AS ecart_type_population,
	ROUND(STDDEV_POP(montantht) / AVG(montantht), 2) AS coefficient_variation,
	ROUND(VAR_POP(montantht), 2) AS variance_population,
	MIN(montantht) AS minimum,
	PERCENTILE_DISC(0.25) WITHIN GROUP (ORDER BY montantht) AS q1,
    PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY montantht) AS mediane,
    PERCENTILE_DISC(0.75) WITHIN GROUP (ORDER BY montantht) AS q3,
	MAX(montantht) AS maximum,
	COUNT(DISTINCT montantht) AS valeurs_distinctes,
	COUNT(*) AS valeurs
FROM facturation 
WHERE societeid = 1
GROUP BY annee_facture

SELECT 
	montantht,
	COUNT(*) AS nb,
	COUNT(*) / COUNT(*) OVER () * 100 AS frequence
FROM facturation 
WHERE annee_facture = 1955
GROUP BY montantht
ORDER BY montantht

SELECT 
	montantht,
	COUNT(*) AS nb,
	COUNT(*) / COUNT(*) OVER () * 100 AS frequence
FROM facturation 
WHERE annee_facture = 1953
GROUP BY montantht
ORDER BY montantht
