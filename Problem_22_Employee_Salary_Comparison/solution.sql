-- Problem 22: Employee Salary Comparison with Manager and Department Average
-- Compare each employee's salary to their manager's and the average department salary (excluding the manager's salary).
-- Display the department, employee ID, employee's salary, manager's salary, and department average salary.
-- Order by department, then by employee salary (highest to lowest).

-- TABLE
CREATE TABLE employee_o (id INT PRIMARY KEY,first_name VARCHAR(50),last_name VARCHAR(50),age INT,gender VARCHAR(10),
employee_title VARCHAR(50),department VARCHAR(50),salary INT,manager_id INT);

INSERT INTO employee_o (id, first_name, last_name, age, gender, employee_title, department, salary, manager_id) VALUES(1, 'Alice', 'Smith', 45, 'F', 'Manager', 'HR', 9000, 1),(2, 'Bob', 'Johnson', 34, 'M', 'Assistant', 'HR', 4500, 1),(3, 'Charlie', 'Williams', 28, 'M', 'Coordinator', 'HR', 4800, 1),(4, 'Diana', 'Brown', 32, 'F', 'Manager', 'IT', 12000, 4),(5, 'Eve', 'Jones', 27, 'F', 'Analyst', 'IT', 7000, 4),(6, 'Frank', 'Garcia', 29, 'M', 'Developer', 'IT', 7500, 4),(7, 'Grace', 'Miller', 30, 'F', 'Manager', 'Finance', 10000, 7),(8, 'Hank', 'Davis', 26, 'M', 'Analyst', 'Finance', 6200, 7),(9, 'Ivy', 'Martinez', 31, 'F', 'Clerk', 'Finance', 5900, 7),(10, 'John', 'Lopez', 36, 'M', 'Manager', 'Marketing', 11000, 10),(11, 'Kim', 'Gonzales', 29, 'F', 'Specialist', 'Marketing', 6800, 10),(12, 'Leo', 'Wilson', 27, 'M', 'Coordinator', 'Marketing', 6600, 10);

-- SOLUTION
SELECT 
	e.department as Department ,
    e.id as Employee_Id,
    e.salary as Employee_Salary,
    mgr.salary as Manager_Salary ,
    AVG(CASE WHEN e.id !=e.manager_id THEN  e.salary end ) OVER (partition by e.department) as avg_department_salary
FROM 
	employee_o e 
    JOIN 
	employee_o mgr ON e.manager_id =mgr.id 
ORDER BY 
	e.department,
    e.salary DESC;