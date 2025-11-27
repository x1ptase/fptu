SELECT 
	S.StudentID, 
	S.StudentLastName, 
	S.StudentFirstName, 
	D.DepartmentName
FROM 
	Students AS S
	INNER JOIN Departments AS D ON D.DepartmentID=S.DepartmentID
WHERE D.DepartmentName='Computer Science'