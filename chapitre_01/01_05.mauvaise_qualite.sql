SELECT *
FROM contact.contact_qualite;

-- Identifier les problèmes
SELECT
	contactid,
	nom,
	prenom,
	CASE 
		WHEN nom <> INITCAP(Nom) THEN 'casse'
		WHEN nom <> TRIM(Nom)    THEN 'espaces'
	END AS probleme
FROM contact.contact_qualite
WHERE nom <> INITCAP(Nom)
OR nom <> TRIM(Nom)
ORDER BY nom;


-- Casse
SELECT 
	nom,
	INITCAP(nom)
FROM contact.contact_qualite
ORDER BY nom;

-- Espaces
SELECT 
	nom,
	TRIM(INITCAP(nom))
FROM contact.contact_qualite
ORDER BY nom;

-- Uniformisation
SELECT *
FROM contact.contact_qualite c 
WHERE telephone !~ '^\d{10}$'; 

SELECT 
	telephone,
	REPLACE(telephone, '.', ''),
	TRANSLATE(telephone, '. ', '')
FROM contact.contact_qualite
ORDER BY nom;

-- Prévenir
CREATE TRIGGER contact.check_contact
    BEFORE INSERT, UPDATE ON contact.contact
    FOR EACH ROW
    EXECUTE FUNCTION check_contact();