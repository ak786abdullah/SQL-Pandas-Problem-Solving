-- Write a solution to find all the authors that viewed at least one of their own articles.

-- Return the result table sorted by id in ascending order.

SELECT
    DISTINCT author_id as id
FROM 
    views 
where 
    author_id=viewer_id
order by 
    author_id asc;