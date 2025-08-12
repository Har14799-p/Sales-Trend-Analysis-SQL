use sales_db;
-- create online_sales table 
create table online_sales (
  order_id varchar(50) primary key,
  order_date date,
  product_id varchar(50),
  amount decimal(12,2));
  -- insert values on online_sales table
insert into online_sales 
(order_id, order_date, amount, product_id) 
values
(1, '2024-01-15', 250.00, 'P001'),
(2, '2024-01-20', 150.00, 'P002'),
(3, '2024-02-05', 300.00, 'P003'),
(4, '2024-02-18', 450.00, 'P001'),
(5, '2024-03-10', 120.00, 'P004'),
(6, '2024-03-25', 500.00, 'P002'),
(7, '2024-04-02', 200.00, 'P003'),
(8, '2024-04-15', 350.00, 'P004'),
(9, '2024-05-08', 600.00, 'P001'),
(10,'2024-05-20', 400.00, 'P002');
-- view the table
select * from online_sales;
-- Use extract(month from order_date) to get month
SELECT 
    order_id,
    order_date,
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    amount,
    product_id
FROM online_sales
ORDER BY order_date;
-- GROUP BY year/month (and 3 & 4 below)
SELECT
  EXTRACT(YEAR FROM order_date)  AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  SUM(amount)                     AS revenue,
  COUNT(DISTINCT order_id)        AS order_count,
  ROUND(SUM(amount) / NULLIF(COUNT(DISTINCT order_id),0), 2) AS avg_order_value
FROM online_sales
WHERE order_date IS NOT NULL
GROUP BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY year, month;
-- Use ORDER BY for sorting
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month_year, SUM(amount) AS revenue
FROM online_sales
GROUP BY month_year
ORDER BY revenue DESC
LIMIT 5;
--  Limit results for specific time periods
SELECT
  EXTRACT(YEAR FROM order_date)  AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  SUM(amount)                     AS revenue,
  COUNT(DISTINCT order_id)        AS order_count,
  ROUND(SUM(amount) / NULLIF(COUNT(DISTINCT order_id),0), 2) AS avg_order_value
FROM online_sales
WHERE order_date BETWEEN '2024-02-01' AND '2024-04-30'
GROUP BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY year, month;