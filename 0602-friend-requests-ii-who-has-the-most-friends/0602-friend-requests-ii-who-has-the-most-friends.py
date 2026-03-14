# Write a solution to find the people who have the most friends and the most friends number.

# The test cases are generated so that only one person has the most friends.
import pandas as pd

def most_friends(request_accepted: pd.DataFrame) -> pd.DataFrame:
   all_friends=pd.concat([request_accepted['requester_id'],request_accepted['accepter_id']]) 

   friend_counts=all_friends.value_counts().reset_index()

   friend_counts.columns = ['id','num']

   return friend_counts.head(1)