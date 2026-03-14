-- Write a solution to find all the pairs (actor_id, director_id) where the actor has cooperated with the director at least three times.

-- Return the result table in any order.

SELECT 
    actor_id,director_id from ActorDirector
group by 
    actor_id , director_id 
having 
    count(*) >= 3;