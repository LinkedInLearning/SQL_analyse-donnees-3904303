SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'contactid';

SELECT *
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS;

SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = 'contact' 
AND TABLE_NAME = 'contact'
AND CONSTRAINT_TYPE IN ('PRIMARY KEY', 'UNIQUE');

SELECT rc.*
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS rc
JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc
	ON rc.unique_constraint_schema = tc.table_schema 
	AND rc.unique_constraint_name = tc.constraint_name
WHERE tc.TABLE_SCHEMA = 'contact' 
AND tc.TABLE_NAME = 'contact'
AND tc.CONSTRAINT_TYPE IN ('PRIMARY KEY', 'UNIQUE');

SELECT i.*
FROM inscription.inscription i 
LEFT JOIN contact.contact c ON i.contactid = c.contactid 
WHERE c.contactid IS NULL;

SELECT i.contactid
FROM inscription.inscription i 
EXCEPT 
SELECT c.contactid
FROM contact.contact c;

SELECT i.*
FROM inscription.inscription i 
WHERE i.contactid NOT IN (
	SELECT c.contactid
	FROM contact.contact c
);
