SELECT 
	CURRENT_TIMESTAMP,
	CURRENT_TIMESTAMP + INTERVAL '1 month 1 day' AS plus_tard;

-- comme type de données
CREATE TABLE public.projet (
    projetid SERIAL PRIMARY KEY,
    nom VARCHAR(100),
    date_debut DATE,
    duree_prevue INTERVAL
);

INSERT INTO projet (nom, date_debut, duree_prevue) VALUES
('Projet A', '2023-01-01', INTERVAL '3 months'),
('Projet B', '2023-02-15', INTERVAL '6 weeks'),
('Projet C', '2023-03-01', INTERVAL '1 year 2 months');

SELECT * FROM projet
WHERE duree_prevue > INTERVAL '6 months';

-- utilité des intervalles
SELECT f.facturecd, f.datefacture, f.montantht, s.datepaiement, COUNT(*) OVER ()
FROM inscription.facture f
JOIN inscription.suivifacture s ON f.facturecd = s.facturecd
WHERE s.datepaiement - f.datefacture > 30;

SELECT f.facturecd, f.datefacture, f.montantht, s.datepaiement, COUNT(*) OVER ()
FROM inscription.facture f
JOIN inscription.suivifacture s ON f.facturecd = s.facturecd
WHERE s.datepaiement > f.datefacture + INTERVAL '1 month';

SELECT f.facturecd, f.datefacture, f.montantht, s.datepaiement
FROM inscription.facture f
JOIN inscription.suivifacture s ON f.facturecd = s.facturecd
WHERE s.datepaiement - f.datefacture > 30
EXCEPT
SELECT f.facturecd, f.datefacture, f.montantht, s.datepaiement
FROM inscription.facture f
JOIN inscription.suivifacture s ON f.facturecd = s.facturecd
WHERE s.datepaiement > f.datefacture + INTERVAL '1 month';
