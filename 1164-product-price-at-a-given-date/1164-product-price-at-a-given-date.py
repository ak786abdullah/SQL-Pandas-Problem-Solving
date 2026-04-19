import pandas as pd

def price_at_given_date(products: pd.DataFrame) -> pd.DataFrame:
    # 1. Identify the master list of all unique products
    unique_products = products[['product_id']].drop_duplicates()
    
    # 2. Filter out future dates to isolate valid historical changes
    valid_changes = products[products['change_date'] <= '2019-08-16']
    
    # 3. Sort chronologically and extract the most recent price per product
    latest_prices = valid_changes.sort_values('change_date').drop_duplicates(subset=['product_id'], keep='last')
    
    # 4. Map the latest prices back to the master list using a Left Join
    result = pd.merge(unique_products, latest_prices[['product_id', 'new_price']], on='product_id', how='left')
    
    # 5. Apply the baseline assumption: nulls (no prior changes) default to 10
    result['new_price'] = result['new_price'].fillna(10).astype(int)
    
    # 6. Format the output to match the requested schema
    return result.rename(columns={'new_price': 'price'})