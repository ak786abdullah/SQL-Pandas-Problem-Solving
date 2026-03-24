-- Write a solution to find all sales that occurred in the first year each product was sold.

-- For each product_id, identify the earliest year it appears in the Sales table.

-- Return all sales entries for that product in that year.

-- Return a table with the following columns: product_id, first_year, quantity, and price.
-- Return the result in any order.

WITH YearRank as (
    SELECT 
        product_id,
        year,
        quantity,
        price,
        dense_rank() over (partition by product_id order by year ) as year_number
    FROM 
        Sales
)

SELECT
    product_id,
    year as first_year,
    quantity,
    price 
FROM 
    YearRank 
WHERE 
    year_number=1;