--1
SELECT E.empSSN, E.empName, D.depNum, D.depName
FROM tblDepartment D
JOIN tblEmployee E ON D.mgrSSN=E.empSSN
WHERE D.depName=N'Phòng Nghiên cứu và phát triển';

--2
SELECT P.proNum, P.proName, D.depName
FROM tblProject P
JOIN tblDepartment D ON P.depNum=D.depNum
WHERE D.depName=N'Phòng Nghiên cứu và phát triển';

--3
SELECT P.proNum, P.proName, D.depName
FROM tblProject P
JOIN tblDepartment D ON P.depNum=D.depNum
WHERE P.proName=N'ProjectB';

--4
SELECT E.empSSN, E.empName
FROM tblEmployee E
JOIN tblEmployee S ON E.supervisorSSN=S.empSSN
WHERE S.empName=N'Mai Duy An';

--5
SELECT E.empSSN, S.empName AS supervisorName
FROM tblEmployee E
JOIN tblEmployee S ON E.supervisorSSN=S.empSSN
WHERE E.empName=N'Mai Duy An';

--6
SELECT L.locNum, L.locName
FROM tblProject P
JOIN tblLocation L ON P.locNum=L.locNum
WHERE P.proName=N'ProjectA';

--7
SELECT P.proNum, P.proName
FROM tblProject P
JOIN tblLocation L ON P.locNum=L.locNum
WHERE L.locName=N'TP Hồ Chí Minh';

--8
SELECT D.depName, D.depBirthdate, E.empName
FROM tblDependent D
JOIN tblEmployee E ON D.empSSN=E.empSSN
WHERE DATEDIFF(YEAR, D.depBirthdate, GETDATE()) > 18;

--9
SELECT D.depName, D.depBirthdate, E.empName
FROM tblDependent D
JOIN tblEmployee E ON D.empSSN=E.empSSN
WHERE D.depSex='M';

--10
SELECT D.depNum, D.depName, L.locName
FROM tblDepartment D
JOIN tblDepLocation DL ON D.depNum=DL.depNum
JOIN tblLocation L ON DL.locNum=L.locNum
WHERE D.depName=N'Phòng Nghiên cứu và phát triển';

--11
SELECT P.proNum, P.proName, D.depName
FROM tblProject P
JOIN tblLocation L ON P.locNum=L.locNum
JOIN tblDepartment D ON P.depNum=D.depNum
WHERE L.locName=N'TP Hồ Chí Minh';

--12
SELECT E.empName, D.depName, D.depRelationship
FROM tblDependent D
JOIN tblEmployee E ON D.empSSN=E.empSSN
JOIN tblDepartment DEPT ON E.depNum=DEPT.depNum
WHERE D.depSex='F' AND DEPT.depName=N'Phòng Nghiên cứu và phát triển';

--13
SELECT E.empName, D.depName, D.depRelationship
FROM tblDependent D
JOIN tblEmployee E ON D.empSSN=E.empSSN
JOIN tblDepartment DEPT ON E.depNum=DEPT.depNum
WHERE DATEDIFF(YEAR, D.depBirthdate, GETDATE()) > 18
AND DEPT.depName=N'Phòng Nghiên cứu và phát triển';

--14
SELECT D.depSex AS Gender, COUNT(*) AS DependentCount
FROM tblDependent D
GROUP BY D.depSex;

--15
SELECT D.depRelationship AS Relationship, COUNT(*) AS DependentCount
FROM tblDependent D
GROUP BY D.depRelationship;

--16
SELECT D.depNum, D.depName, COUNT(DEP.depName) AS DependentCount
FROM tblDepartment D
LEFT JOIN tblEmployee E ON D.depNum=E.depNum
LEFT JOIN tblDependent DEP ON E.empSSN=DEP.empSSN
GROUP BY D.depNum, D.depName;

--17
SELECT TOP 1 D.depNum, D.depName, COUNT(DEP.depName) AS DependentCount
FROM tblDepartment D
LEFT JOIN tblEmployee E ON D.depNum=E.depNum
LEFT JOIN tblDependent DEP ON E.empSSN=DEP.empSSN
GROUP BY D.depNum, D.depName
ORDER BY DependentCount ASC;

--18
SELECT TOP 1 D.depNum, D.depName, COUNT(DEP.depName) AS DependentCount
FROM tblDepartment D
LEFT JOIN tblEmployee E ON D.depNum=E.depNum
LEFT JOIN tblDependent DEP ON E.empSSN=DEP.empSSN
GROUP BY D.depNum, D.depName
ORDER BY DependentCount DESC;

--19
SELECT E.empSSN, E.empName, D.depName, COALESCE(SUM(W.workHours), 0) AS TotalHours
FROM tblEmployee E
JOIN tblDepartment D ON E.depNum=D.depNum
LEFT JOIN tblWorksOn W ON E.empSSN=W.empSSN
GROUP BY E.empSSN, E.empName, D.depName;

