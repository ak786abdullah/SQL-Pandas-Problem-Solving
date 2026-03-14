-- Write a solution to find the first login date for each player.

-- Return the result table in any order.

SELECT 
    player_id,
    min(event_date) as first_login
from
    activity 
group by
    player_id ;