# Write a solution to find all the authors that viewed at least one of their own articles.

# Return the result table sorted by id in ascending order.
import pandas as pd

def article_views(views: pd.DataFrame) -> pd.DataFrame:
    views=views[views['viewer_id'] == views['author_id']]
    views=views.drop_duplicates(subset=['author_id'])
    result = views[['author_id']].sort_values(by = 'author_id').rename(columns = {'author_id':'id'})
    return result