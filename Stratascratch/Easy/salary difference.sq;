Calculates the difference between the highest salaries in the marketing and engineering departments. Output just the absolute difference in salaries.

Tables
db_employee
db_dept

https://platform.stratascratch.com/coding/10308-salaries-differences?code_type=3

with a as (
select a.salary as sa, 1 from  db_employee a join db_dept b on a.department_id = b.id where 
b.department = 'marketing' order by a.salary desc limit 1),

b as (
select a.salary as sb , 1 from  db_employee a join db_dept b on a.department_id = b.id where 
b.department = 'engineering' order by a.salary desc limit 1)

select a.sa - b.sb as salary_difference from a join b on a.1 = b.1
