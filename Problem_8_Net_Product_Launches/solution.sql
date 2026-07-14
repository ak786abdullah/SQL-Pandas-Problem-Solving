-- Problem 8: Net Difference in Product Launches 2020 vs 2019
-- Count the net difference between the number of products companies launched in 2020 with the previous year.
-- Output the name of the companies and net difference of net products released for 2020 compared to 2019.

-- TABLE
CREATE TABLE car_launches(year int, company_name varchar(15), product_name varchar(30));

INSERT INTO car_launches VALUES(2019,'Toyota','Avalon'),(2019,'Toyota','Camry'),(2020,'Toyota','Corolla'),(2019,'Honda','Accord'),(2019,'Honda','Passport'),
(2019,'Honda','CR-V'),(2020,'Honda','Pilot'),(2019,'Honda','Civic'),(2020,'Chevrolet','Trailblazer'),(2020,'Chevrolet','Trax'),(2019,'Chevrolet','Traverse'),
(2020,'Chevrolet','Blazer'),(2019,'Ford','Figo'),(2020,'Ford','Aspire'),(2019,'Ford','Endeavour'),(2020,'Jeep','Wrangler') ;

-- SOLUTION
WITH products_count AS (
SELECT 
	company_name,
    SUM(year=2020) as products_2020,
    SUM(year=2019) as products_2019
FROM 
	car_launches 
WHERE 
	year in (2020,2019) 
GROUP BY 
	company_name 
)
SELECT 
	company_name,
    (products_2020 - products_2019) AS net_difference
FROM 
	products_count
ORDER BY 
net_difference DESC;