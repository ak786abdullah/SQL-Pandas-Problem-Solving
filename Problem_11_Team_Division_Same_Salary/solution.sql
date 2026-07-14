-- Problem 11: Divide Employees into Teams by Salary
-- Divide the employees into teams such that all the members on each team have the same salary.
-- Each team should consist of at least two employees.
-- All the employees of the same salary should be assigned to the same team.
-- Team's ID is assigned based on the rank of the team's salary (lowest salary = team_id = 1).

-- TABLE
CREATE TABLE Employees_ (
employee_id INT PRIMARY KEY,
name VARCHAR(50),
salary INT );

INSERT INTO Employees_ (employee_id, name, salary) VALUES
(2, 'Meir', 3000),(3, 'Michael', 3000),
(7, 'Addilyn', 7400),(8, 'Juan', 6100),
(9, 'Kannon', 7400);

-- SOLUTION
WITH distinct_salaries AS (
SELECT 
	salary 
FROM
	Employees_
GROUP BY 
	salary 
HAVING 
	count(salary) >= 2
),
EligiableEmployee AS (
SELECT 
	e.employee_id,e.name,e.salary
FROM 
	Employees_ e 
	JOIN distinct_salaries ds 
    ON ds.salary=e.salary
)
SELECT 
	employee_id,name,salary,
    dense_rank() OVER (order by salary) AS team_id
FROM
	EligiableEmployee;