# Write a solution to find the names of all the salespersons who did not have any orders related to the company with the name "RED".

# Return the result table in any order.
import pandas as pd

def sales_person(sales_person: pd.DataFrame, company: pd.DataFrame, orders: pd.DataFrame) -> pd.DataFrame:
    red_com=company[company['name'] == "RED"]

    #  Merge orders with red_com
    red_orders=pd.merge(orders,red_com,on ="com_id")

    #  Identify sales_ids who sold to "RED"
    red_sales_id=red_orders['sales_id'].unique()

    valid_sales_person=sales_person[~sales_person['sales_id'].isin(red_sales_id)]

    return valid_sales_person[['name']] 