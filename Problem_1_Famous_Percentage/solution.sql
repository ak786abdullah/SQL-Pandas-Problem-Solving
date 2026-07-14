-- Problem 1: Famous Percentage
-- A table named "famous" has two columns called user id and follower id. It represents each user ID has a particular
-- follower ID. These follower IDs are also users of Facebook / Meta. Then, find the famous percentage
-- of each user. 
-- Famous Percentage = (number of followers a user has / total number of users on the platform) * 100:

-- TABLE
create TABLE famous (user_id INT, follower_id INT) ;

INSERT INTO famous VALUES
(1, 2), (1, 3), (2, 4), (5, 1), (5, 3), 
(11, 7), (12, 8), (13, 5), (13, 10), 
(14, 12), (14, 3), (15, 14), (15, 13);

-- SOLUTION
-- Requirements:
-- we have to find total number of users and number of followers of each user 

WITH all_facebook_users AS (
	select
		user_id from famous
        
	UNION -- Automatically filters for distinct values
    
	select
		follower_id from famous -- followers are also users of facebook
) ,
followers_of_each_user AS (
	select 
		user_id ,
		count(follower_id) as followers -- number of followers
	from
		famous 
	group by -- for each user we use "group by clouse" 
		user_id 
) 
select 
	user_id , 
	round((followers / (select count(*) from all_facebook_users)) * 100,2) as famous_percentage
from 
	followers_of_each_user ;
