-- Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.

-- Return the result table in any order.
SELECT
    u.unique_id ,e.name 
from 
    Employees e
    left join 
    EmployeeUNI u 
    using (id);
