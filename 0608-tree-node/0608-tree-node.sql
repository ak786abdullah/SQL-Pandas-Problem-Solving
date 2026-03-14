-- Each node in the tree can be one of three types:

-- "Leaf": if the node is a leaf node.
-- "Root": if the node is the root of the tree.
-- "Inner": If the node is neither a leaf node nor a root node.
-- Write a solution to report the type of each node in the tree.

-- Return the result table in any order.

SELECT 
    id,
    CASE 
        WHEN p_id is null THEN 'Root'
        WHEN id in (select p_id from Tree) THEN 'Inner'
        ELSE 'Leaf'
    END as type
FROM Tree;