SELECT
	S.StudentID, 
	S.StudentFirstName,
	S.StudentLastName,
	SB.SubjectName,
	MAX(R.Score) AS [FinalScore]
FROM
	Students AS S
	INNER JOIN Results AS R ON R.StudentID=S.StudentID
	INNER JOIN Subjects AS SB ON SB.SubjectID=R.SubjectID
GROUP BY
	S.StudentID,
	S.StudentFirstName,
	S.StudentLastName,
	SB.SubjectName
ORDER BY
	StudentID ASC