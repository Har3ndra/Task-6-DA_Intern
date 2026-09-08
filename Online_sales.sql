use online_sales_db;

CREATE TABLE online_sales (
    order_id INT,
    order_date DATE,
    product_category VARCHAR(100),
    product_name VARCHAR(150),
    units_sold INT,
    unit_price DECIMAL(10,2),
    amount DECIMAL(12,2),
    region VARCHAR(100),
    payment_method VARCHAR(50)
);

USE online_sales_db;

SELECT *
FROM online_sales
LIMIT 10;

SELECT
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    COUNT(DISTINCT order_id) AS total_orders
FROM online_sales;

SELECT
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    order_year,
    order_month;
    
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    MONTHNAME(order_date) AS month_name,
    SUM(amount) AS revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date),
    MONTHNAME(order_date)
ORDER BY
    year,
    month;
    
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
WHERE order_date >= '2024-01-01'
  AND order_date < '2024-05-01'
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    year,
    month;
    
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    revenue DESC
LIMIT 1;

SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    revenue ASC
LIMIT 1;