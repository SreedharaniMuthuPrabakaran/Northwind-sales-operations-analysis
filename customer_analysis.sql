-- ================================================
-- CUSTOMER ANALYSIS
-- Northwind Database | PostgreSQL
-- ================================================

-- 1. All customers not from Germany, ordered alphabetically
SELECT customer_id, company_name, country
FROM customers
WHERE country != 'Germany'
ORDER BY company_name;

-- 2. Number of orders placed by each customer (highest to lowest)
SELECT customer_id, COUNT(*) AS customer_orders
FROM orders
GROUP BY customer_id
ORDER BY customer_orders DESC;

-- 3. Customers who have placed more than 5 orders
SELECT customer_id, COUNT(*) AS customer_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 5;

-- 4. All customers and their order count (including customers with zero orders)
SELECT customers.customer_id, 
       COALESCE(COUNT(orders.order_id), 0) AS num_of_orders
FROM customers
LEFT JOIN orders
    ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id;

-- 5. Customers who have spent above the average total spend
WITH customer_spend AS (
    SELECT orders.customer_id, 
           SUM(order_details.unit_price * order_details.quantity) AS total_spend
    FROM order_details
    INNER JOIN orders
        ON order_details.order_id = orders.order_id
    GROUP BY orders.customer_id
)
SELECT customer_id, total_spend
FROM customer_spend
WHERE total_spend > (
    SELECT AVG(total_spend) 
    FROM customer_spend
)
ORDER BY total_spend DESC;
