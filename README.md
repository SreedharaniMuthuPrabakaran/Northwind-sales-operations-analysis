# Sales & Operations Analysis — Northwind Database

## Overview
A portfolio project analysing sales and operations data using PostgreSQL. 
All queries are written against the Northwind database — a sample dataset 
representing a trading company's customers, orders, products, and employees 
covering 22 months of transactional data from July 1996 to May 1998.

## Tools
- PostgreSQL
- pgAdmin

## Files
| File | Description |
|------|-------------|
| `customer_analysis.sql` | Customer order behaviour and spend analysis |
| `product_analysis.sql` | Product pricing, categorisation and ranking |
| `operations_analysis.sql` | Order and freight cost analysis |
| `revenue_trend_analysis.sql` | Monthly revenue trend with month-over-month growth |
| `customer_segmentation.sql` | Customer classification by total spend |
| `employee_performance_analysis.sql` | Employee revenue and order performance |
| `product_performance_analysis.sql` | Top 10 products by revenue |

## Key Business Findings

### Revenue Trends
- April 1998 was the highest revenue month at ~$134,630
- December 1997 saw the largest month-over-month growth at +69% vs November 1997
- Revenue shows a general upward trend from mid-1996 through early 1998
- May 1998 shows an 85% drop due to incomplete data at dataset end, not a real decline

### Customer Analysis
- QUICK and SAVEA are the top two customers by spend (~$117,483 and ~$115,673 respectively)
- 41 of 89 customers (46%) are High Value (spend above $10,000)
- 18 customers (20%) are Low Value — potential targets for re-engagement campaigns
- CENTC is the lowest spending customer at just ~$101

### Employee Performance
- Margaret Peacock is the top performer by both revenue (~$250,187) and order volume (420 orders)
- Order volume does not reflect true performance — Janet Leverling handled fewer orders than Nancy Davolio yet generated ~$11,000 more in revenue
- Robert King had the highest average order value ($802.82) despite ranking 5th in total revenue
- Michael Suyama had the lowest average order value ($465.46), indicating smaller, more frequent transactions

### Product Performance
- Côte de Blaye is the top revenue-generating product at ~$149,984 despite only 24 units sold — driven by its premium price of ~$263 per unit
- High quantity sold does not guarantee high revenue — unit price is the stronger revenue driver
- The top 2 products account for a disproportionate share of total product revenue

## SQL Concepts Demonstrated
- SELECT, WHERE, ORDER BY, GROUP BY, HAVING
- INNER JOIN, LEFT JOIN, multi-table JOINs
- Subqueries
- CTEs (Common Table Expressions) including chained CTEs
- Window Functions (RANK, ROW_NUMBER, LAG)
- CASE statements for conditional segmentation
- COALESCE for NULL handling
- Date functions (DATE_TRUNC)
- Query optimisation basics (EXPLAIN, CAST)
