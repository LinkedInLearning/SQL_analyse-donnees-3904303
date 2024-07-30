-- Étape 1: Extraction des informations
-- DROP TABLE IF EXISTS facturation;
CREATE TEMPORARY TABLE IF NOT EXISTS facturation
AS
SELECT 
	f.facturecd ,
	f.datefacture,
	EXTRACT(YEAR FROM f.datefacture) AS annee_facture,
	EXTRACT(MONTH FROM f.datefacture) AS mois_facture,
	f.montantht,
	s.datedebut,
	sl.stageid,
	sl.titre AS formation,
	c.sexe,
	soc.societeid,
	soc.nom AS nom_societe
	,COUNT(*) OVER () AS cnt
FROM inscription.facture f
JOIN inscription.inscriptionfacture inf ON f.facturecd = inf.facturecd
JOIN inscription.inscription i ON i.inscriptionid = inf.inscriptionid
JOIN stage.session s ON i.sessionid = s.sessionid 
JOIN stage.stagelangue sl ON s.stageid = sl.stageid AND s.languecd = sl.languecd 
JOIN contact.contact c ON i.contactid = c.contactid 
JOIN contact.societe soc ON c.societeid = soc.societeid 
WHERE f.datefacture IS NOT NULL;

CREATE INDEX ix_facturation_annee_facture ON facturation (annee_facture);

-- Étape 2: Analyse préliminaire
SELECT annee_facture, COUNT(*)
FROM facturation
GROUP BY annee_facture
ORDER BY annee_facture DESC;

-- Étape 3: Calcul du CA sur trois ans par société
WITH ca_sur_trois_ans AS (
	SELECT 
	    societeid, 
	    nom_societe,
	    annee_facture,
	    SUM(montantht) AS ca,
	    DENSE_RANK() OVER (PARTITION BY annee_facture ORDER BY SUM(montantht) DESC) AS rang
	FROM facturation
	WHERE annee_facture BETWEEN 2005 AND 2007
	GROUP BY societeid, nom_societe, annee_facture
	HAVING SUM(montantht) >= 10000
), -- Étape 4: On conserve les trois meilleures sociétés
trois_meilleurs AS (
	SELECT 
		nom_societe,
	    annee_facture,
	    ca
	FROM ca_sur_trois_ans
	WHERE rang <= 3
), -- Étape 5: On pivote sur les années
pivot_annees AS (
    SELECT 
        nom_societe,
        MAX(CASE WHEN annee_facture = 2005 THEN ca END) AS ca_2005,
        MAX(CASE WHEN annee_facture = 2006 THEN ca END) AS ca_2006,
        MAX(CASE WHEN annee_facture = 2007 THEN ca END) AS ca_2007
    FROM trois_meilleurs
    GROUP BY nom_societe
), -- Étape 6: Calcul de la croissance année par année
croissance_annuelle AS (
    SELECT 
        *,
        ROUND((ca_2006 - ca_2005) / ca_2005 * 100, 2) AS croissance_2005_2006,
        ROUND((ca_2007 - ca_2006) / ca_2006 * 100, 2) AS croissance_2006_2007
    FROM pivot_annees
)
SELECT *
FROM croissance_annuelle;


