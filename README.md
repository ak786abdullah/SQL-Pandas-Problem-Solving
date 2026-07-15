# SQL & Pandas Problem Solving

![Python](https://img.shields.io/badge/Python-3.8+-blue.svg)
![Pandas](https://img.shields.io/badge/Pandas-Data_Manipulation-150458.svg)
![SQL](https://img.shields.io/badge/SQL-Advanced_Queries-F80000.svg)
![Problems](https://img.shields.io/badge/Problems_Solved-70+-success.svg)
![Platforms](https://img.shields.io/badge/Platforms-LeetCode%20%7C%20HackerRank%20%7C%20GFG-orange.svg)

A structured collection of **90+ data problems** sourced from LeetCode, HackerRank, and GeeksForGeeks — each solved in both **SQL** and **Python (Pandas)**. Built to sharpen real-world data analysis skills and demonstrate interview-ready proficiency in two of the most in-demand data tools.

---

## What's Inside

Every problem folder contains a complete, self-contained solution covering a distinct business scenario or data manipulation challenge. Problems span topics like employee hierarchies, sales analytics, product pricing, customer behavior, and game play analysis — the kinds of problems that regularly appear in data analyst interviews.

Each solution is implemented twice:

- **SQL** — optimized relational query using standard SQL constructs
- **Python (Pandas)** — equivalent logic implemented programmatically with DataFrames

This dual approach isn't just for practice. It builds the intuition for *when* to use each tool — SQL for server-side, set-based operations; Pandas for flexible, in-memory transformations where programmatic control matters.

---

## Skills Demonstrated

### SQL
- Window functions: `RANK()`, `DENSE_RANK()`, `ROW_NUMBER()`, `LAG()`, `LEAD()`
- Common Table Expressions (CTEs) for readable, modular query logic
- Join types: `INNER`, `LEFT`, `RIGHT`, `SELF JOIN`, `FULL OUTER`
- Aggregation and filtering: `GROUP BY`, `HAVING`, conditional aggregations with `CASE WHEN`
- Subqueries and correlated subqueries
- Date-based filtering and time-series logic

### Pandas
- DataFrame merging and joining with `pd.merge()` and `pd.concat()`
- Grouping and aggregation with `.groupby()`, `.agg()`, `.transform()`
- Vectorized operations for efficient, loop-free transformations
- Handling nulls, deduplication, and data type normalization
- Applying window-style logic using `.rank()`, `.shift()`, and cumulative methods

---

## Problem List

| # | Problem | Topics |
|---|---------|--------|
| 175 | Combine Two Tables | LEFT JOIN, NULL handling |
| 176 | Second Highest Salary | Subquery, LIMIT/OFFSET |
| 177 | Nth Highest Salary | Dynamic SQL, Window functions |
| 178 | Rank Scores | `DENSE_RANK()` |
| 180 | Consecutive Numbers | Self-join, `LAG()` |
| 181 | Employees Earning More Than Managers | Self-join |
| 182 | Duplicate Emails | `GROUP BY`, `HAVING` |
| 183 | Customers Who Never Ordered | `LEFT JOIN`, `IS NULL` |
| 184 | Department Highest Salary | Correlated subquery, Window functions |
| 196 | Delete Duplicate Emails | DML, Self-join |
| 197 | Rising Temperature | `LAG()`, Date functions |
| 511 | Game Play Analysis I | `MIN()`, `GROUP BY` |
| 550 | Game Play Analysis IV | `LAG()`, retention logic |
| 570 | Managers with at Least 5 Direct Reports | `GROUP BY`, `HAVING`, JOIN |
| 577 | Employee Bonus | `LEFT JOIN`, `IS NULL` |
| 584 | Find Customer Referee | `IS NULL`, `OR` logic |
| 585 | Investments in 2016 | Multi-condition filtering |
| 586 | Customer Placing Largest Number of Orders | `GROUP BY`, `ORDER BY`, `LIMIT` |
| 595 | Big Countries | `OR`, filtering |
| 596 | Classes with at Least 5 Students | `GROUP BY`, `HAVING` |
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
| 1148 | Article Views I | Self-referencing filter |
| 1158 | Market Analysis I | LEFT JOIN, conditional aggregation |
| 1164 | Product Price at a Given Date | `CASE WHEN`, date filtering |
| 1179 | Reformat Department Table | Pivot / conditional aggregation |
| 1211 | Queries Quality and Percentage | `AVG()`, `CASE WHEN` |
| 1251 | Average Selling Price | Weighted average, date range join |
| 1327 | Products Ordered in a Period | Date filtering, aggregation |
| 1378 | Replace Employee ID with Unique Identifier | LEFT JOIN |
| 1407 | Top Travellers | LEFT JOIN, `COALESCE`, `ORDER BY` |

---

## Repository Structure

```
SQL-Pandas-Problem-Solving/
│
├── 0175-combine-two-tables/
│   ├── solution.sql
│   └── solution.py
│
├── 0176-second-highest-salary/
│   ├── solution.sql
│   └── solution.py
│
├── ...
│
└── 1407-top-travellers/
    ├── solution.sql
    └── solution.py
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

## About

This repository is part of an ongoing effort to build a practical, portfolio-ready foundation in data analytics. Problems are tracked and synced automatically using [LeetHub v4](https://github.com/gaulghost).

**Connect:** [LinkedIn](https://www.linkedin.com/in/muhammad-abdullah-a7861a3a2/) · [GitHub](https://github.com/ak786abdullah)
