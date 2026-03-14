-- Write a solution to find all the classes that have at least five students.

-- Return the result table in any order.

SELECT 
    class 
FROM 
    courses 
GROUP BY 
    class 
HAVING 
    count(class) >= 5;
