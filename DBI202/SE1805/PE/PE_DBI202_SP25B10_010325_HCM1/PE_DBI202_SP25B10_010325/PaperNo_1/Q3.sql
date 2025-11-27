SELECT
	StudentID,
	StudentLastName,
	StudentFirstName
FROM 
	Students 
WHERE 
	StudentFirstName LIKE 'T%'
ORDER BY
	StudentLastName ASC