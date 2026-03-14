# Each node in the tree can be one of three types:

# "Leaf": if the node is a leaf node.
# "Root": if the node is the root of the tree.
# "Inner": If the node is neither a leaf node nor a root node.
# Write a solution to report the type of each node in the tree.

# Return the result table in any order.
import pandas as pd
import numpy as np
def tree_node(tree: pd.DataFrame) -> pd.DataFrame:
    conditions=[
        tree['p_id'].isna().to_numpy(),
        tree['id'].isin(tree['p_id']).to_numpy()
        ]
    choice=['Root','Inner']
    tree['type']=np.select(conditions,choice,default='Leaf')
    return tree[['id','type']]

    
    