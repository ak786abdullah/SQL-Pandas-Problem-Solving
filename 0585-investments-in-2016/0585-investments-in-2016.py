# Write a solution to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who:

# have the same tiv_2015 value as one or more other policyholders, and
# are not located in the same city as any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).
# Round tiv_2016 to two decimal places.
import pandas as pd

def find_investments(insurance: pd.DataFrame) -> pd.DataFrame:
    # 'keep=False' marks all identical tiv_2015 values as True
    same_tiv_2015=insurance.duplicated(subset=['tiv_2015'],keep=False)

    # The '~' operator inverts the logic: it marks unique locations as True
    unique_location=~insurance.duplicated(subset=['lat','lon'],keep=False)

    # Filter the dataframe directly
    valid_investment=insurance[(same_tiv_2015) & (unique_location)]

    # Calculate the final sum
    total_value=round(valid_investment['tiv_2016'].sum(),2)

    return pd.DataFrame({'tiv_2016':[total_value]})