# Write your MySQL query statement below
/*
select  Round(
    sum(
    case when DATEDIFF(A1.event_date,A2.event_date)=1 then 1 else 0 end
    )/count(distinct A1.player_id) , 2
) as fraction 
from Activity A1 join Activity A2
on A1.player_id = A2.player_id 
*/


SELECT 
    ROUND(
        SUM(CASE WHEN DATEDIFF(A1.event_date, A2.event_date) = 1 THEN 1 ELSE 0 END) * 1.0 
        / COUNT(DISTINCT A1.player_id), 2) AS fraction 
FROM Activity A1 
JOIN Activity A2 ON A1.player_id = A2.player_id
JOIN (
    -- Subquery to get the first login date for each player
    SELECT player_id, MIN(event_date) AS first_login_date
    FROM Activity
    GROUP BY player_id
) AS FirstLogins 
ON A1.player_id = FirstLogins.player_id 
WHERE A2.event_date = FirstLogins.first_login_date;
