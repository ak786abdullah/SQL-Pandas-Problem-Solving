-- Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words, you need to determine the number of players who logged in on the day immediately following their initial login, and divide it by the number of total players.

SELECT
    ROUND(COUNT(distinct player_id) / (select count(distinct player_id) from Activity),2 ) as fraction
FROM 
    Activity
WHERE 
    (player_id,date_sub(event_date,interval 1 day))
IN 
    (SELECT 
        player_id,min(event_date)
    FROM
       Activity
    GROUP BY 
        player_id)
