import pandas as pd

def delete_duplicate_emails(person: pd.DataFrame) -> None:

    # Sort by ID first to guarantee 'first' is the smallest ID
    person.sort_values(by="id",ascending=True,inplace=True)

    # Use inplace=True to modify the original DataFrame
    person.drop_duplicates(subset=["email"],keep="first",inplace=True) 