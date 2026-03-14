-- Write a solution to find all sales that occurred in the first year each product was sold.

-- For each product_id, identify the earliest year it appears in the Sales table.

-- Return all sales entries for that product in that year.

-- Return a table with the following columns: product_id, first_year, quantity, and price.
-- Return the result in any order.

with YearRank as (
    SELECT 
        product_id,
        quantity,
        price,
        year,
        DENSE_RANK() OVER (partition by product_id order by year asc) as year_rank
    FROM
        Sales 
)
SELECT 
    product_id,
    quantity,
    year as first_year,
    price
FROM 
    YearRank 
WHERE 
    year_rank=1;
