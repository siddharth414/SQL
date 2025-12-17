Find the best-selling item for each month (no need to separate months by year). 
  The best-selling item is determined by the highest total sales amount, calculated as: total_paid = unitprice * quantity.
  A negative quantity indicates a return or cancellation (the invoice number begins with 'C'. To calculate sales, ignore returns and cancellations.
  Output the month, description of the item, and the total amount paid.

Table
online_retail
https://platform.stratascratch.com/coding/10172-best-selling-item?code_type=3


  

with cte as(
select month(invoicedate) as month, 
    description,
    sum(unitprice * quantity) as total_paid,
    dense_rank() over(partition by month(invoicedate) order by sum(unitprice * quantity) desc  ) as r
    from online_retail
    where left(invoiceno,1) != 'C'
    group by description ,  month(invoicedate) )
    
select month, description , total_paid from cte where r = 1
