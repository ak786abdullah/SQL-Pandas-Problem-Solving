WITH RECURSIVE EmployeeLevel AS (
    SELECT 
        employee_id,
        employee_name,
        salary,
        1 as level 
    FROM 
        Employees 
    WHERE 
        manager_id IS NULL 

    UNION ALL 

    SELECT
        e.employee_id,
        e.employee_name,
        e.salary,
        el.level +1
    FROM 
        EmployeeLevel el 
        JOIN Employees e ON el.employee_id=e.manager_id
),subcordinate AS (
    SELECT 
        employee_id AS manager_id,
        employee_id AS sub_id,
        salary
    FROM 
        Employees

    UNION ALL 

    SELECT 
        s.manager_id,
        e.employee_id AS sub_id,
        e.salary
    FROM 
        subcordinate s
        JOIN Employees e ON s.sub_id=e.manager_id
)
SELECT 
    el.employee_id,
    el.employee_name,
    el.level,
    COUNT(s.sub_id) - 1 AS team_size,
    SUM(s.salary) AS budget 
FROM 
    EmployeeLevel el 
    JOIN subcordinate s ON el.employee_id=s.manager_id
GROUP BY 
    el.employee_id,
    el.employee_name,
    el.level 
ORDER BY 
    level ASC ,
    budget DESC,
    employee_name ASC;