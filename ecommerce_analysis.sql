-- E-COMMERCE DATA ANALYSIS PROJECT

-- TASK 1: Data Preparation & Derivation
ALTER TABLE new_schema.sales_data
ADD COLUMN Total_Revenue DECIMAL(12,2),
ADD COLUMN Order_Type VARCHAR(20);

UPDATE new_schema.sales_data
SET Total_Revenue = Quantity * Unit_Price;

UPDATE new_schema.sales_data
SET Order_Type = 
	CASE 
		WHEN Total_Revenue >= 500 THEN 'High Value'
        ELSE 'Standard Value'
        END;

-- Verification
SELECT * FROM new_schema.sales_data;


-- TASK 2 (Combined summary)

SELECT 
	SUM(Total_Revenue) AS Total_Revenue_All ,
    SUM(CASE WHEN Status = 'Shipped' THEN Total_Revenue ELSE 0 END) AS Completed_Revenue,
    SUM(CASE WHEN Status = 'Pending' THEN 1 ELSE 0 END) AS Pending_Orders
FROM new_schema.sales_data;


-- TASK 3.1 Regional Profitability
SELECT 
	Region,
    SUM(Total_Revenue) AS Total_Revenue
FROM new_schema.sales_data
GROUP BY Region
ORDER BY Total_Revenue DESC;

-- TASK 3.2 Product Performance By Status
SELECT 
	Product_Name,
    Status,
    COUNT(*) AS Order_Count
FROM new_schema.sales_data
GROUP BY Product_Name, Status
ORDER BY Product_Name, Status;


-- Task 3.3: Sales By Representative and Order Type
SELECT
	Sales_Representative,
    Order_Type,
    SUM(Total_Revenue) AS Total_Revenue
FROM new_schema.sales_data
GROUP BY Sales_Representative, Order_Type
ORDER BY Sales_Representative, Total_Revenue DESC;

-- Task 4.1 Revenue By Category
SELECT 
	Category,
    SUM(Total_Revenue) AS Total_Revenue
FROM new_schema.sales_data
WHERE Category IN ('Electronics', 'Peripherals', 'Gaming', 'Accessories')
GROUP BY Category
ORDER BY Total_Revenue DESC;

-- Task 4.2 Order Status Distribution
SELECT 
	Status,
    ROUND (
		  COUNT(*) * 100.0/ (SELECT COUNT(*) FROM new_schema.sales_data), 
          2
          ) AS Order_Percentage
FROM new_schema.sales_data
GROUP BY Status;
































