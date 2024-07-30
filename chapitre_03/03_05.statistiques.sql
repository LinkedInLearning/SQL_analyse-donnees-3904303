SELECT * FROM facturation;

SELECT * FROM facturation WHERE societeid = 1;

SELECT 
	annee_facture,
	SUM(montantht) AS ca,
	COUNT(*) AS nb_factures,
	COUNT(DISTINCT facturecd),
	MIN(montantht) AS plus_petite_facture,
	MAX(montantht) AS plus_grande_facture,
	AVG(montantht) AS montant_moyen
FROM facturation 
WHERE societeid = 1
GROUP BY annee_facture;
