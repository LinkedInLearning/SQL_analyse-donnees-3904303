SELECT 
    annee_facture,
    -- Moyenne arithmétique
    AVG(montantht) AS moyenne_arithmetique,
    -- Médiane
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY montantht) AS mediane,
    PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY montantht) AS mediane,
    -- Mode (valeur la plus fréquente)
    MODE() WITHIN GROUP (ORDER BY montantht) AS mode,
    -- Nombre de factures
    COUNT(*) AS nombre_factures,
    -- CA
    SUM(montantht) AS ca
FROM facturation 
WHERE societeid = 1
GROUP BY annee_facture
