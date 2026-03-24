-- Write a solution to find the nth highest distinct salary from the Employee table. If there are less than n distinct salaries, return null.
CREATE FUNCTION getNthHighestSalary (N INT) RETURNS INT
BEGIN 
    RETURN (
        WITH nth_salary AS (
            SELECT 
                salary ,
                DENSE_RANK() OVER (ORDER BY salary DESC ) as ranks
            FROM 
                Employee 
        )
        SELECT 
            distinct salary
        FROM 
            nth_salary
        WHERE 
            ranks=N

    );
    END