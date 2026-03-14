import pandas as pd

def combine_two_tables(person: pd.DataFrame, address: pd.DataFrame) -> pd.DataFrame:
    
    # Perform the left join
    result=pd.merge(person,address,on="personId",how="left")

    # Return only the requested columns
    return result[['firstName', 'lastName', 'city', 'state']] 