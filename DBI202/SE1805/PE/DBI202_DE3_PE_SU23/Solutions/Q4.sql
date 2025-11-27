SELECT E.employee_id, E.first_name + ', ' + E.last_name AS 'full_name', J.job_title, E.phone_number
FROM employees AS E
INNER JOIN jobs AS J ON E.job_id=J.job_id
WHERE J.job_title='Programmer' AND E.phone_number LIKE '590%'
ORDER BY E.phone_number ASC