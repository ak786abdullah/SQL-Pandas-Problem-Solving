import pandas as pd

def immediate_food_delivery(delivery: pd.DataFrame) -> pd.DataFrame:
    # 1. Get the first order for each customer
    first_orders=delivery.sort_values('order_date').drop_duplicates(subset='customer_id',keep='first')

    # 2. Find which of those first orders are immediate
    # We just filter the first_orders table directly!
    imidiate_orders=first_orders[first_orders['customer_pref_delivery_date'] == first_orders['order_date']]

    # 3. Calculate the percentage (* 100 to make it a true percentage out of 100)
    # Using len() is a slightly cleaner way to count rows in a DataFrame
    result=round(len(imidiate_orders) / len(first_orders) * 100,2)
    
    # 4. Convert to DataFrame using a dictionary
    return pd.DataFrame({"immediate_percentage" : [result]})