# Write a solution to find employees who have the highest salary in each of the departments.

# Return the result table in any order.
import pandas as pd

def department_highest_salary(employee: pd.DataFrame, department: pd.DataFrame) -> pd.DataFrame:
    merged = pd.merge(department,employee,left_on='id',right_on='departmentId',suffixes=('_dept','_emp'))
    
    merged['salary_rank']=merged.groupby('name_dept')['salary'].rank(method='dense',ascending = False)
    top_earner=merged[merged['salary_rank']==1.0] 
    result=top_earner.rename(columns={'name_dept':'Department','name_emp':'Employee','salary':'Salary'})
    return result[['Department','Employee','Salary']] 