# Write your MySQL query statement below
SELECT query_name, Round(avg(rating/position),2) AS quality,
ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) 
as poor_query_percentage
FROM Queries
GROUP BY query_name
HAVING query_name is not null


