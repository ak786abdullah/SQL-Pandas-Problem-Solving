import pandas as pd

def sales_analysis(sales: pd.DataFrame) -> pd.DataFrame:

    sales['year_rank']=sales.groupby('product_id')['year'].rank(method='dense',ascending=True)

    sales=sales[sales['year_rank']==1].rename(columns={'year' : 'first_year'})

    return sales[['product_id','first_year','quantity' ,'price']]
    