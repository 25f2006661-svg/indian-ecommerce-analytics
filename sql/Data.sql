CREATE DATABASE indian_ecommerce_db;
USE indian_ecommerce_db;
CREATE TABLE ecommerce_sales (
    order_id VARCHAR(20),
    order_date DATE,
    state VARCHAR(50),
    zone VARCHAR(20),
    category VARCHAR(100),
    brand_type VARCHAR(50),
    customer_gender VARCHAR(20),
    customer_age INT,
    base_price FLOAT,
    discount_percent FLOAT,
    final_price FLOAT,
    units_sold INT,
    revenue FLOAT,
    sales_event VARCHAR(100),
    competition_intensity VARCHAR(50),
    inventory_pressure VARCHAR(50),
    year INT,
    month INT,
    month_name VARCHAR(20),
    quarter INT,
    total_cost FLOAT,
    total_sales FLOAT,
    discount_amount FLOAT
);
SELECT * FROM ecommerce_sales
LIMIT 10;
SELECT 
ROUND(SUM(total_sales), 2) AS total_revenue
FROM ecommerce_sales;
SELECT 
COUNT(DISTINCT order_id) AS total_orders
FROM ecommerce_sales;
SELECT 
state,
ROUND(SUM(total_sales), 2) AS revenue
FROM ecommerce_sales
GROUP BY state
ORDER BY revenue DESC
LIMIT 10;
SELECT 
category,
ROUND(SUM(total_sales), 2) AS revenue
FROM ecommerce_sales
GROUP BY category
ORDER BY revenue DESC;
SELECT 
month_name,
ROUND(SUM(total_sales), 2) AS revenue
FROM ecommerce_sales
GROUP BY month_name
ORDER BY revenue DESC;
SELECT 
customer_gender,
ROUND(SUM(total_sales), 2) AS revenue
FROM ecommerce_sales
GROUP BY customer_gender;
SELECT 
category,
ROUND(AVG(discount_percent), 2) AS avg_discount
FROM ecommerce_sales
GROUP BY category
ORDER BY avg_discount DESC;
SELECT 
category,
SUM(units_sold) AS total_units
FROM ecommerce_sales
GROUP BY category
ORDER BY total_units DESC;
SELECT 
zone,
ROUND(SUM(total_sales), 2) AS revenue
FROM ecommerce_sales
GROUP BY zone
ORDER BY revenue DESC;
SELECT 
ROUND(AVG(customer_age), 2) AS avg_customer_age
FROM ecommerce_sales;
SELECT 
state,
ROUND(SUM(total_sales), 2) AS revenue,
RANK() OVER(ORDER BY SUM(total_sales) DESC) AS state_rank
FROM ecommerce_sales
GROUP BY state;
SELECT 
category,
ROUND(SUM(total_sales), 2) AS revenue,
DENSE_RANK() OVER(ORDER BY SUM(total_sales) DESC) AS category_rank
FROM ecommerce_sales
GROUP BY category;
SELECT 
month_name,
ROUND(SUM(total_sales), 2) AS monthly_revenue,

ROUND(
SUM(SUM(total_sales)) OVER(ORDER BY SUM(total_sales)),
2
) AS running_total

FROM ecommerce_sales
GROUP BY month_name;
WITH category_revenue AS (

SELECT
category,
ROUND(SUM(total_sales), 2) AS revenue
FROM ecommerce_sales
GROUP BY category

)

SELECT *
FROM category_revenue
WHERE revenue > 250000000;
SELECT *
FROM ecommerce_sales
WHERE total_sales > (

SELECT AVG(total_sales)
FROM ecommerce_sales

);
SELECT 
order_id,
state,
category,
ROUND(total_sales, 2) AS revenue
FROM ecommerce_sales
ORDER BY revenue DESC
LIMIT 5;
SELECT 
brand_type,
ROUND(AVG(total_sales), 2) AS avg_revenue
FROM ecommerce_sales
GROUP BY brand_type;
SELECT 
sales_event,
ROUND(SUM(total_sales), 2) AS revenue
FROM ecommerce_sales
GROUP BY sales_event
ORDER BY revenue DESC;



