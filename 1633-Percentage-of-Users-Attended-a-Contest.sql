# Write your MySQL query statement below
/*select contest_id,(count(R.user_id)/3)*100 as percentage
    from Register R join Users U
    on R. user_id=U. user_id
group by contest_id
order by contest_id desc*/

SELECT contest_id, 
       ROUND((COUNT(R.user_id) * 100.0) / 
             (SELECT COUNT(*) FROM Users), 2) AS percentage
FROM Register R
JOIN Users U
ON R.user_id = U.user_id
GROUP BY contest_id
ORDER BY percentage DESC, contest_id ASC;
