
import pandas as pd

def duplicate_emails(person: pd.DataFrame) -> pd.DataFrame:
    duplicates=person.duplicated(subset=['email'],keep=False)

    return  person.loc[duplicates,['email']].drop_duplicates()