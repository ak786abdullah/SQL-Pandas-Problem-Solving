# A single number is a number that appeared only once in the MyNumbers table.

# Find the largest single number. If there is no single number, report null.
import pandas as pd

def biggest_single_number(my_numbers: pd.DataFrame) -> pd.DataFrame:

    single_number=my_numbers.drop_duplicates(subset=['num'],keep=False)

    largest_single_number=single_number['num'].max() 

    return pd.DataFrame({"num":[largest_single_number]})