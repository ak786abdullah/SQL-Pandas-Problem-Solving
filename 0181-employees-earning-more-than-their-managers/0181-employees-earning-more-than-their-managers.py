import pandas as pd

def find_employees(employee: pd.DataFrame) -> pd.DataFrame:
    # Perform the self-join (Inner join is correct here)
    # We join the table to itself to align employee salaries with manager salaries
    employee_df = pd.merge(employee, employee[['id','salary']], left_on = 'managerId', right_on = 'id', how = 'left',suffixes= ("_emp","_mngr"))

    final_df = employee_df[employee_df['salary_emp'] > employee_df['salary_mngr']]

    final_df.drop(['id_emp','salary_emp','managerId','salary_mngr','id_mngr'],axis = 1, inplace = True)
    final_df.rename(columns = {'name' : 'Employee'}, inplace = True)
    return final_df
    