-- Problem 2: Month-Over-Month Revenue Percentage Change
-- Given a table 'sf_transactions' of purchases by date, calculate the month-over-month percentage change in revenue.
-- The output should include the year-month date (YYYY-MM) and percentage change, rounded to the 2nd decimal point, 
-- and sorted from the beginning of the year to the end of the year.

-- TABLE
CREATE TABLE sf_transactions(id INT, created_at datetime, value INT, purchase_id INT);

INSERT INTO sf_transactions VALUES
(1, '2019-01-01 00:00:00',  172692, 43), (2,'2019-01-05 00:00:00',  177194, 36),(3, '2019-01-09 00:00:00',  109513, 30),
(4, '2019-01-13 00:00:00',  164911, 30),(5, '2019-01-17 00:00:00',  198872, 39), (6, '2019-01-21 00:00:00',  184853, 31),
(7, '2019-01-25 00:00:00',  186817, 26), (8, '2019-01-29 00:00:00',  137784, 22),(9, '2019-02-02 00:00:00',  140032, 25),
(10, '2019-02-06 00:00:00', 116948, 43), (11, '2019-02-10 00:00:00', 162515, 25), (12, '2019-02-14 00:00:00', 114256, 12),
(13, '2019-02-18 00:00:00', 197465, 48), (14, '2019-02-22 00:00:00', 120741, 20), (15, '2019-02-26 00:00:00', 100074, 49), 
(16, '2019-03-02 00:00:00', 157548, 19), (17, '2019-03-06 00:00:00', 105506, 16), (18, '2019-03-10 00:00:00', 189351, 46), 
(19, '2019-03-14 00:00:00', 191231, 29), (20, '2019-03-18 00:00:00', 120575, 44), (21, '2019-03-22 00:00:00', 151688, 47), 
(22, '2019-03-26 00:00:00', 102327, 18), (23, '2019-03-30 00:00:00', 156147, 25);

-- SOLUTION
-- Requirement: Monthly Revenue And Last Month Revenue To Calculate Month_Over_Month_Percentage

WITH MONTHLY_REVENUE AS (
	SELECT 
		date_format(created_at,'%Y-%m') AS year_months,
		SUM(value) AS monthly_revenue
	FROM 
	sf_transactions
    GROUP BY 
    date_format(created_at,'%Y-%m')
),
LAST_MONTH_REVENUE AS (
	SELECT 
		year_months,
        monthly_revenue,
        LAG(monthly_revenue) OVER (ORDER BY year_months) AS last_month_revenue 
	FROM 
		MONTHLY_REVENUE 
) 
SELECT 
	year_months,
    monthly_revenue,
    ROUND(((monthly_revenue - last_month_revenue) / NULLIF(last_month_revenue,0)) * 100,2) AS percentage_change
FROM
	LAST_MONTH_REVENUE
ORDER BY 
	year_months;