import pandas as pd

def find_customer_referee(customer: pd.DataFrame) -> pd.DataFrame:
    # Condition 1: referee_id is not 2
    # Condition 2: referee_id is missing (NaN)
    mask = (customer['referee_id'] != 2) | (customer['referee_id'].isna())
    
    # Apply the mask and return only the 'name' column
    return customer[mask][['name']]
