--TOP 5 BEST SELLER BY TOTAL PIZZAS SOLD:
SELECT TOP 5
	pizza_name,
	SUM(quantity) AS Total_Pizzas_Sold
FROM vw_pizza_sales_clean
GROUP BY pizza_name
ORDER BY Total_Pizzas_Sold DESC;

--BOTTOM 5 WORST SELLERS BY TOTAL PIZZAS SOLD
SELECT TOP 5
	pizza_name,
	SUM(quantity) AS Total_Pizza_Sold
FROM vw_pizza_sales_clean
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC;