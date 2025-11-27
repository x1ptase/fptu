
select e.employee_id, e.first_name + ', ' + e.last_name as [full_name], j.job_title, e.phone_number from employees as e
inner join jobs as j on e.job_id = j.job_id
where j.job_title = 'Programmer' and e.phone_number like '590%'
order by e.phone_number 
