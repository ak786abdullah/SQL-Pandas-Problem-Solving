# Write a solution to find for each user, the join date and the number of orders they made as a buyer in 2019.

# Return the result table in any order.
import pandas as pd

def market_analysis(users: pd.DataFrame, orders: pd.DataFrame, items: pd.DataFrame) -> pd.DataFrame:
    # 1. Filter: Equivalent to `YEAR(order_date)=2019`
    orders_2019 = orders[orders['order_date'].dt.year == 2019]
    
    # 2. Aggregate: Equivalent to `GROUP BY buyer_id` and `COUNT(buyer_id)`
    order_counts = orders_2019.groupby('buyer_id').size().reset_index(name='orders_in_2019')
    
    # 3. Join: Equivalent to `Users u LEFT JOIN Orders o ON u.user_id = o.buyer_id`
    df = users.merge(order_counts, left_on='user_id', right_on='buyer_id', how='left')
    
    # 4. Clean up: Equivalent to `IFNULL(...)` and `u.user_id as buyer_id`
    df['orders_in_2019'] = df['orders_in_2019'].fillna(0).astype(int)
    df = df.rename(columns={'user_id': 'buyer_id','buyer_id':'n'})
    
    # Select the final columns
    return df[['buyer_id', 'join_date', 'orders_in_2019']]