SELECT *
FROM contact.contact c
WHERE email IN (
	SELECT email --, COUNT(*)
	FROM contact.contact c 
	WHERE email IS NOT NULL
	GROUP BY email
	HAVING COUNT(*) > 1
)
ORDER BY email;

WITH t AS (
	SELECT *,
		COUNT(*) OVER (PARTITION BY email, nom, prenom) AS cnt
	FROM contact.contact c 
)
SELECT *
FROM t
WHERE cnt > 1
ORDER BY email;



