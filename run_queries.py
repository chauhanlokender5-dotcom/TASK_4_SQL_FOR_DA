
#!/usr/bin/env python3
"""run_queries.py
Simple script to run the prepared queries against ecommerce.db and print/save results.
"""
import sqlite3, pandas as pd
conn = sqlite3.connect('ecommerce.db')
queries = {
    'top_users': """SELECT u.user_id, u.name, ROUND(SUM(o.quantity * o.price),2) AS total_spend
FROM users u JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.name
ORDER BY total_spend DESC
LIMIT 10;""",
    'arpu': """SELECT ROUND(AVG(user_total),2) AS arpu FROM (
  SELECT u.user_id, SUM(o.quantity * o.price) AS user_total
  FROM users u
  JOIN orders o ON u.user_id = o.user_id
  GROUP BY u.user_id
);"""
}
for name,q in queries.items():
    df = pd.read_sql_query(q, conn)
    print('\n===', name, '===\n')
    print(df.to_string(index=False))
    df.to_csv(f'{name}.csv', index=False)
print('\nDone. CSVs written to current directory.')
