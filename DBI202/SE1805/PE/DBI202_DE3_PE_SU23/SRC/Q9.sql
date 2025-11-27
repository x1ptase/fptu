
create function Get_ManagerID(@id int)
returns int
as
begin
return (select manager_id from employees
where employee_id = @id)
end
