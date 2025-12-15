Find the year which had the highest number of players. Output the year along with the number of players.

https://platform.stratascratch.com/coding/9658-underweightoverweight-athletes?code_type=3

WITH cte AS (
    SELECT
        year,
        COUNT(name) AS player_count,
        DENSE_RANK() OVER (ORDER BY COUNT(name) DESC) AS r
    FROM nfl_combine
    GROUP BY year
)
SELECT
    year,
    player_count
FROM cte
WHERE r = 1;
