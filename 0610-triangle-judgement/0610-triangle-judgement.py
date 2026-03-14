# Report for every three line segments whether they can form a triangle.

# Return the result table in any order.
import pandas as pd
import numpy as np
def triangle_judgement(triangle: pd.DataFrame) -> pd.DataFrame:
    condition=(
        (triangle['x'] + triangle['y'] > triangle['z']) &
        (triangle['z'] + triangle['y'] > triangle['x']) & 
        (triangle['x'] + triangle['z'] > triangle['y'])
    )
    triangle['triangle'] =np.where(condition,"Yes","No")
    return triangle 