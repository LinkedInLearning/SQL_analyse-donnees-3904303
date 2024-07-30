CREATE TABLE IF NOT EXISTS inscription.inscription_formation (
  inscriptionid INT PRIMARY KEY,
  informations VARCHAR(2000)
);

-- Données d'exemple
INSERT INTO inscription.inscription_formation (inscriptionid, informations) VALUES
  (1, 'Nom: Durand; Formation: SQL pour débutants; Date: 2023-10-20'),
  (2, 'Nom: Martin; Formation: Analyse de données avec Python; Date: 2023-11-05'),
  (3, 'Nom: Dupont; Formation: SQL avancé; Date: 2023-10-20'),
  (4, 'Nom: Martin; Formation: Visualisation de données; Date: 2023-12-01'),
  (5, 'Nom: Dubois; Formation: Introduction à Python; Date: 2024-01-15'),
  (6, 'Nom: Leroy; Formation: Machine Learning; Date: 2023-11-12'),
  (7, 'Nom: Moreau; Formation: SQL pour débutants; Date: 2023-10-27'),
  (8, 'Nom: Simon; Formation: Deep Learning; Date: 2024-02-05'),
  (9, 'Nom: Laurent; Formation: Analyse de données avec R; Date: 2023-12-10'),
  (10, 'Nom: Lefebvre; Formation: SQL avancé; Date: 2023-11-05'),
  (11, 'Nom: Michel; Formation: Introduction à Python; Date: 2024-01-22'),
  (12, 'Nom: David; Formation: Visualisation de données; Date: 2023-12-17'),
  (13, 'Nom: Bertrand; Formation: Machine Learning; Date: 2023-11-19'),
  (14, 'Nom: Roux; Formation: SQL pour débutants; Date: 2023-11-03'),
  (15, 'Nom: Vincent; Formation: Deep Learning; Date: 2024-02-19'),
  (16, 'Nom: Garnier; Formation: Analyse de données avec Python; Date: 2023-12-24'),
  (17, 'Nom: Sanchez; Formation: SQL avancé; Date: 2023-11-12'),
  (18, 'Nom: Petit; Formation: Introduction à Python; Date: 2024-01-29'),
  (19, 'Nom: Robert; Formation: Visualisation de données; Date: 2024-01-05'),
  (20, 'Nom: Richard; Formation: Machine Learning; Date: 2023-11-26'),
  (21, 'Nom: Lucas; Formation: SQL pour débutants; Date: 2023-11-10'),
  (22, 'Nom: Thomas; Formation: Deep Learning; Date: 2024-02-26');


SELECT * 
FROM inscription.inscription_formation
WHERE informations LIKE '%Formation: SQL%';

SELECT * 
FROM inscription.inscription_formation 
WHERE informations LIKE '%Nom: Martin%' 
AND informations LIKE '%Date: 2023%';

SELECT SPLIT_PART(informations, '; ', 1) AS nom_participant
FROM inscription.inscription_formation;

SELECT TRIM(LEADING 'Nom: ' FROM SPLIT_PART(informations, '; ', 1)) AS nom_participant
FROM inscription.inscription_formation;

SELECT 
	SPLIT_PART(informations, '; ', 1) AS nom_participant,
	SPLIT_PART(informations, '; ', 2) AS formation,
	SPLIT_PART(informations, '; ', 3) AS date_session
FROM inscription.inscription_formation;

WITH t AS ( -- étape 1 ...
	SELECT 
		SPLIT_PART(informations, '; ', 1) AS nom_participant,
		SPLIT_PART(informations, '; ', 2) AS formation,
		SPLIT_PART(informations, '; ', 3) AS date_session
	FROM inscription.inscription_formation
)
SELECT 
	nom_participant,
	POSITION(': ' IN nom_participant),
	RIGHT(nom_participant, - (POSITION(': ' IN nom_participant) + 1)),
	RIGHT(nom_participant, -5)
FROM t;

WITH t1 AS (
	SELECT 
		SPLIT_PART(informations, '; ', 1) AS nom_participant,
		SPLIT_PART(informations, '; ', 2) AS formation,
		SPLIT_PART(informations, '; ', 3) AS date_session
	FROM inscription.inscription_formation
), t2 AS (
	SELECT 
		TRIM(LEADING 'Nom: ' FROM nom_participant) AS nom_participant,
		TRIM(LEADING 'Formation: ' FROM formation) AS formation,
		CAST(TRIM(LEADING 'Date: ' FROM date_session) AS DATE) AS date_session
	FROM t1
)
SELECT *
FROM t2;
