SELECT * FROM sales.amazon;
use  amazon;

-- 1.Total sales Revenue
SELECT SUM(Total_Sales) AS Total_Revenue FROM amazon;

-- 2. Top 5 best selling products
SELECT Product, SUM(Units) AS Total_Units_Sold 
FROM amazon 
GROUP BY Product 
ORDER BY Total_Units_Sold DESC 
LIMIT 5;

-- 3. number of orders by month.
SELECT DATE_FORMAT(Date, '%Y-%m') AS Month, COUNT(*) AS Order_Count 
FROM amazon 
GROUP BY Month 
ORDER BY Month;

-- 4.Average Order value 
SELECT AVG(Total_Sales) AS Average_Order_Value FROM amazon;

-- 5. Products Running Low on Stock
SELECT Product, SUM(Units) AS Total_Units_Sold 
FROM amazon 
GROUP BY Product 
HAVING Total_Units_Sold < 10;

-- 6. Top 5 Customers by Toatal Spending
SELECT SalesRep, SUM(Total_Sales) AS Total_Spending 
FROM amazon 
GROUP BY SalesRep 
ORDER BY Total_Spending DESC 
LIMIT 5;

-- 7.customer retention rate.

-- 8. total sales by category
SELECT Product, SUM(Total_Sales) AS Total_Category_Sales 
FROM amazon
GROUP BY Product 
ORDER BY Total_Category_Sales DESC;

