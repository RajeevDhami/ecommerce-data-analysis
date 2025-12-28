--PERCENTAGE OF SALES BY PIZZA CATEGORY
SELECT 
	pizza_category,
	CAST(
		SUM(quantity) * 100.0/SUM(SUM(quantity)) OVER() 
		AS DECIMAL(10,2)
		) AS Percentage_Of_Sales
FROM vw_pizza_sales_clean
GROUP BY pizza_category
ORDER BY Percentage_Of_Sales DESC;


--PERCENTAGE OF SALES BY PIZZA SIZE
SELECT 
	pizza_size,
	CAST(
		SUM(quantity) * 100.0/SUM(SUM(quantity)) OVER() 
		AS DECIMAL(10,2)
		) AS Percentage_Of_Sales
FROM vw_pizza_sales_clean
GROUP BY pizza_size
ORDER BY Percentage_Of_Sales DESC;

--TOTAL PIZZAS SOLD BY PIZZA CATEGORY
SELECT 
	pizza_category,
	SUM(quantity) AS Total_Pizza_Sold
FROM vw_pizza_sales_clean
GROUP BY pizza_category
ORDER BY Total_Pizza_Sold DESC;