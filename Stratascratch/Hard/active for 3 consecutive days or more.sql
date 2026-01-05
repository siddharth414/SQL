Find all the users who were active for 3 consecutive days or more.

https://platform.stratascratch.com/coding/2054-consecutive-days?code_type=3

WITH cte1 AS (
    SELECT 
        user_id, 
        record_date, 
        DATEDIFF(
            record_date,
            LAG(record_date) OVER (PARTITION BY user_id ORDER BY record_date)
        ) AS df
    FROM (
        SELECT DISTINCT 
            user_id, 
            record_date 
        FROM sf_events
    ) AS t
),

cte2 AS (
    SELECT 
        user_id, 
        record_date, 
        SUM(
            CASE 
                WHEN df = 1 THEN 0 
                ELSE 1 
            END
        ) OVER (PARTITION BY user_id ORDER BY record_date) AS grp
    FROM cte1
)

SELECT user_id
FROM cte2
GROUP BY user_id, grp
HAVING COUNT(*) >= 3;
