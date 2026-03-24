-- Find all numbers that appear at least three times consecutively.

-- Return the result table in any order.
WITH sequence as (
    SELECT 
        num,
        lead(num) OVER (ORDER BY id) as second_num,
        lead(num,2) OVER (ORDER BY id) third_num
    FROM
        Logs
)
SELECT DISTINCT
    num AS ConsecutiveNums
FROM 
    sequence
WHERE 
    num=second_num AND num =third_num;