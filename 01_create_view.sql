--PROJECT: PIZZA SALES ANALYSIS

--CREATE VIEW vw_pizza_sales_clean AS
SELECT
	order_id,
	pizza_name,
	pizza_category,
	pizza_size,
	quantity,
	CAST(total_price AS DECIMAL(10,2)) AS total_price,
	order_date,
	DATEPART(HOUR, order_time) AS order_hour
FROM pizza_sales;
