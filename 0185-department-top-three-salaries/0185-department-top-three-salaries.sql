# Write your MySQL query statement below
WITH salary_rank AS (
    SELECT 
        d.id,
        d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary,
        DENSE_RANK() OVER (PARTITION BY d.id ORDER BY e.salary DESC) AS rnk
    FROM 
        Department d
        JOIN Employee e ON d.id=e.departmentId
)
SELECT 
    Department,
    Employee,
    Salary
FROM 
    salary_rank
WHERE 
    rnk<=3;
