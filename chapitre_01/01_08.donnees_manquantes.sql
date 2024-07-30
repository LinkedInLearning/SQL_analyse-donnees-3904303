-- corriger des données manquantes dans une colonne
SELECT *
FROM contact.contact
WHERE titre IS NULL;

SELECT 
	CASE 
		WHEN titre IS NULL THEN
			CASE sexe
				WHEN 'F' THEN 'Mme'
				WHEN 'H' THEN 'M.'
			END
		ELSE titre
	END AS Titre,
	nom,
	prenom
FROM contact.contact
LIMIT 20;

-- utiliser COALESCE()
SELECT 
	email,
	telephone,
	portable,
	COALESCE('email: ' || email, 'tel: ' || telephone, 'portable: ' || portable, '[aucun]') AS moyen_de_contact
FROM contact.contact c 
LIMIT 20;