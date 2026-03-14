-- Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.

-- Return the result table in any order.

SELECT 
    p.project_id,  
    round(AVG(experience_years),2) as average_years 
FROM
    employee e 
    join project p 
    on e.employee_id=p.employee_id 
group by
    p.project_id ;