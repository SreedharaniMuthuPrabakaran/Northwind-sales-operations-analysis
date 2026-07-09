-- ================================================
-- EMPLOYEE PERFORMANCE ANALYSIS
-- Northwind Database | PostgreSQL
-- Analysis period: July 1996 – May 1998
-- ================================================

-- Employee performance: total orders, revenue, and average order value per transaction

SELECT first_name || ' ' || last_name AS employee_name, 
COUNT(orders.order_id) AS total_orders, SUM(unit_price * quantity) AS total_revenue, 
ROUND(CAST(SUM(unit_price * quantity) / COUNT(orders.order_id) AS NUMERIC), 2) AS avg_order_value
FROM employees
INNER JOIN orders ON employees.employee_id = orders.employee_id
INNER JOIN order_details ON orders.order_id = order_details.order_id
GROUP BY employees.employee_id
ORDER BY total_revenue DESC;

-- Key Findings:
-- 1. Margaret Peacock is the top performer by both total revenue (~$250,187) and order volume (420 orders).
-- 2. Order volume alone does not reflect true performance — Janet Leverling handled fewer orders than Nancy Davolio (321 vs 345) yet generated ~$11,000 more in revenue.
-- 3. Robert King had the highest average order value ($802.82) despite ranking 5th in total revenue, suggesting he consistently handles high-value transactions.
-- 4. Michael Suyama had the lowest average order value ($465.46), indicating a pattern of smaller, more frequent transactions.
-- 5. Laura Callahan processed 260 orders but generated less revenue than Robert King (176 orders), reinforcing that order volume and revenue performance are not directly correlated.
