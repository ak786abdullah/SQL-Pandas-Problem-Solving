# Write your MySQL query statement below
WITH RECURSIVE PathCTE AS (
    -- Base Case: Initialize paths mapping every employee to their direct manager
    SELECT 
        employee_id, 
        manager_id, 
        1 AS level_distance, 
        salary
    FROM Employees
    
    UNION ALL
    
    -- Recursive Case: Traverse bottom-up to map employees to all indirect managers
    SELECT 
        p.employee_id, 
        e.manager_id, 
        p.level_distance + 1, 
        p.salary
    FROM PathCTE p
    INNER JOIN Employees e ON e.employee_id = p.manager_id
),
EmployeeLevels AS (
    -- Extract absolute hierarchical level by isolating the path length to the CEO
    SELECT 
        employee_id, 
        level_distance AS absolute_level
    FROM PathCTE
    WHERE manager_id IS NULL
),
ManagerAggregates AS (
    -- Aggregate team size and downward budget control by grouping on ancestor IDs
    SELECT 
        manager_id, 
        COUNT(*) AS team_size, 
        SUM(salary) AS total_descendant_salary
    FROM PathCTE
    WHERE manager_id IS NOT NULL
    GROUP BY manager_id
)
SELECT 
    e.employee_id, 
    e.employee_name, 
    el.absolute_level AS level, 
    COALESCE(ma.team_size, 0) AS team_size, 
    e.salary + COALESCE(ma.total_descendant_salary, 0) AS budget
FROM Employees e
INNER JOIN EmployeeLevels el ON e.employee_id = el.employee_id
LEFT JOIN ManagerAggregates ma ON e.employee_id = ma.manager_id
ORDER BY 
    level ASC, 
    budget DESC, 
    e.employee_name ASC;