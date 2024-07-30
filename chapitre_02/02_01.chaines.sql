SELECT 
	c.nom,
	c.prenom,
	c.email,
	c.nom || ' ' || c.email,
	CONCAT(c.nom, ' ', c.email),
	CONCAT(c.email || ' ', c.nom),
	CONCAT_WS(', ', email, telephone, portable)
FROM contact.contact c;

SELECT s.nom, c.email
FROM contact.societe s
JOIN contact.contact c ON s.societeid = c.societeid
ORDER BY s.nom;

SELECT s.nom, STRING_AGG(c.email, '; ' ORDER BY c.email)
FROM contact.societe s
JOIN contact.contact c ON s.societeid = c.societeid 
GROUP BY s.societeid, s.nom
ORDER BY s.nom; 