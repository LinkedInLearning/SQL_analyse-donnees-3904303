SELECT * 
FROM inscription.inscription_formation;

SELECT * 
FROM inscription.inscription_formation 
WHERE informations ~ 'Formation: SQL avancé';

SELECT * 
FROM inscription.inscription_formation 
WHERE informations !~* 'Formation: sql avancé';

SELECT
  inscriptionid,
  TRIM(UNNEST(REGEXP_SPLIT_TO_ARRAY(informations, ';'))) AS information
FROM inscription.inscription_formation;

SELECT
  inscriptionid,
  TRIM(REGEXP_SPLIT_TO_TABLE(informations, ';')) AS information
FROM inscription.inscription_formation;

WITH t AS (
  SELECT
    inscriptionid,
    TRIM(REGEXP_SPLIT_TO_TABLE(informations, ';')) AS information
  FROM inscription.inscription_formation
)
SELECT
  inscriptionid,
  MAX(CASE WHEN information LIKE 'Nom:%' THEN substring(information, strpos(information, ':') + 2) END) AS nom,
  MAX(CASE WHEN information LIKE 'Formation:%' THEN substring(information, strpos(information, ':') + 2) END) AS formation,
  MAX(CASE WHEN information LIKE 'Date:%' THEN substring(information, strpos(information, ':') + 2) END) AS date_inscription
FROM t
GROUP BY inscriptionid;

SELECT
  inscriptionid,
  (regexp_match(informations, 'Nom: ([^;]+)'))[1] AS nom,
  regexp_substr(informations, 'Formation: ([^;]+)', 1, 1, 'i', 1) AS formation,
  (regexp_match(informations, 'Date: ([^;]+)'))[1] AS date_inscription
FROM inscription.inscription_formation;