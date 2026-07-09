-- ================================================
-- CUSTOMER SEGMENTATION ANALYSIS
-- Northwind Database | PostgreSQL
-- Analysis period: July 1996 – May 1998
-- ================================================

-- The customer segmentation query with individual customers
WITH customer_spend AS (
    SELECT customer_id, SUM(unit_price * quantity) AS total_spend
    FROM order_details
    INNER JOIN orders
		ON order_details.order_id = orders.order_id 
	GROUP BY customer_id
)
SELECT customer_id, total_spend,
    CASE
        WHEN total_spend > 10000 THEN 'High Value'
        WHEN total_spend > 3000 THEN 'Mid Value'
        ELSE 'Low Value'
    END AS segment
FROM customer_spend
ORDER BY total_spend DESC;

-- The segment count query
WITH customer_spend AS (
    SELECT customer_id, SUM(unit_price * quantity) AS total_spend
    FROM order_details
    INNER JOIN orders
		ON order_details.order_id = orders.order_id 
	GROUP BY customer_id
),
customer_segments AS (
    SELECT customer_id, total_spend,
    CASE
        WHEN total_spend > 10000 THEN 'High Value'
        WHEN total_spend > 3000 THEN 'Mid Value'
        ELSE 'Low Value'
    END AS segment
FROM customer_spend
)
SELECT segment, COUNT(*) AS customer_count
FROM customer_segments
GROUP BY segment
ORDER BY customer_count DESC;


-- Key Findings:
-- 1. QUICK tops at ~$117,483, followed closely by SAVEA at ~$115,673
-- 2. 41 High Value customers (46% of total), 30 Mid Value (34%), 18 Low Value (20%)
-- 3. CENTC is the lowest spending customer at just ~$101 — a significant re-engagement opportunity
-- 4. The gap between top and bottom spenders is enormous (~$117,000 vs ~$101)
