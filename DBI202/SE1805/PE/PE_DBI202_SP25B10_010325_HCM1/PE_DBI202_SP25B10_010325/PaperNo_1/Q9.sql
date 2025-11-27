CREATE PROCEDURE proc_report
    @deptname VARCHAR(50),
    @result INT OUTPUT
AS
BEGIN
    SELECT @result=COUNT(*)
    FROM Students AS S
    INNER JOIN Departments AS D ON D.DepartmentID=S.DepartmentID
    WHERE D.DepartmentName=@deptname
END


DECLARE @x int
EXEC proc_report 'Mathematics', @x output
SELECT @x AS 'result'