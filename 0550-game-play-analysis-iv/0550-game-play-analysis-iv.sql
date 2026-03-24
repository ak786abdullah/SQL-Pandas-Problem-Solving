-- Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words, you need to determine the number of players who logged in on the day immediately following their initial login, and divide it by the number of total player
WITH first_logins AS (
    SELECT 
        player_id,
        MIN(event_date) as first_login
    FROM 
        Activity 
    GROUP BY 
        player_id
),consec_logins AS (
    SELECT 
        COUNT(f.player_id) as num_logins
    FROM 
        Activity a 
        inner join first_logins f
        on a.player_id = f.player_id
        and f.first_login = date_sub(event_date,interval 1 day)

)
 SELECT 
    ROUND(
        (SELECT num_logins FROM consec_logins) / (SELECT COUNT(player_id) FROM first_logins)
        ,2) as fraction;