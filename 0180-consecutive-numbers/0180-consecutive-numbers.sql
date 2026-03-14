-- Find all numbers that appear at least three times consecutively.

-- Return the result table in any order.

with sequencedlogs as (
SELECT 
    num, 
    lead(num) over (order by id) as l1,
    lead(num,2) over (order by id) as l2
FROM
    LOGS 
)
SELECT 
    distinct num as ConsecutiveNums
from 
sequencedlogs
where 
    num= l1 and l1=l2  ;
