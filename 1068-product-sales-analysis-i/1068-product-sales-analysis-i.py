# Write a solution to report the product_name, year, and price for each sale_id in the Sales table.

# Return the resulting table in any order.
import pandas as pd

def sales_analysis(sales: pd.DataFrame, product: pd.DataFrame) -> pd.DataFrame:
    
    # pd.merge defaults to an inner join
    merged=pd.merge(sales,product,on = 'product_id')

    # Filter for the requested columns
    return merged[['product_name','year','price']] 