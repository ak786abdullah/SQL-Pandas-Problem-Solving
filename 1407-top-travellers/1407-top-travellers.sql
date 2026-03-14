-- Write a solution to report the distance traveled by each user.

-- Return the result table ordered by travelled_distance in descending order, if two or more users traveled the same distance, order them by their name in ascending order.
select
    u.name ,
    ifnull(sum(distance) , 0) as travelled_distance 
from 
    users u 
    left join rides r 
    on u.id=r.user_id 
group by 
    u.id
order by 
    travelled_distance desc ,name asc ;