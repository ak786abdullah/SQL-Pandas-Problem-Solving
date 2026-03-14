# Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words, you need to determine the number of players who logged in on the day immediately following their initial login, and divide it by the number of total players.
import pandas as pd

def gameplay_analysis(activity: pd.DataFrame) -> pd.DataFrame:
    total_player=activity['player_id'].nunique()

    first_login=activity.groupby('player_id')['event_date'].min().reset_index()

    first_login['targed_date']=first_login['event_date'] + pd.Timedelta(days=1) 

    retained_player=pd.merge(first_login,activity,left_on=['player_id','targed_date'],right_on=['player_id','event_date'])

    fraction=round(len(retained_player) / total_player,2)
     
    return pd.DataFrame ({'fraction' : [fraction]})
