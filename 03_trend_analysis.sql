--DAILY TREND FOR TOTAL ORDERS
SET DATEFIRST 1;
SELECT DATENAME(WEEKDAY, order_date) AS day_name, 
	   COUNT(DISTINCT order_id) AS total_orders
FROM vw_pizza_sales_clean
GROUP BY DATENAME(WEEKDAY, order_date), DATEPART(WEEKDAY, order_date)
ORDER BY DATEPART(WEEKDAY, order_date);


--HOURLY TREND FOR TOTAL ORDERS
SELECT 
	order_hour,
	COUNT(DISTINCT order_id) AS total_orders
FROM vw_pizza_sales_clean
GROUP BY order_hour
ORDER BY order_hour;