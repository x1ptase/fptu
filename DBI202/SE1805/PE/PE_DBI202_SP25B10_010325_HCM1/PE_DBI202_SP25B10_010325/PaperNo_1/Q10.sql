CREATE FUNCTION fn_students(@DepartmentID INT)
RETURNS TABLE
AS
RETURN
    SELECT 
        StudentID,
        StudentLastName,
        StudentFirstName,
        StudentEmail,
        StudentBirthday,
		StudentPhone,
        StudentAddress,
        DepartmentID,
        StudentScholarship
    FROM Students
	WHERE DepartmentID=@DepartmentID AND StudentScholarship > 0;

SELECT * FROM fn_students(2)
