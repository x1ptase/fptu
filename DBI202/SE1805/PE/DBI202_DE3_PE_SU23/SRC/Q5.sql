
select d.department_id, d.department_name, min(e.salary) as [MIN(salary)] from departments as d
inner join employees as e on d.department_id = e.department_id
group by d.department_id, d.department_name
order by min(e.salary)

