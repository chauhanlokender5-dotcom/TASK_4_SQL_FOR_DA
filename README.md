
# Ecommerce SQL Analysis

**A professional, ready-to-upload GitHub project

**Author:** lokendra singh** demonstrating SQL-based data analysis on an ecommerce dataset.
Generated: 2025-09-27

## What's included
- `users.csv`, `products.csv`, `orders.csv` — synthetic dataset (CSV).
- `ecommerce.db` — SQLite database created from the CSVs.
- `queries.sql` — collection of SQL queries covering aggregations, joins, subqueries, views, and optimization hints.
- `run_queries.py` — Python script to run sample queries and export results as CSV.
- `images/` — screenshots of query outputs and an animated GIF (`revenue_build.gif`).
- `README.md` — this file.
- `LICENSE` — MIT license.

## Objective
This project fulfills Task 4: *SQL for Data Analysis*. It demonstrates:
- Use of `SELECT`, `WHERE`, `ORDER BY`, `GROUP BY`
- `JOIN` types and examples
- Subqueries and `VIEW` creation
- Aggregate functions (`SUM`, `AVG`)
- Query optimization via indexes

## How to use (one-step)
1. Download and extract the repo.
2. (Optional) Inspect CSVs or open `ecommerce.db` with any SQLite client (DB Browser for SQLite, DBeaver, etc).
3. Run the example Python script (requires Python 3.8+, pandas):
   ```bash
   pip install pandas matplotlib imageio
   python run_queries.py
   ```
   This will print results and write CSVs to the current directory.

## SQL examples
Open `queries.sql` to see load-bearing queries (top users, ARPU, sales by category, subquery examples, and view creation).

## Notes on optimization
- Indexes on `orders(user_id)` and `orders(product_id)` are created to speed up JOINs and aggregations.
- For larger datasets, consider ANALYZE / EXPLAIN plans and adding indexes for date filters.

## Screenshots & Media
Find ready screenshots of query outputs in `images/` and an animated GIF `images/revenue_build.gif` demonstrating category revenue build-up.

