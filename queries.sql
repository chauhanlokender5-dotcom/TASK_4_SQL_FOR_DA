
-- queries.sql: SQL queries for Task 4 - SQL for Data Analysis
-- Database: ecommerce.db (SQLite)

-- 1) Top 10 users by total spend
SELECT u.user_id, u.name, SUM(o.quantity * o.price) AS total_spend
FROM users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.name
ORDER BY total_spend DESC
LIMIT 10;

-- 2) Average revenue per user (ARPU)
SELECT ROUND(AVG(user_total),2) AS arpu
FROM (
  SELECT u.user_id, SUM(o.quantity * o.price) AS user_total
  FROM users u
  JOIN orders o ON u.user_id = o.user_id
  GROUP BY u.user_id
);

-- 3) Sales by category (using JOIN)
SELECT p.category, SUM(o.quantity * o.price) AS revenue, COUNT(DISTINCT o.order_id) AS orders
FROM products p
JOIN orders o ON p.product_id = o.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- 4) Orders in the last 90 days
SELECT *
FROM orders
WHERE order_date >= date('now','-90 days')
ORDER BY order_date DESC
LIMIT 50;

-- 5) Subquery example: products with above-average revenue
SELECT product_id, product_name, product_rev
FROM (
  SELECT p.product_id, p.product_name, SUM(o.quantity*o.price) AS product_rev
  FROM products p JOIN orders o ON p.product_id = o.product_id
  GROUP BY p.product_id
) WHERE product_rev > (
  SELECT AVG(product_rev) FROM (
    SELECT p.product_id, SUM(o.quantity*o.price) AS product_rev
    FROM products p JOIN orders o ON p.product_id = o.product_id
    GROUP BY p.product_id
  )
);

-- 6) Create a view for easy revenue analysis (run once)
CREATE VIEW IF NOT EXISTS vw_user_revenue AS
SELECT u.user_id, u.name, SUM(o.quantity * o.price) AS total_spend
FROM users u JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.name;

-- 7) Example of optimization hint: ensure indexes on orders(user_id) and orders(product_id)
-- (Indexes were created in setup; in MySQL/Postgres you'd CREATE INDEX similarly.)
