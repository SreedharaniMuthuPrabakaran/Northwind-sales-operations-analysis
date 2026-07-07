# Sales & Operations Analysis — Northwind Database

## Overview
A portfolio project analysing sales and operations data using PostgreSQL. 
All queries are written against the Northwind database — a sample dataset 
representing a trading company's customers, orders, products, and employees.

The project answers real business questions across customer behaviour, 
product performance, and operational efficiency using progressively 
advanced SQL techniques.

## Tools
- PostgreSQL
- pgAdmin

## Business Questions Answered

### Customer Analysis
- Which customers have placed the most orders?
- Which customers are inactive (zero orders)?
- Who are the highest-spending customers?
- Which customers spend above average?

### Product Analysis
- Which products are priced above the average unit price?
- How are products distributed across price bands (Premium/Mid-range/Budget)?

### Operations Analysis
- What is the freight cost trend across orders over time?
- How do freight costs compare order-to-order?

### Rankings & Performance
- How do products rank within each category by unit price?

## SQL Concepts Demonstrated
- SELECT, WHERE, ORDER BY, GROUP BY, HAVING
- INNER JOIN, LEFT JOIN
- Subqueries
- CTEs (Common Table Expressions)
- Window Functions (RANK, ROW_NUMBER, LAG)
- CASE statements
- COALESCE for NULL handling
- Query optimisation basics (EXPLAIN)
