-- fuseaux horaires
SHOW timezone;
SELECT * FROM pg_timezone_names;

SET timezone TO 'Europe/Paris';

SELECT CURRENT_TIMESTAMP;
SELECT localtime;
SELECT localtime AT TIME ZONE 'America/Antigua' AS ici;
SELECT TO_CHAR(CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Paris', 'YYYY-MM-DD HH24:MI:SS TZ') AS ici;

SELECT 
    CURRENT_TIMESTAMP AS utc_time,
    CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Paris' AS paris,
    CURRENT_TIMESTAMP AT TIME ZONE 'America/New_York' AS new_york,
    CURRENT_TIMESTAMP AT TIME ZONE 'Asia/Tokyo' AS tokyo;

-- calculer un âge
SELECT AGE(CURRENT_DATE, '1990-01-01'::DATE) AS age;
SELECT EXTRACT(MONTH FROM AGE(CURRENT_DATE, '1990-01-01'::DATE)) AS age;

SELECT TO_CHAR(age(current_date, '2017-04-17 00:00:00.0'), 'YY "Années" mm "Mois" DD "Jours"')

SELECT 
	c.nom, c.prenom,
	c.datedenaissance,
	AGE(CURRENT_DATE, c.datedenaissance) AS age,
	AGE(c.datedenaissance) AS age,
	TO_CHAR(AGE(c.datedenaissance), 'YY "ans" mm "mois"') AS age
FROM contact.contact c;

-- overlaps
SELECT 
	s.sessionid,
	s.datedebut,
	s.duree,
	s.datedebut + s.duree - 1 AS datefin
FROM stage.session s;

WITH t AS (
	SELECT 
		s.sessionid,
		s.datedebut,
		s.duree,
		s.datedebut + s.duree - 1 AS datefin
	FROM stage.session s
)
SELECT *
FROM t t1
JOIN t t2 ON t1.sessionid <> t2.sessionid
WHERE (t1.datedebut, t1.datefin) OVERLAPS (t2.datedebut, t2.datefin);