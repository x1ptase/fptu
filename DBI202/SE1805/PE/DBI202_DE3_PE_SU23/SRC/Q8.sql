
create trigger Salary_Min_Max 
on employees
after update
as
begin
declare @luong_cu decimal(8, 2)
declare @luong_moi decimal(8, 2)
declare @luong_max decimal(8, 2)
declare @luong_min decimal(8, 2)
declare @ma_nhan_vien int

select @ma_nhan_vien = d.employee_id, @luong_cu = d.salary from deleted as d
select @luong_moi = i.salary from inserted as i

select @luong_min = j.min_salary, @luong_max = j.max_salary from deleted as d
inner join jobs as j on d.job_id = j.job_id

if(@luong_moi < @luong_min or @luong_moi > @luong_max)
begin
update employees
set
salary = @luong_cu
where employee_id = @ma_nhan_vien
end
end
