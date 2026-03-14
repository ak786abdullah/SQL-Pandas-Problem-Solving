# Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.

# Return the result table in any order.
import pandas as pd

def find_customers(customer: pd.DataFrame, product: pd.DataFrame) -> pd.DataFrame:
    total_product=len(product)

    customer_counts=customer.groupby('customer_id')['product_key'].nunique().reset_index(name='count')

    result=customer_counts[customer_counts['count']==total_product]
    return result[['customer_id']]