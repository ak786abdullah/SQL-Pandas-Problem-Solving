-- Write a solution to find the nth highest distinct salary from the Employee table. If there are less than n distinct salaries, return null.
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
with nth_salary as (
    SELECT
        id,
        salary,
        dense_rank() over (order by salary desc) as ranks 
    from
        employee
)
SELECT 
    MAX(salary) from nth_salary 
where 
    ranks = N
  );
END