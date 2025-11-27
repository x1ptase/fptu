DELETE FROM departments 
WHERE department_id IN (
	SELECT department_id FROM employees
	WHERE first_name='Alexander')