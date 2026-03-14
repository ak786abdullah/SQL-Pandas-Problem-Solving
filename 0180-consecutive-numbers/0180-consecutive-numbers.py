# Find all numbers that appear at least three times consecutively.

# Return the result table in any order.
import pandas as pd

def consecutive_numbers(logs: pd.DataFrame) -> pd.DataFrame:  
    result = ( logs[(logs['num'] == logs['num'].shift(-1)) & (logs['num'].shift(-1) == logs['num'].shift(-2))][['num']]
    .drop_duplicates()
    .rename(columns={'num': 'ConsecutiveNums'}) ) 
    return result 