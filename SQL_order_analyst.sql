drop table if exists orders;

CREATE TABLE orders (
    order_id        VARCHAR(50) PRIMARY KEY,
    order_date      DATE,
    ship_mode       VARCHAR(50),
    segment         VARCHAR(50),
    country         VARCHAR(50),
    city            VARCHAR(50),
    state           VARCHAR(50),
    postal_code     VARCHAR(20),
    region          VARCHAR(50),
    category        VARCHAR(50),
    sub_category    VARCHAR(50),
    product_id      VARCHAR(50),
    quantity        INT,
    discount        DECIMAL(10, 2),
    sale_price      DECIMAL(10, 2),
    profit          DECIMAL(10, 2)
);

select * from orders;

--- Q1. Find top 10 highest revenue generating products

select sub_category, sum(sale_price) as sales
from orders
group by sub_category
order by sales desc limit 10;

--- Q2. Select top 10 sub_category, sum(sale_price) as sales

from orders
group by sub_category
order by sales desc;


--- Q3. Find top 5 highest selling product in each region

WITH cte AS (
    SELECT region, product_id, SUM(sale_price) AS sales
    FROM orders
    GROUP BY region, product_id
),
ranked AS (
    SELECT *,
        ROW_NUMBER() OVER(PARTITION BY region ORDER BY sales DESC) AS rn
    FROM cte
)
SELECT * FROM ranked
WHERE rn <= 5;


--- Q4. Find month over month growth comparison after 2022 and 2023 sales eg: jan 2022 vs jan 2023

---to select the years
SELECT DATE_PART('year', order_date) AS year
FROM orders;

WITH cte AS (
    SELECT 
        EXTRACT(YEAR FROM order_date) AS order_year,
        EXTRACT(MONTH FROM order_date) AS order_month,
        SUM(sale_price) AS sales
    FROM orders
    GROUP BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
)
SELECT 
    order_month,
    SUM(CASE WHEN order_year = 2022 THEN sales ELSE 0 END) AS sales_2022,
    SUM(CASE WHEN order_year = 2023 THEN sales ELSE 0 END) AS sales_2023
FROM cte
GROUP BY order_month
ORDER BY order_month;


--- Q5. For each category which month had highest sales
SELECT 
    category,
    TO_CHAR(order_date, 'YYYY-MM') AS order_year_month,
    SUM(sale_price) AS sales
FROM orders
GROUP BY category, TO_CHAR(order_date, 'YYYY-MM')
ORDER BY category, TO_CHAR(order_date, 'YYYY-MM');

---Q6. Which sub category had highest growth by profit in 2023 compre to 2022
WITH cte AS (
    SELECT 
        sub_category,
        EXTRACT(YEAR FROM order_date) AS order_year,
        SUM(sale_price) AS sales
    FROM orders
    GROUP BY sub_category, EXTRACT(YEAR FROM order_date)
)
SELECT 
    sub_category,
    SUM(CASE WHEN order_year = 2022 THEN sales ELSE 0 END) AS sales_2022,
    SUM(CASE WHEN order_year = 2023 THEN sales ELSE 0 END) AS sales_2023
FROM cte
GROUP BY sub_category
ORDER BY sub_category;

