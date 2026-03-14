import pandas as pd

def sales_analysis(product: pd.DataFrame, sales: pd.DataFrame) -> pd.DataFrame:
    # 1. Group by product_id and find the earliest ('min') and latest ('max') sale dates
    date_ranges = sales.groupby('product_id')['sale_date'].agg(['min', 'max']).reset_index()
    
    # 2. Filter for products where the entire timeline falls within Q1 2019
    valid_products = date_ranges[
        (date_ranges['min'] >= '2019-01-01') & 
        (date_ranges['max'] <= '2019-03-31')
    ]
    
    # 3. Merge the valid product IDs back with the Product table to retrieve the names
    return pd.merge(valid_products[['product_id']], product[['product_id', 'product_name']], on='product_id')