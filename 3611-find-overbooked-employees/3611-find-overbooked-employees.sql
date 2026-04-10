WITH heavymeeting AS (
    -- find weekly hours per week for each employee (WHER weekly_hours >=20)
    SELECT 
        employee_id,
        yearweek(meeting_date,1) AS weeks,
        SUM(duration_hours) as weekly_hours
    FROM 
        meetings
    GROUP BY 
        employee_id,weeks
    HAVING 
        SUM(duration_hours) >= 20
)
-- find number of heavy weeks for each employee (heavy weeks should be greater than 2 )
SELECT 
    e.employee_id,
    e.employee_name,
    e.department,
    COUNT(h.weeks) AS meeting_heavy_weeks
FROM 
    employees e
    JOIN heavymeeting h ON h.employee_id=e.employee_id
GROUP BY 
    e.employee_id,
    e.employee_name,
    e.department
HAVING 
    count(h.weeks)>=2
ORDER BY 
    meeting_heavy_weeks DESC,employee_name ASC;