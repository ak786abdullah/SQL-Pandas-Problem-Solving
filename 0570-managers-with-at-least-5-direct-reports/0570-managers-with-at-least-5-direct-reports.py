import pandas as pd

def find_managers(employee: pd.DataFrame) -> pd.DataFrame:
    # 1. Count the occurrences of each managerId 
    # .size() returns a Series where the index is the managerId and the value is the count
    report_counts = employee.groupby('managerId').size()
    
    # 2. Extract only the IDs of managers who have 5 or more reports
    valid_manager_ids = report_counts[report_counts >= 5].index
    
    # 3. Filter the original dataframe for employees whose 'id' is in our valid list
    return employee[employee['id'].isin(valid_manager_ids)][['name']]