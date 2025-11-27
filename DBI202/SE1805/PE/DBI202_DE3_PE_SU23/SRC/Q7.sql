
select c.country_id, c.country_name, COUNT(e.employee_id) as [number of employees] from countries as c
inner join locations as l on c.country_id = l.country_id
inner join departments as d on l.location_id = d.location_id
inner join employees as e on d.department_id = e.department_id
group by c.country_id, c.country_name
having COUNT(e.employee_id) >= 2
order by [number of employees] desc
