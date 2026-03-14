# Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.

# Return the result table in any order.
import pandas as pd

def project_employees_i(project: pd.DataFrame, employee: pd.DataFrame) -> pd.DataFrame:
    # 1. Join the tables
    merged = pd.merge(employee,project , on="employee_id")

    # 2. Group, aggregate, and round
    grouped=merged.groupby('project_id',as_index=False)[['experience_years']].mean().round(2)

    # 3. Rename the column to match the expected output and return
    return grouped.rename(columns={'experience_years': 'average_years'})