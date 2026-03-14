# Write a solution to report the name and bonus amount of each employee who satisfies either of the following:

# The employee has a bonus less than 1000.
# The employee did not get any bonus.
# Return the result table in any order.

import pandas as pd

def employee_bonus(employee: pd.DataFrame, bonus: pd.DataFrame) -> pd.DataFrame:
    # Perform the left join
    merged = pd.merge(employee, bonus, on="empId", how="left")
    
    # Create a boolean mask for our two conditions
    # Use the bitwise OR operator (|) and wrap conditions in parentheses
    mask = (merged['bonus'] < 1000) | (merged['bonus'].isna())
    
    # Apply the mask and select the required columns
    return merged[mask][['name', 'bonus']]