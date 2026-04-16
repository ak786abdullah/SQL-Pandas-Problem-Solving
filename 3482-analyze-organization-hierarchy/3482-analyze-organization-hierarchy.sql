WITH RECURSIVE 
-- 1. Calculate the hierarchical level of each employee
EmployeeLevels AS (
    -- Base case: The CEO has no manager and is at level 1
    SELECT 
        employee_id, 
        employee_name, 
        salary, 
        1 AS level
    FROM Employees 
    WHERE manager_id IS NULL
    
    UNION ALL
    
    -- Recursive case: Employees reporting to the previous level
    SELECT 
        e.employee_id, 
        e.employee_name, 
        e.salary, 
        el.level + 1
    FROM Employees e
    JOIN EmployeeLevels el ON e.manager_id = el.employee_id
),
-- 2. Build all ancestor-descendant relationships
Subordinates AS (
    -- Base case: Every employee is connected to themselves
    -- This ensures their own salary is included in the budget and leaf nodes aren't dropped
    SELECT 
        employee_id AS manager_id, 
        employee_id AS sub_id, 
        salary
    FROM Employees
    
    UNION ALL
    
    -- Recursive case: Connect managers to their indirect reports
    SELECT 
        s.manager_id, 
        e.employee_id AS sub_id, 
        e.salary
    FROM Subordinates s
    JOIN Employees e ON s.sub_id = e.manager_id
)
-- 3. Aggregate the metrics and sort according to requirements
SELECT 
    el.employee_id, 
    el.employee_name, 
    el.level, 
    -- Subtract 1 because the recursive CTE includes the employee themselves
    COUNT(s.sub_id) - 1 AS team_size, 
    SUM(s.salary) AS budget
FROM EmployeeLevels el
JOIN Subordinates s ON el.employee_id = s.manager_id
GROUP BY 
    el.employee_id, 
    el.employee_name, 
    el.level
ORDER BY 
    el.level ASC, 
    budget DESC, 
    el.employee_name ASC;