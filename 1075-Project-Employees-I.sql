# Write your MySQL query statement below
SELECT project_id , Round(avg(experience_years ),2) AS average_years 
FROM Project P INNER JOIN Employee E 
ON P.employee_id  = E.employee_id 
GROUP BY project_id  
