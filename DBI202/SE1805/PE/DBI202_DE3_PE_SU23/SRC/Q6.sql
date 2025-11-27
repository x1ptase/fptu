
with table1 as
(
select employee_id from employees
except
select distinct manager_id from employees
)

select top 10 e.first_name, e.last_name from table1 as t
inner join employees as e on t.employee_id = e.employee_id 
order by e.last_name 

