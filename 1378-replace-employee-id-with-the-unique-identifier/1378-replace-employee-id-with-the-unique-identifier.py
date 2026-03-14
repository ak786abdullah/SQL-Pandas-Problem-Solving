# Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.

# Return the result table in any order.
import pandas as pd

def replace_employee_id(employees: pd.DataFrame, employee_uni: pd.DataFrame) -> pd.DataFrame:
    unique_id=pd.merge(employees,employee_uni,on = 'id',how='left')
    return unique_id[['unique_id','name']]

    