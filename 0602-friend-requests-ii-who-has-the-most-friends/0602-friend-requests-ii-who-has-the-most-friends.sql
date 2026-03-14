-- Write a solution to find the people who have the most friends and the most friends number.

-- The test cases are generated so that only one person has the most friends.
SELECT 
    id,
    count(*) as num 
FROM (
    SELECT 
        requester_id id 
    FROM RequestAccepted 

    UNION ALL 

    SELECT 
        accepter_id id 
    FROM 
        RequestAccepted 
) as all_friends 
group by 
    id
order by 
    num desc 
limit 
    1 
