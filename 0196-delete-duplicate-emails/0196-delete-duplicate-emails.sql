-- Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.

-- For SQL users, please note that you are supposed to write a DELETE statement and not a SELECT one.

DELETE p1 
from person p1 join person p2
on p1.email = p2.email
where p1.id > p2.id ;  

# Alternative 

-- DELETE FROM person 
-- WHERE id NOT IN (
--     SELECT * FROM (
--         SELECT MIN(id)
--         FROM person 
--         GROUP BY email
--     ) AS tmp_table
-- );