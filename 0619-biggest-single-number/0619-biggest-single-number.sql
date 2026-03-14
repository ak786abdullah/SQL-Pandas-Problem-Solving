-- A single number is a number that appeared only once in the MyNumbers table.

-- Find the largest single number. If there is no single number, report null.

SELECT
    max(num) as num
from (
    SELECT
        num
    from
        MyNumbers
    group by 
        num 
    having 
        count(num) = 1
) as single_number