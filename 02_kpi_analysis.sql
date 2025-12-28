--KPI ANALYSIS 

--KPI: TOTAL REVENUE
SELECT 
	ROUND(SUM(total_price), 2) AS Total_Revenue
FROM vw_pizza_sales_clean;

--KPI AVERAGE ORDER VALUE
SELECT CAST(SUM(total_price)/COUNT(DISTINCT order_id) AS DECIMAL(10,2) ) AS Average_Order_Value
FROM vw_pizza_sales_clean;

--KPI TOTAL PIZZAS SOLD
SELECT SUM(quantity) AS Total_Pizzas_Sold
FROM vw_pizza_sales_clean;

--KPI TOTAL ORDERS
SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM vw_pizza_sales_clean;

--KPI AVERAGE PIZZA PER ORDER
SELECT 
	CAST(
		SUM(quantity) * 1.0 / COUNT(DISTINCT order_id)
		AS DECIMAL(10,2)
		) AS Average_Pizza_Per_Order
FROM vw_pizza_sales_clean;