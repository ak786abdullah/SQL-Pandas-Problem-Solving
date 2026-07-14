-- Problem 24: Third Highest Total Transaction Amount Customer
-- American Express is reviewing their customers' transactions.
-- Find the customer who has the third highest total transaction amount.
-- Use dense_rank() for ranking with no gaps between subsequent ranks.

-- TABLES
CREATE TABLE customers (id INT,first_name VARCHAR(50),last_name VARCHAR(50),city VARCHAR(100),address VARCHAR(200),phone_number VARCHAR(20));

INSERT INTO customers (id, first_name, last_name, city, address, phone_number) VALUES(1, 'Jill', 'Doe', 'New York', '123 Main St', '555-1234'),(2, 'Henry', 'Smith', 'Los Angeles', '456 Oak Ave', '555-5678'),(3, 'William', 'Johnson', 'Chicago', '789 Pine Rd', '555-8765'),(4, 'Emma', 'Daniel', 'Houston', '321 Maple Dr', '555-4321'),(5, 'Charlie', 'Davis', 'Phoenix', '654 Elm St', '555-6789');

CREATE TABLE card_orders (order_id INT,cust_id INT,order_date DATETIME,order_details VARCHAR(255),total_order_cost INT);

INSERT INTO card_orders (order_id, cust_id, order_date, order_details, total_order_cost) VALUES(1, 1, '2024-11-01 10:00:00', 'Electronics', 200),(2, 2, '2024-11-02 11:30:00', 'Groceries', 150),(3, 1, '2024-11-03 15:45:00', 'Clothing', 120),(4, 3, '2024-11-04 09:10:00', 'Books', 90),(8, 3, '2024-11-08 10:20:00', 'Groceries', 130),(9, 1, '2024-11-09 12:00:00', 'Books', 180),(10, 4, '2024-11-10 11:15:00', 'Electronics', 200),(11, 5, '2024-11-11 14:45:00', 'Furniture', 150),(12, 2, '2024-11-12 09:30:00', 'Furniture', 180);

-- SOLUTION
WITH customer_rank AS (
SELECT 
	c.id AS customer_id,
	c.first_name AS first_name,
    c.last_name AS last_name,
    SUM(o.total_order_cost) AS transaction_amount,
    DENSE_RANK() OVER (ORDER BY SUM(o.total_order_cost) DESC) AS rnk
FROM 
	customers c 
    JOIN card_orders o ON c.id=o.cust_id
GROUP BY 
	c.id,c.first_name,c.last_name
)
SELECT
	customer_id,
    first_name,
    last_name,
    transaction_amount
FROM 
	customer_rank 
WHERE 
	rnk =3;