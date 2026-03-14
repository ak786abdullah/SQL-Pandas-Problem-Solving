import pandas as pd

def rising_temperature(weather: pd.DataFrame) -> pd.DataFrame:

    # Sort by date to ensure order
    weather.sort_values(by="recordDate",ascending=True,inplace=True)

    # Compare Temperature with previous row
    high_temp = weather['temperature'] > weather['temperature'].shift(1)

    # Compare Date with previous row (Must be exactly 1 day difference)
    # We use .diff() which calculates (Current - Previous)
    date_diff = weather['recordDate'].diff().dt.days == 1

    # Filter: Both conditions must be True
    return weather[high_temp & date_diff][['id']]



    