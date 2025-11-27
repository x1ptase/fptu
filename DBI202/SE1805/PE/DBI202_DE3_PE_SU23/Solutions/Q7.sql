SELECT C.country_id, C.country_name, COUNT(E.employee_id) AS 'number of employees'
FROM countries AS C
INNER JOIN locations AS L ON L.country_id=C.country_id
INNER JOIN departments AS D ON D.location_id=L.location_id
INNER JOIN employees AS E ON E.department_id=D.department_id
GROUP BY C.country_id, C.country_name
HAVING COUNT(E.employee_id) >= 2 
ORDER BY COUNT(E.employee_id) DESC