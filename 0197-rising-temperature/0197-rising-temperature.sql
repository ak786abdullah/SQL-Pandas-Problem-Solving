-- Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).

-- Return the result table in any order.

WITH previousData as (
select
    id,
    recordDate,
    temperature,
    LAG(temperature) OVER (order by recordDate) as prev_temp,
    LAG(recordDate) OVER (order by recordDate) as prev_date
from
    weather
)
select
    id 
from
    previousData 
where
    temperature > prev_temp
    And 
    datediff(recordDate , prev_date) = 1;