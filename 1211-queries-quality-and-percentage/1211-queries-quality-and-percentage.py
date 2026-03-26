import pandas as pd

def queries_stats(queries: pd.DataFrame) -> pd.DataFrame:
    return (
        queries
        .assign(
            quality_ratio=lambda x: x['rating'] / x['position'], # Added comma here
            poor_query=lambda x: (x['rating'] < 3) * 100
        )
        .groupby('query_name', as_index=False)
        .agg(
            quality=('quality_ratio', 'mean'), # Fixed typo 'quilty' -> 'quality'
            poor_query_percentage=('poor_query', 'mean')
        ) # Added missing closing parenthesis here
        .round({'quality': 2, 'poor_query_percentage': 2}) # Fixed typo here as well
    )