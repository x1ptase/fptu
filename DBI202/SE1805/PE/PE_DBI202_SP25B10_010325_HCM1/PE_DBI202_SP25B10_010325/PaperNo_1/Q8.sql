SELECT
    S.StudentID,
    S.StudentLastName,
    S.StudentFirstName
FROM 
    Students AS S
WHERE
    S.StudentScholarship = (
        SELECT 
            MAX(S.StudentScholarship)
        FROM 
			Students AS S
			INNER JOIN Departments AS D ON D.DepartmentID=S.DepartmentID
        WHERE S.DepartmentID = D.DepartmentID AND D.DepartmentName = 'Mathematics'
    ) 