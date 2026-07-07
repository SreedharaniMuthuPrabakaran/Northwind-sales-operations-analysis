-- ================================================
-- OPERATIONS ANALYSIS
-- Northwind Database | PostgreSQL
-- ================================================

-- 1. All orders with customer company name and country
SELECT orders.order_id, customers.company_name, customers.country
FROM orders
INNER JOIN customers
    ON orders.customer_id = customers.customer_id;

-- 2. Customers who placed orders with freight above average
SELECT customers.company_name, customers.country
FROM customers
INNER JOIN orders
    ON customers.customer_id = orders.customer_id
WHERE freight > (
    SELECT AVG(freight)
    FROM orders
)
ORDER BY customers.company_name;

-- 3. Freight cost trend — current vs previous order
WITH freight_data AS (
    SELECT order_id, freight,
        LAG(freight) OVER (ORDER BY order_date) AS prev_freight
    FROM orders
)
SELECT order_id, freight, prev_freight,
    freight - prev_freight AS diff_freight
FROM freight_data;
