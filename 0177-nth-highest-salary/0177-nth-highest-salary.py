# Write a solution to find the nth highest distinct salary from the Employee table. If there are less than n distinct salaries, return null.
import pandas as pd

def nth_highest_salary(employee: pd.DataFrame, N: int) -> pd.DataFrame:
        top_n=employee['salary'].drop_duplicates().nlargest(N)

        highest_n=top_n.iloc[N-1] if len(top_n) == N else None

        return pd.DataFrame({f'getNthHighestSalary({N})' : [highest_n]})