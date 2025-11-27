WITH countFail AS(
	SELECT 
	D.DepartmentName,
	SB.SubjectName,
	COUNT(R.Score) AS [numberOfFailExam]
FROM
	Departments AS D
	INNER JOIN Subjects AS SB ON SB.DepartmentID=D.DepartmentID
	INNER JOIN Results AS R ON R.SubjectID=SB.SubjectID
WHERE
	R.Score < 5
GROUP BY
	D.DepartmentName, SB.SubjectName
),
findMaxFail AS(
	SELECT MAX(numberOfFailExam) AS maxFail
	FROM countFail
)

SELECT 
	CF.DepartmentName,
	CF.SubjectName,
	CF.numberOfFailExam
FROM
	countFail AS CF
	INNER JOIN findMaxFail AS FM ON FM.maxFail=CF.numberOfFailExam
