# Write a solution to report the distance traveled by each user.

# Return the result table ordered by travelled_distance in descending order, if two or more users traveled the same distance, order them by their name in ascending order.
import pandas as pd

def top_travellers(users: pd.DataFrame, rides: pd.DataFrame) -> pd.DataFrame:

    Rides=pd.merge(users,rides,left_on='id',right_on='user_id',how = 'left',suffixes=('_user','_rides'))

    travelled_distance=Rides.groupby(['id_user','name'],as_index=False).agg(travelled_distance=('distance','sum')).fillna(0).sort_values(by=['travelled_distance','name'],ascending=[False,True])
    
    return travelled_distance[['name','travelled_distance']]
    