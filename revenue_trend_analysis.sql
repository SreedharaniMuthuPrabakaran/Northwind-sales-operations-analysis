-- ================================================
-- REVENUE TREND ANALYSIS
-- Northwind Database | PostgreSQL
-- Analysis period: July 1996 – May 1998
-- ================================================

-- Monthly revenue with month-over-month change and % growth
WITH monthly_revenue AS (
    SELECT 
        DATE_TRUNC('month', order_date) AS order_month,
        SUM(order_details.unit_price * order_details.quantity) AS total_revenue
    FROM order_details
    INNER JOIN orders
        ON order_details.order_id = orders.order_id
    GROUP BY DATE_TRUNC('month', order_date)
    ORDER BY order_month
)
SELECT 
    order_month,
    total_revenue,
    LAG(total_revenue) OVER (ORDER BY order_month) AS prev_month_revenue,
    total_revenue - LAG(total_revenue) OVER (ORDER BY order_month) AS revenue_change,
    ROUND(
        ((total_revenue - NULLIF(LAG(total_revenue) OVER (ORDER BY order_month), 0))
        / NULLIF(LAG(total_revenue) OVER (ORDER BY order_month), 0)) * 100, 2
    ) AS revenue_change_pct
FROM monthly_revenue;

-- Key Findings:
-- 1. April 1998 was the highest revenue month (~$134,630)
-- 2. December 1997 saw the largest month-over-month growth (+69% vs November 1997)
-- 3. May 1998 shows an 85% drop — likely due to incomplete data at dataset end, not a real decline
-- 4. Revenue shows a general upward trend from mid-1996 to early 1998
