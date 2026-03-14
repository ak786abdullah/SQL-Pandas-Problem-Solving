# Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return null (return None in Pandas).
import pandas as pd

def second_highest_salary(employee: pd.DataFrame) -> pd.DataFrame:
    top_two=employee['salary'].drop_duplicates().nlargest(2)


    SecondHighestSalary = top_two.iloc[-1] if len(top_two) == 2 else None
    
    return pd.DataFrame({'SecondHighestSalary': [SecondHighestSalary]})
    