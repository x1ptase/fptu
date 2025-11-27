SELECT
	StudentID,
	StudentLastName,
	StudentFirstName,
	YEAR(GETDATE()) - YEAR(StudentBirthday) AS 'Age'
FROM
	Students
WHERE 
	YEAR(GETDATE()) - YEAR(StudentBirthday) > 20
ORDER BY
	StudentID ASC