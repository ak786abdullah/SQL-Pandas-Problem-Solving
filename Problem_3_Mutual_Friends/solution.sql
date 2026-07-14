-- Problem 3: Find Mutual Friends Between Two Users
-- You are analyzing a social network dataset at Google. Your task is to find mutual friends between two users, Karl and Hans.
-- There is only one user named Karl and one named Hans in the dataset.

-- TABLES
CREATE TABLE users(user_id INT, user_name varchar(30));
INSERT INTO users VALUES (1, 'Karl'), (2, 'Hans'), (3, 'Emma'), (4, 'Emma'), (5, 'Mike'), (6, 'Lucas'), (7, 'Sarah'), (8, 'Lucas'), (9, 'Anna'), (10, 'John');

CREATE TABLE friends(user_id INT, friend_id INT);
INSERT INTO friends VALUES (1,3),(1,5),(2,3),(2,4),(3,1),(3,2),(3,6),(4,7),(5,8),(6,9),(7,10),(8,6),(9,10),(10,7),(10,9);

-- SOLUTION
-- CONDITION: we have to find mutual friends of two users Karl and Hans (FRIENDS OF KARL ALSO FRIEND OF HANS)

WITH karl_friends AS ( 
 SELECT 
	friend_id 
FROM 
	friends
WHERE 
	user_id = (SELECT user_id FROM users WHERE user_name = 'Karl')
), 
hans_friends AS (
SELECT 
	friend_id 
FROM 
	friends
WHERE 
	user_id = (SELECT user_id FROM users WHERE user_name = 'Hans')
) 
SELECT 
	u.user_id ,
    u.user_name
FROM 
	users u 
	JOIN karl_friends kl ON u.user_id = kl.friend_id
    JOIN hans_friends hs ON u.user_id =hs.friend_id;