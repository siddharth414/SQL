https://platform.stratascratch.com/coding/10318-new-products?code_type=3

Calculate the net change in the number of products launched by companies in 2020 compared to 2019. 
Your output should include the company names and the net difference.
(Net difference = Number of products launched in 2020 - The number launched in 2019.)

with p_2019 as(
select company_name, 
    count(company_name) as c_19 from car_launches
    where year = 2019
    group by company_name)
    
, p_2020 as(
select company_name, 
    count(company_name) as c_20 from car_launches
    where year = 2020
    group by company_name)


select a.company_name , ( a.c_20 - b.c_19 ) as total_launch 
from p_2020 as a join p_2019 as b on a.company_name=b.company_name 
    
