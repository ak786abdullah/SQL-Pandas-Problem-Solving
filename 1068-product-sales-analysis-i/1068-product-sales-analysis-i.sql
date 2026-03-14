-- Write a solution to report the product_name, year, and price for each sale_id in the Sales table.

-- Return the resulting table in any order.

SELECT 
    P.product_name,
    s.year,
    s.price
fROM
    sales s 
    join product p
    on s.product_id = p.product_id;