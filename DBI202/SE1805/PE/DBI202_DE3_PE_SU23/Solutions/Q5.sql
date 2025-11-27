SELECT D.department_id, D.department_name, MIN(E.salary) AS 'MIN(salary)'
FROM departments AS D
INNER JOIN employees AS E ON D.department_id=E.department_id
GROUP BY D.department_id, D.department_name
ORDER BY MIN(E.salary) ASC