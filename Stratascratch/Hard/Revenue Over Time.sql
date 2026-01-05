
Find the 3-month rolling average of total revenue from purchases given a table with users, their purchase amount, 
and date purchased. Do not include returns which are represented by negative purchase values.
Output the year-month (YYYY-MM) and 3-month rolling average of revenue, sorted from earliest month to latest month.




WITH monthly_totals AS (
    SELECT   
        EXTRACT(YEAR FROM created_at) AS year,
        EXTRACT(MONTH FROM created_at) AS month,
        SUM(purchase_amt) AS total_revenue
    FROM amazon_purchases 
    WHERE purchase_amt > 0                  -- ignore returns
    GROUP BY EXTRACT(YEAR FROM created_at), EXTRACT(MONTH FROM created_at)
)

SELECT 
    CONCAT(year, '-', LPAD(month, 2, '0')) AS year_month,  -- YYYY-MM format
    AVG(total_revenue) OVER (
        ORDER BY year, month
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS rolling_3month_avg
FROM monthly_totals
ORDER BY year, month;
