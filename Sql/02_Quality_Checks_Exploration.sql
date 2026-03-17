-- Checking for NULL values in key columns
SELECT
	COUNT(*) AS Total_Rows,
	SUM(CASE WHEN Delivery_Status IS NULL THEN 1 ELSE 0 END) AS Null_Delivery_Status,
	SUM(CASE WHEN Days_Shipping_Real IS NULL THEN 1 ELSE 0 END) AS Null_Days_Real,
	SUM(CASE WHEN Days_Shipping_Scheduled IS NULL THEN 1 ELSE 0 END) AS Null_Days_Scheduled,
	SUM(CASE WHEN Delivery_Status IS NULL THEN 1 ELSE 0 END) AS Null_Delivery_Status_Check,
	SUM(CASE WHEN Shipping_Mode IS NULL THEN 1 ELSE 0 END) AS Null_Shipping_Mode,
	SUM(CASE WHEN Order_Region IS NULL THEN 1 ELSE 0 END) AS Null_Order_Region,
	SUM(CASE WHEN Order_Date IS NULL THEN 1 ELSE 0 END) AS Null_Order_Date
FROM logistics_clean;

-- Checking delivery status distribution
SELECT
	Delivery_Status,
	COUNT(*) AS Total,
	ROUND(COUNT(*) * 100 / (SELECT COUNT(*) FROM logistics_clean), 2) AS Percentage
FROM logistics_clean
GROUP BY Delivery_Status
ORDER BY Total DESC;

-- Checking shipping mode distribution
SELECT
	Shipping_Mode,
	COUNT(*) AS Total,
	ROUND(COUNT(*) * 100 / (SELECT COUNT(*) FROM logistics_clean), 2) AS Percentage
FROM logistics_clean
GROUP BY Shipping_Mode
ORDER BY Total DESC;

-- Checking late delivery rate by shipping mode
SELECT 
    Order_Region,
    COUNT(*) AS Total_Orders,
    SUM(CASE WHEN Delivery_Status = 'Late delivery' THEN 1 ELSE 0 END) AS Late_Orders,
    ROUND(SUM(CASE WHEN Delivery_Status = 'Late delivery' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Late_Delivery_Rate,
    ROUND(AVG(Days_Shipping_Real - Days_Shipping_Scheduled), 2) AS Avg_Delay
FROM logistics_clean
GROUP BY Order_Region
ORDER BY Late_Delivery_Rate DESC;	

-- Checking late delivery rate by region
SELECT
	Order_Region,
	COUNT(*) AS Total_Orders,
	SUM(Late_delivery_risk),
	ROUND(SUM(Late_delivery_risk) * 100 / COUNT(*), 2) AS Late_Delivery_Rate
FROM logistics_clean
GROUP BY Order_Region
ORDER BY Late_Delivery_Rate DESC;

-- Checking date column format
SELECT 
	Order_Date,
	Shipping_Date
FROM logistics_clean
LIMIT 5;

-- Checking date length consistency to determine conversion approach
SELECT
	Order_Date,
	LENGTH(Order_Date) AS Date_Length
FROM logistics_clean
GROUP BY Date_Length;