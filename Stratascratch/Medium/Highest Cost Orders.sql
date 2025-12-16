Find the customers with the highest daily total order cost between 2019-02-01 and 2019-05-01. 
If a customer had more than one order on a certain day, sum the order costs on a daily basis. 
Output each customer's first name, total cost of their items, and the date. 
If multiple customers tie for the highest daily total on the same date, return all of them.
For simplicity, you can assume that every first name in the dataset is unique.

https://platform.stratascratch.com/coding/9915-highest-cost-orders?code_type=3

with cte as(
select
    a.first_name, sum(b.total_order_cost) as total_cost , b.order_date,
    dense_rank() over(partition by  b.order_date order by sum(b.total_order_cost) desc) as r
    from customers a 
        join orders b on a.id = b.cust_id
    where   b.order_date  between '2019-02-01' and '2019-05-01'  
    group by a.first_name,b.order_date)
    
select first_name, total_cost, order_date from cte where r = 1
        
