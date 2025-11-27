SELECT 
	D.DepartmentID,
	D.DepartmentName,
	COUNT(S.StudentID) AS [NumberOfStudents]
FROM
	Departments AS D
	INNER JOIN Students AS S ON S.DepartmentID=D.DepartmentID
GROUP BY
	D.DepartmentID, D.DepartmentName