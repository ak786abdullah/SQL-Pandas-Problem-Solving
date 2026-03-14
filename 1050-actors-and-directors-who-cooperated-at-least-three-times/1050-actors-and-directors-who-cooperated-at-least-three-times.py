# Write a solution to find all the pairs (actor_id, director_id) where the actor has cooperated with the director at least three times.

# Return the result table in any order.
import pandas as pd

def actors_and_directors(actor_director: pd.DataFrame) -> pd.DataFrame:
    counts = actor_director[['actor_id','director_id']].value_counts().reset_index(name='cnt')
    result = counts[counts['cnt'] >= 3]
    return result[['actor_id','director_id']]