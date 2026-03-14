import pandas as pd

def game_analysis(activity: pd.DataFrame) -> pd.DataFrame:

    # Group and find Min (Result is a Series with player_id index)
    return activity.groupby("player_id",as_index=False).agg(first_login=("event_date","min"))
    