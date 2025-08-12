**Sales Trend Analysis (SQL)**

**📌 Project Overview**

This project demonstrates how to analyze monthly sales trends using SQL.  
The dataset contains order details such as order ID, order date, product ID, and amount.  
We use SQL functions like `EXTRACT()`, `SUM()`, and `COUNT()` to generate monthly revenue and sales volume insights.

**🛠️ Steps Implemented**

1. **Extract Month & Year** from the order date using `EXTRACT()`.
2. **Group Data** by year and month.
3. **Calculate Revenue** using `SUM(amount)`.
4. **Calculate Sales Volume** using `COUNT(DISTINCT order_id)`.
5. **Sort Results** using `ORDER BY year, month`.
6. **Limit Periods** using `WHERE` or `LIMIT`.

**📂 Files Included**

- `sales_trend.sql` → SQL script for monthly sales trend analysis.
- `sample_data.sql` → Insert statements for testing the query.

**📊 Example Query**

```sql
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM online_sales
GROUP BY year, month
ORDER BY year, month;
