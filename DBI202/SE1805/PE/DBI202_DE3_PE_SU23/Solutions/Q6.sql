
WITH TABLE1 AS
(
SELECT employee_id FROM employees
EXCEPT
SELECT DISTINCT manager_id FROM employees
)

SELECT TOP 10 E.first_name, E.last_name
FROM TABLE1 AS T
INNER JOIN employees AS E ON T.employee_id=E.employee_id
ORDER BY E.last_name