# Write a solution to report all the duplicate emails
#Note that it's guaranteed that the email field is not NULL.

# Return the result table in any order.

Select
    email
from 
    person 
group by
    email 
having
    count(email) > 1 ;