-- Problem 4: Naive Forecast RMSE Calculation
-- Create a naive forecast for "distance per dollar" and calculate the RMSE.
-- RMSE = sqrt(mean(square(actual - forecast)))

-- TABLE
CREATE TABLE uber_request_logs(request_id int, request_date datetime, request_status varchar(10),
distance_to_travel float, monetary_cost float, driver_to_client_distance float);

INSERT INTO uber_request_logs VALUES (1,'2020-01-09','success', 70.59, 6.56,14.36), (2,'2020-01-24','success', 93.36, 22.68,19.9),
 (3,'2020-02-08','fail', 51.24, 11.39,21.32), (4,'2020-02-23','success', 61.58,8.04,44.26), (5,'2020-03-09','success', 25.04,7.19,1.74),
 (6,'2020-03-24','fail', 45.57, 4.68,24.19), (7,'2020-04-08','success', 24.45,12.69,15.91), (8,'2020-04-23','success', 48.22,11.2,48.82),
 (9,'2020-05-08','success', 56.63,4.04,16.08), (10,'2020-05-23','fail', 19.03,16.65,11.22), (11,'2020-06-07','fail', 81,6.56,26.6),
 (12,'2020-06-22','fail', 21.32,8.86,28.57), (13,'2020-07-07','fail', 14.74,17.76,19.33), (14,'2020-07-22','success',66.73,13.68,14.07),
 (15,'2020-08-06','success',32.98,16.17,25.34), (16,'2020-08-21','success',46.49,1.84,41.9), (17,'2020-09-05','fail', 45.98,12.2,2.46),
 (18,'2020-09-20','success',3.14,24.8,36.6), (19,'2020-10-05','success',75.33,23.04,29.99), (20,'2020-10-20','success', 53.76,22.94,18.74);

-- SOLUTION
WITH MONTHLY_AGGREGATES AS (
SELECT 
	date_format(request_date,'%Y-%m') AS year_months,
    sum(distance_to_travel) AS total_distance,
    sum(monetary_cost) AS total_monetary_cost
FROM 
	uber_request_logs
GROUP BY 
	date_format(request_date,'%Y-%m')
) ,
CURRENT_MONTH_DISTANCE_PER_DOLLAR AS (
SELECT 
	year_months ,
    total_distance / total_monetary_cost as current_month_distance_per_dollar
FROM 
MONTHLY_AGGREGATES
) , 
PREV_MONTH_DISTANCE_PER_DOLLAR AS (
SELECT 
	year_months,
    current_month_distance_per_dollar ,
    LAG(current_month_distance_per_dollar ,1) OVER (ORDER BY year_months) AS prev_month_distance_per_dollar
FROM 
	CURRENT_MONTH_DISTANCE_PER_DOLLAR 
)
SELECT
	 ROUND( sqrt(AVG(POWER((current_month_distance_per_dollar - prev_month_distance_per_dollar),2))),2) AS RMSE
FROM 
	PREV_MONTH_DISTANCE_PER_DOLLAR;