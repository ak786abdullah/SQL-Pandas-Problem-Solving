# Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount.

# Return the result table in any order.
import pandas as pd

def list_products(products: pd.DataFrame, orders: pd.DataFrame) -> pd.DataFrame:

    orders_feb=orders[(orders['order_date'].between('2020-02-01', '2020-02-29'))] 
    
    sales_feb= pd.merge(products,orders_feb,on = 'product_id',how="inner")

   
    grouped=sales_feb.groupby('product_name',as_index=False)['unit'].sum()

    grouped=grouped[grouped['unit'] >= 100] 

    return grouped[['product_name','unit']]