--20
SELECT D.depNum, D.depName, COALESCE(SUM(W.workHours), 0) AS TotalHours
FROM tblDepartment D
LEFT JOIN tblEmployee E ON D.depNum=E.depNum
LEFT JOIN tblWorksOn W ON E.empSSN=W.empSSN
GROUP BY D.depNum, D.depName;

--21
SELECT TOP 1 E.empSSN, E.empName, COALESCE(SUM(W.workHours), 0) AS TotalHours
FROM tblEmployee E
LEFT JOIN tblWorksOn W ON E.empSSN=W.empSSN
GROUP BY E.empSSN, E.empName
ORDER BY TotalHours ASC;

--22
SELECT TOP 1 E.empSSN, E.empName, COALESCE(SUM(W.workHours), 0) AS TotalHours
FROM tblEmployee E
LEFT JOIN tblWorksOn W ON E.empSSN=W.empSSN
GROUP BY E.empSSN, E.empName
ORDER BY TotalHours DESC;

--23
SELECT E.empSSN, E.empName, D.depName
FROM tblEmployee E
JOIN tblDepartment D ON E.depNum=D.depNum
JOIN tblWorksOn W ON E.empSSN=W.empSSN
GROUP BY E.empSSN, E.empName, D.depName
HAVING COUNT(W.proNum) = 1;

--24
SELECT E.empSSN, E.empName, D.depName
FROM tblEmployee E
JOIN tblDepartment D ON E.depNum=D.depNum
JOIN tblWorksOn W ON E.empSSN=W.empSSN
GROUP BY E.empSSN, E.empName, D.depName
HAVING COUNT(W.proNum) = 2;

--25
SELECT E.empSSN, E.empName, D.depName
FROM tblEmployee E
JOIN tblDepartment D ON E.depNum=D.depNum
JOIN tblWorksOn W ON E.empSSN=W.empSSN
GROUP BY E.empSSN, E.empName, D.depName
HAVING COUNT(W.proNum) >= 2;

--26
SELECT P.proNum, P.proName, COUNT(W.empSSN) AS MemberCount
FROM tblProject P
LEFT JOIN tblWorksOn W ON P.proNum=W.proNum
GROUP BY P.proNum, P.proName;

--27
SELECT P.proNum, P.proName, COALESCE(SUM(W.workHours), 0) AS TotalHours
FROM tblProject P
LEFT JOIN tblWorksOn W ON P.proNum=W.proNum
GROUP BY P.proNum, P.proName;

--28
SELECT TOP 1 P.proNum, P.proName, COUNT(W.empSSN) AS MemberCount
FROM tblProject P
LEFT JOIN tblWorksOn W ON P.proNum=W.proNum
GROUP BY P.proNum, P.proName
ORDER BY MemberCount ASC;

--29
SELECT TOP 1 P.proNum, P.proName, COUNT(W.empSSN) AS MemberCount
FROM tblProject P
LEFT JOIN tblWorksOn W ON P.proNum=W.proNum
GROUP BY P.proNum, P.proName
ORDER BY MemberCount DESC;

-- 30. 
SELECT TOP 1 P.proNum, P.proName, COALESCE(SUM(W.workHours), 0) AS TotalHours
FROM tblProject P
LEFT JOIN tblWorksOn W ON P.proNum=W.proNum
GROUP BY P.proNum, P.proName
ORDER BY TotalHours ASC;

--31
SELECT TOP 1 P.proNum, P.proName, COALESCE(SUM(W.workHours), 0) AS TotalHours
FROM tblProject P
LEFT JOIN tblWorksOn W ON P.proNum=W.proNum
GROUP BY P.proNum, P.proName
ORDER BY TotalHours DESC;

--32
SELECT L.locName, COUNT(DL.depNum) AS DepartmentCount
FROM tblLocation L
LEFT JOIN tblDepLocation DL ON L.locNum=DL.locNum
GROUP BY L.locName;

--33
SELECT D.depNum, D.depName, COUNT(DL.locNum) AS LocationCount
FROM tblDepartment D
LEFT JOIN tblDepLocation DL ON D.depNum=DL.depNum
GROUP BY D.depNum, D.depName;

--34
SELECT TOP 1 D.depNum, D.depName, COUNT(DL.locNum) AS LocationCount
FROM tblDepartment D
LEFT JOIN tblDepLocation DL ON D.depNum=DL.depNum
GROUP BY D.depNum, D.depName
ORDER BY LocationCount DESC;

--35
SELECT TOP 1 D.depNum, D.depName, COUNT(DL.locNum) AS LocationCount
FROM tblDepartment D
LEFT JOIN tblDepLocation DL ON D.depNum=DL.depNum
GROUP BY D.depNum, D.depName
ORDER BY LocationCount ASC;

--36
SELECT TOP 1 L.locName, COUNT(DL.depNum) AS DepartmentCount
FROM tblLocation L
LEFT JOIN tblDepLocation DL ON L.locNum=DL.locNum
GROUP BY L.locName
ORDER BY DepartmentCount DESC;

--37
SELECT TOP 1 L.locName, COUNT(DL.depNum) AS DepartmentCount
FROM tblLocation L
LEFT JOIN tblDepLocation DL ON L.locNum=DL.locNum
GROUP BY L.locName
ORDER BY DepartmentCount ASC;

