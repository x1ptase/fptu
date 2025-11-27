CREATE FUNCTION Get_ManagerID(@id INT)
RETURNS INT
AS
BEGIN
	RETURN (SELECT manager_id FROM employees
		WHERE employee_id=@id)
END

--TEST
DECLARE @id INT = 101
SELECT @id AS EmployeeID, DBO.Get_ManagerID(@id) AS ManagerID