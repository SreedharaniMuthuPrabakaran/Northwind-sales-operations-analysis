-- ================================================
-- PRODUCT ANALYSIS
-- Northwind Database | PostgreSQL
-- ================================================

-- 1. Products priced above £50
SELECT product_name, unit_price
FROM products
WHERE unit_price > 50
ORDER BY unit_price DESC;

-- 2. Average unit price per category (only categories with average price above 20)
SELECT category_id, AVG(unit_price) AS avg_price
FROM products
GROUP BY category_id
HAVING AVG(unit_price) > 20
ORDER BY avg_price DESC;

-- 3. Products priced above the overall average unit price
SELECT product_name, unit_price
FROM products
WHERE unit_price > (
    SELECT AVG(unit_price)
    FROM products
)
ORDER BY unit_price DESC;

-- 4. Products categorised into price bands
SELECT product_name, unit_price,
    CASE
        WHEN unit_price > 100 THEN 'Premium'
        WHEN unit_price > 50 THEN 'Mid-range'
        ELSE 'Budget'
    END AS price_band
FROM products
ORDER BY unit_price DESC;

-- 5. Count of products in each price band
WITH product_band AS (
    SELECT product_name, unit_price,
        CASE
            WHEN unit_price > 100 THEN 'Premium'
            WHEN unit_price > 50 THEN 'Mid-range'
            ELSE 'Budget'
        END AS price_band
    FROM products
)
SELECT price_band, COUNT(*) AS total_products
FROM product_band
GROUP BY price_band
ORDER BY total_products DESC;

-- 6. Products ranked by unit price within each category
SELECT product_name, category_id, unit_price,
    RANK() OVER (
        PARTITION BY category_id
        ORDER BY unit_price DESC
    ) AS rank_in_category
FROM products;
