-- ================================================
-- PRODUCT PERFORMANCE ANALYSIS WITH REVENUE RANKING
-- Northwind Database | PostgreSQL
-- Analysis period: July 1996 – May 1998
-- ================================================

-- Product performance: total quantity, total revenue, and top 10 products ranked by revenue

WITH products_with_revquan AS (
  SELECT product_name, 
SUM(order_details.unit_price * order_details.quantity) AS total_revenue,
COUNT(order_details.quantity) AS total_quantity
FROM order_details
INNER JOIN products 
ON order_details.product_id = products.product_id
GROUP BY products.product_name
ORDER BY total_revenue DESC)
SELECT *, RANK() OVER(
  ORDER BY total_revenue DESC
) AS rank_by_revenue
FROM products_with_revquan
LIMIT 10;

-- Key Findings:
-- 1. Côte de Blaye is the top revenue-generating product at ~$149,984, despite being only 24th in quantity sold — driven by its premium unit price of ~$263.
-- 2. High quantity sold does not guarantee high revenue. Raclette Courdavault sold 54 units (highest in top 10) yet ranks 3rd in revenue, behind products with far fewer units sold.
-- 3. The top 2 products (Côte de Blaye and Thüringer Rostbratwurst) together account for a disproportionate share of total product revenue, suggesting heavy reliance on a small number of premium products.
-- 4. Unit price is a stronger driver of revenue than volume for the top performing products in this dataset.
