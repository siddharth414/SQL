Identify colleges with underweight and overweight athletes. Consider athletes with weight < 180 pounds as underweight and players with weight > 250 pounds as overweight. 
Output the college along with the total number of overweight and underweight players. 
If the college does not have any underweight/overweight players, leave the college out of the output. You can assume that each athlete's full name is unique on their college.

https://platform.stratascratch.com/coding/9658-underweightoverweight-athletes?code_type=3
  
SELECT
    college,
    SUM(CASE WHEN weight > 250 THEN 1 ELSE 0 END) AS overweight_players,
    SUM(CASE WHEN weight < 180 THEN 1 ELSE 0 END) AS underweight_players
FROM athletes
GROUP BY college
HAVING
    SUM(CASE WHEN weight > 250 THEN 1 ELSE 0 END) > 0
    OR
    SUM(CASE WHEN weight < 180 THEN 1 ELSE 0 END) > 0;
