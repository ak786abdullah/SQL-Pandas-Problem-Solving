-- Reformat the table such that there is a department id column and a revenue column for each month.

-- Return the result table in any order.
SELECT 
    id,
    SUM(IF(month = 'Jan', revenue, NULL)) AS Jan_revenue,
    SUM(IF(month = 'Feb', revenue, NULL)) AS Feb_revenue,
    SUM(IF(month = 'Mar', revenue, NULL)) AS Mar_revenue,
    SUM(IF(month = 'Apr', revenue, NULL)) AS Apr_revenue,
    SUM(IF(month = 'May', revenue, NULL)) AS May_revenue,
    SUM(IF(month = 'Jun', revenue, NULL)) AS Jun_revenue,
    SUM(IF(month = 'Jul', revenue, NULL)) AS Jul_revenue,
    SUM(IF(month = 'Aug', revenue, NULL)) AS Aug_revenue,
    SUM(IF(month = 'Sep', revenue, NULL)) AS Sep_revenue,
    SUM(IF(month = 'Oct', revenue, NULL)) AS Oct_revenue,
    SUM(IF(month = 'Nov', revenue, NULL)) AS Nov_revenue,
    SUM(IF(month = 'Dec', revenue, NULL)) AS Dec_revenue
FROM 
    Department
GROUP BY 
    id;