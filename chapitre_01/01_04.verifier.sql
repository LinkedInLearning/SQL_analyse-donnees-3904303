SELECT *
FROM contact.contact c 
WHERE c.nom BETWEEN 'A' AND 'C'
ORDER BY c.nom, c.prenom;

SELECT *
FROM contact.contact c 
WHERE c.nom BETWEEN 'A' AND 'C'
ORDER BY c.nom DESC, c.prenom;