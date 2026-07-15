# SQL & Pandas Problem Solving

![Python](https://img.shields.io/badge/Python-3.8+-blue.svg)
![Pandas](https://img.shields.io/badge/Pandas-Data_Manipulation-150458.svg)
![SQL](https://img.shields.io/badge/SQL-Advanced_Queries-F80000.svg)
![Problems](https://img.shields.io/badge/Problems_Solved-90+-success.svg)
![Platforms](https://img.shields.io/badge/Platforms-LeetCode%20%7C%20HackerRank%20%7C%20GFG-orange.svg)

A structured collection of **90+ data problems** sourced from LeetCode, HackerRank, and GeeksForGeeks — each solved in both **SQL** and **Python (Pandas)**. Built to sharpen real-world data analysis and database querying skills.

---

## What's Inside

Every problem folder contains a complete, self-contained solution covering a distinct business scenario or data manipulation challenge. Problems span topics like employee hierarchies, sales analytics, game play analysis, user behavior patterns, and more.

Each solution is implemented twice:

- **SQL** — optimized relational query using standard SQL constructs
- **Python (Pandas)** — equivalent logic implemented programmatically with DataFrames

This dual approach isn't just for practice. It builds the intuition for *when* to use each tool — SQL for server-side, set-based operations; Pandas for flexible, in-memory transformations where programming elegance matters.

---

## Skills Demonstrated

### SQL
- Window functions: `RANK()`, `DENSE_RANK()`, `ROW_NUMBER()`, `LAG()`, `LEAD()`
- Common Table Expressions (CTEs) for readable, modular query logic
- Join types: `INNER`, `LEFT`, `RIGHT`, `SELF JOIN`, `FULL OUTER`
- Aggregation and filtering: `GROUP BY`, `HAVING`, conditional aggregations with `CASE WHEN`
- Subqueries and correlated subqueries
- Date-based filtering and time-series logic
- Pivot and unpivot operations

### Pandas
- DataFrame merging and joining with `pd.merge()` and `pd.concat()`
- Grouping and aggregation with `.groupby()`, `.agg()`, `.transform()`
- Vectorized operations for efficient, loop-free transformations
- Handling nulls, deduplication, and data type normalization
- Applying window-style logic using `.rank()`, `.shift()`, and cumulative methods
- String operations and pattern matching

---

## Problem List

| # | Problem | Topics |
|---|---------|--------|
| 67 | Find Customer Referee | NULL handling, `OR` logic |
| 69 | Game Play Analysis IV | `LAG()`, retention logic |
| 175 | Combine Two Tables | LEFT JOIN, NULL handling |
| 176 | Second Highest Salary | Subquery, LIMIT/OFFSET |
| 177 | Nth Highest Salary | Dynamic SQL, Window functions |
| 178 | Rank Scores | `DENSE_RANK()` |
| 180 | Consecutive Numbers | Self-join, `LAG()` |
| 181 | Employees Earning More Than Managers | Self-join |
| 182 | Duplicate Emails | `GROUP BY`, `HAVING` |
| 183 | Customers Who Never Ordered | `LEFT JOIN`, `IS NULL` |
| 184 | Department Highest Salary | Correlated subquery, Window functions |
| 185 | Department Top Three Salaries | Window functions, ranking |
| 196 | Delete Duplicate Emails | DML, Self-join |
| 197 | Rising Temperature | `LAG()`, Date functions |
| 262 | Trips and Users | JOIN, conditional logic |
| 511 | Game Play Analysis I | `MIN()`, `GROUP BY` |
| 550 | Game Play Analysis IV | `LAG()`, retention logic |
| 570 | Managers with at Least 5 Direct Reports | `GROUP BY`, `HAVING`, JOIN |
| 577 | Employee Bonus | `LEFT JOIN`, `IS NULL` |
| 584 | Find Customer Referee | `IS NULL`, `OR` logic |
| 585 | Investments in 2016 | Multi-condition filtering |
| 586 | Customer Placing Largest Number of Orders | `GROUP BY`, `ORDER BY`, `LIMIT` |
| 595 | Big Countries | `OR`, filtering |
| 596 | Classes with at Least 5 Students | `GROUP BY`, `HAVING` |
| 601 | Human Traffic of Stadium | `LAG()`, consecutive logic |
| 602 | Friend Requests II | `UNION ALL`, aggregation |
| 607 | Sales Person | `NOT IN`, multi-table joins |
| 608 | Tree Node | `CASE WHEN`, hierarchical data |
| 610 | Triangle Judgement | `CASE WHEN`, conditional logic |
| 619 | Biggest Single Number | Subquery, `MAX` with condition |
| 620 | Not Boring Movies | Filtering, modulo operator |
| 626 | Exchange Seats | `CASE WHEN`, `MOD()` |
| 1045 | Customers Who Bought All Products | `GROUP BY`, `HAVING COUNT DISTINCT` |
| 1050 | Actors and Directors Cooperated 3+ Times | `GROUP BY`, `HAVING` |
| 1068 | Product Sales Analysis I | JOIN, filtering |
| 1070 | Product Sales Analysis III | Window functions, first-year logic |
| 1075 | Project Employees I | `AVG()`, JOIN |
| 1084 | Sales Analysis III | Date filtering, `NOT IN` |
| 1141 | User Activity for the Past 30 Days I | Date filtering, aggregation |
| 1148 | Article Views I | Self-referencing filter |
| 1158 | Market Analysis I | LEFT JOIN, conditional aggregation |
| 1164 | Product Price at a Given Date | `CASE WHEN`, date filtering |
| 1174 | Immediate Food Delivery II | Percentage calculation |
| 1179 | Reformat Department Table | Pivot / conditional aggregation |
| 1182 | Game Play Analysis IV | Window functions, retention |
| 1193 | Monthly Transactions I | Date extraction, aggregation |
| 1204 | Last Person to Fit in the Bus | Cumulative sum, ordering |
| 1211 | Queries Quality and Percentage | `AVG()`, `CASE WHEN` |
| 1251 | Average Selling Price | Weighted average, date range join |
| 1321 | Restaurant Growth | Running totals, date functions |
| 1327 | Products Ordered in a Period | Date filtering, aggregation |
| 1341 | Movie Rating | Window functions, ranking |
| 1378 | Replace Employee ID with Unique Identifier | LEFT JOIN |
| 1393 | Capital Gain/Loss | Window functions, aggregation |
| 1407 | Top Travellers | LEFT JOIN, `COALESCE`, `ORDER BY` |
| 1907 | Count Salary Categories | `CASE WHEN`, conditional counting |
| 1934 | Confirmation Rate | Conditional aggregation |
| 3421 | Find Students Who Improved | Window functions, comparison |
| 3451 | Find Invalid IP Addresses | String patterns, validation |
| 3475 | DNA Pattern Recognition | String matching |
| 3482 | Analyze Organization Hierarchy | Recursive CTEs |
| 3497 | Analyze Subscription Conversion | Window functions, funnel analysis |
| 3521 | Find Product Recommendation Pairs | Self-join, filtering |
| 3554 | Find Category Recommendation Pairs | Multi-table joins |
| 3564 | Seasonal Sales Analysis | Time-series analysis |
| 3580 | Find Consistently Improving Employees | Window functions, trend analysis |
| 3586 | Find COVID Recovery Patients | Date logic, recovery status |
| 3601 | Find Drivers with Improved Fuel Efficiency | Window functions, improvement |
| 3611 | Find Overbooked Employees | Overlap detection |
| 3626 | Find Stores with Inventory Imbalance | Conditional aggregation |

### Custom Problems (GFG, HackerRank)

| # | Problem | Topics |
|---|---------|--------|
| 1 | Famous Percentage | Percentage calculation, aggregation |
| 2 | Month Over Month Revenue | Time-series analysis, growth |
| 3 | Mutual Friends | Set operations, intersection |
| 4 | Naive Forecast RMSE | Statistical calculations |
| 5 | Budget Per Employee | Aggregation, division |
| 6 | Beds Per Nationality | Grouping, filtering |
| 7 | Friday Average Spending | Day-based filtering, averages |
| 8 | Net Product Launches | Counting, logic |
| 9 | Oscar Winnings by Genre | Aggregation, categorization |
| 10 | Returning Active Users | Retention, filtering |
| 11 | Team Division Same Salary | Grouping, edge cases |
| 12 | Number of Transactions Per Product | Aggregation |
| 13 | Salary Difference Departments | Comparative analysis |
| 14 | Hotel Reviews Count | Text operations, counting |
| 15 | Gmail Email Users | Pattern matching |
| 16 | Invalid Transactions December | Filtering, validation |
| 17 | Top Business Purposes | Ranking, aggregation |
| 18 | Highest Paid Job Titles | Ranking, filtering |
| 19 | Session Order Analysis | Window functions |
| 20 | Download Analysis | User behavior |
| 21 | Managers Five Direct Reports | Aggregation, filtering |
| 22 | Employee Salary Comparison | Comparative analysis |
| 23 | Amazon Exclusive Products | Exclusivity logic |
| 24 | Third Highest Customer | Ranking |
| 30 | Employees Earning More Than Managers | Self-join |

---

## Repository Structure

```
SQL-Pandas-Problem-Solving/
│
├── 0067-find-customer-referee/
├── 0069-game-play-analysis-iv/
├── 0175-combine-two-tables/
├── ... (LeetCode problems)
│
├── Problem_1_Famous_Percentage/
├── Problem_2_Month_Over_Month_Revenue/
├── ... (GFG & HackerRank problems)
│
└── README.md
```

Each folder is named with the problem number and title for easy navigation. Solutions are standalone — no shared dependencies or setup required.

---

## How to Use This Repo

**Browse by topic** — use the problem list above to find challenges covering a specific concept (e.g., window functions, self-joins, pivot logic).

**Compare approaches** — open the `.sql` and `.py` files side-by-side to see how the same logic translates across paradigms.

**Run locally** — SQL solutions are compatible with MySQL (as used on LeetCode). Python solutions require `pandas` and `numpy`.

```bash
pip install pandas numpy
```

---

## Key Concepts Covered

- **Window Functions**: Master `RANK()`, `DENSE_RANK()`, `ROW_NUMBER()`, `LAG()`, `LEAD()`, and cumulative operations
- **Joins**: Deep dive into INNER, LEFT, RIGHT, SELF JOIN, and FULL OUTER joins
- **Subqueries**: Correlated and non-correlated subqueries, scalar subqueries
- **Aggregation**: GROUP BY, HAVING, conditional aggregation with CASE WHEN
- **CTEs**: Common Table Expressions for modular, readable queries
- **Date Operations**: Filtering, extraction, interval calculations
- **Set Operations**: UNION, UNION ALL, INTERSECT
- **Text Operations**: Pattern matching, string functions
- **Pivot Operations**: Transforming rows to columns and vice versa

---

## About

This repository is part of an ongoing effort to build a practical, portfolio-ready foundation in data analytics. Problems are tracked and synced automatically using [LeetHub v4](https://github.com/arunbang/LeetHub-2.0).

**Connect:** [LinkedIn](https://www.linkedin.com/in/muhammad-abdullah-a7861a3a2/) · [GitHub](https://github.com/ak786abdullah)
