#  SQL & Pandas Problem-Solving Repository

[![Python](https://img.shields.io/badge/Python-3.8+-blue.svg)](https://www.python.org/)
[![Pandas](https://img.shields.io/badge/Pandas-Data_Manipulation-150458.svg)](https://pandas.pydata.org/)
[![SQL](https://img.shields.io/badge/SQL-Advanced_Queries-F80000.svg)](https://en.wikipedia.org/wiki/SQL)
[![Author](https://img.shields.io/badge/Author-Muhammad_Abdullah-success.svg)](https://www.linkedin.com/in/your-linkedin-profile)

##  Project Overview

Welcome to my **SQL & Pandas Problem-Solving** repository. As a mathematically-trained Data Analyst, I believe that the ability to manipulate, clean, and extract insights from raw data is the cornerstone of effective business intelligence. 

This repository contains **44 distinct, complex data challenges**, carefully curated to test and expand upon advanced business logic. To demonstrate a holistic understanding of data engineering and analysis, **every single problem in this repository is solved using two completely different paradigms:**
1.  **Relational Database Queries:** Pure, optimized SQL.
2.  **Programmatic Data Wrangling:** Python's Pandas library.

Comparing these methodologies side-by-side highlights the strengths of each tool—whether it is the declarative power of SQL for server-side processing or the programmatic flexibility of Pandas for in-memory transformations.

##  Key Competencies Demonstrated

###  SQL Expertise
* **Window Functions:** Extensive use of `LAG()`, `LEAD()`, `RANK()`, `DENSE_RANK()`, and `ROW_NUMBER()` for running totals, moving averages, and top-N analyses.
* **Common Table Expressions (CTEs):** Breaking down incredibly complex, nested queries into readable, modular, and maintainable logic.
* **Advanced Joins:** Mastering `INNER`, `LEFT`, `RIGHT`, `FULL OUTER`, and complex `SELF JOINS` to map hierarchical data and resolve duplicate records.
* **Aggregations & Grouping:** Deep dives into `GROUP BY`, `HAVING`, and conditional aggregations (`CASE WHEN` within `SUM`/`COUNT`).

###  Pandas Expertise
* **Vectorized Operations:** Leveraging Pandas and NumPy for hardware-efficient, loop-free data transformations.
* **Data Merging & Concatenation:** Replicating complex SQL joins using `pd.merge()`, `pd.concat()`, and strategic index alignments.
* **Advanced Grouping:** Utilizing `.groupby()`, `.agg()`, and `.transform()` to perform multi-level aggregations and broadcast metrics back to original DataFrames.
* **Data Cleaning:** Handling missing values, implementing probabilistic imputation, applying regex for string manipulation, and standardizing varied data types.

##  Repository Structure

The repository is organized into **44 independent directories**. Each directory represents a unique business case or data manipulation challenge and contains:
* `problem_description.md`: A detailed explanation of the business scenario, input schemas, and the expected output.
* `solution.sql`: The optimized SQL query designed to resolve the challenge.
* `solution.py`: The Python script utilizing Pandas to achieve the exact same result programmatically.
* `dataset.csv` (where applicable): Sample data used to validate the logic.

```text
📦 SQL-Pandas-Problem-Solving
 ┣ 📂 01_Customer_Retention_Analysis
 ┣ 📂 02_Rolling_Average_Revenue
 ┣ 📂 03_Employee_Hierarchy_Mapping
 ┣ 📂 ...
 ┣ 📂 43_Duplicate_Record_Detection
 ┗ 📂 44_Cohort_Behavior_Tracking
```
###  Why This Matters

Translating mathematical concepts into logical data solutions is my core strength. By solving 44 specific scenarios in both SQL and Pandas, I have developed a deep intuition for when to push compute loads to the database (SQL) versus when to process data locally in memory (Python). This dual-faceted approach is critical for building scalable ETL pipelines, optimizing dashboards, and preparing pristine datasets for statistical modeling.