--38
SELECT TOP 1 E.empSSN, E.empName, COUNT(D.depName) AS DependentCount
FROM tblEmployee E
LEFT JOIN tblDependent D ON E.empSSN=D.empSSN
GROUP BY E.empSSN, E.empName
ORDER BY DependentCount DESC;

--39
SELECT TOP 1 E.empSSN, E.empName, COUNT(D.depName) AS DependentCount
FROM tblEmployee E
LEFT JOIN tblDependent D ON E.empSSN=D.empSSN
GROUP BY E.empSSN, E.empName
ORDER BY DependentCount ASC;

--40
SELECT E.empSSN, E.empName, D.depName AS DepartmentName
FROM tblEmployee E
JOIN tblDepartment D ON E.depNum=D.depNum
LEFT JOIN tblDependent DEP ON E.empSSN=DEP.empSSN
WHERE DEP.empSSN IS NULL;

--41
SELECT D.depNum, D.depName
FROM tblDepartment D
LEFT JOIN tblEmployee E ON D.depNum=E.depNum
LEFT JOIN tblDependent DEP ON E.empSSN=DEP.empSSN
WHERE DEP.empSSN IS NULL
GROUP BY D.depNum, D.depName;

--42
SELECT E.empSSN, E.empName, D.depName
FROM tblEmployee E
JOIN tblDepartment D ON E.depNum=D.depNum
LEFT JOIN tblWorksOn W ON E.empSSN=W.empSSN
WHERE W.empSSN IS NULL;

--43
SELECT D.depNum, D.depName
FROM tblDepartment D
LEFT JOIN tblEmployee E ON D.depNum=E.depNum
LEFT JOIN tblWorksOn W ON E.empSSN=W.empSSN
WHERE W.empSSN IS NULL
GROUP BY D.depNum, D.depName;

--44
SELECT D.depNum, D.depName
FROM tblDepartment D
LEFT JOIN tblEmployee E ON D.depNum=E.depNum
LEFT JOIN tblWorksOn W ON E.empSSN=W.empSSN AND W.proNum=(SELECT proNum FROM tblProject WHERE proName=N'ProjectA')
WHERE W.empSSN IS NULL
GROUP BY D.depNum, D.depName;

--45
SELECT D.depNum, D.depName, COUNT(P.proNum) AS ProjectCount
FROM tblDepartment D
LEFT JOIN tblProject P ON D.depNum=P.depNum
GROUP BY D.depNum, D.depName;

--46
SELECT TOP 1 D.depNum, D.depName, COUNT(P.proNum) AS ProjectCount
FROM tblDepartment D
LEFT JOIN tblProject P ON D.depNum=P.depNum
GROUP BY D.depNum, D.depName
ORDER BY ProjectCount ASC;

--47
SELECT TOP 1 D.depNum, D.depName, COUNT(P.proNum) AS ProjectCount
FROM tblDepartment D
LEFT JOIN tblProject P ON D.depNum = P.depNum
GROUP BY D.depNum, D.depName
ORDER BY ProjectCount DESC;

--48
SELECT D.depNum, D.depName, COUNT(DISTINCT E.empSSN) AS EmployeeCount, P.proName
FROM tblDepartment D
JOIN tblEmployee E ON D.depNum=E.depNum
JOIN tblWorksOn W ON E.empSSN=W.empSSN
JOIN tblProject P ON W.proNum=P.proNum
GROUP BY D.depNum, D.depName, P.proName
HAVING COUNT(DISTINCT E.empSSN) > 5;

--49
SELECT E.empSSN, E.empName
FROM tblEmployee E
JOIN tblDepartment D ON E.depNum=D.depNum
LEFT JOIN tblDependent DEP ON E.empSSN=DEP.empSSN
WHERE D.depName=N'Phòng Nghiên cứu và phát triển' AND DEP.empSSN IS NULL;

--50 
SELECT E.empSSN, E.empName, SUM(W.workHours) AS TotalHours
FROM tblEmployee E
LEFT JOIN tblDependent D ON E.empSSN=D.empSSN
LEFT JOIN tblWorksOn W ON E.empSSN=W.empSSN
WHERE D.empSSN IS NULL
GROUP BY E.empSSN, E.empName;

--51
SELECT E.empSSN, E.empName, COUNT(D.depName) AS DependentCount, SUM(W.workHours) AS TotalHours
FROM tblEmployee E
LEFT JOIN tblDependent D ON E.empSSN=D.empSSN
LEFT JOIN tblWorksOn W ON E.empSSN=W.empSSN
GROUP BY E.empSSN, E.empName
HAVING COUNT(D.depName) > 3;

--52
SELECT E.empSSN, E.empName, SUM(W.workHours) AS TotalHours
FROM tblEmployee E
JOIN tblEmployee S ON E.supervisorSSN=S.empSSN
LEFT JOIN tblWorksOn W ON E.empSSN=W.empSSN
WHERE S.empName=N'Mai Duy An'
GROUP BY E.empSSN, E.empName;