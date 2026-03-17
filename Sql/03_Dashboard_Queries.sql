-- Overall Delivery Performance KPIs
SELECT
    COUNT(*) AS Total_Orders,
    SUM(CASE WHEN Delivery_Status = 'Late delivery' THEN 1 ELSE 0 END) AS Late_Orders,
    ROUND(SUM(CASE WHEN Delivery_Status = 'Late delivery' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Late_Delivery_Rate,
    SUM(CASE WHEN Delivery_Status != 'Late delivery' THEN 1 ELSE 0 END) AS On_Time_Orders,
    ROUND(SUM(CASE WHEN Delivery_Status != 'Late delivery' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS On_Time_Rate,
    ROUND(AVG(Days_Shipping_Real), 2) AS Avg_Days_Actual,
    ROUND(AVG(Days_Shipping_Scheduled), 2) AS Avg_Days_Scheduled,
    ROUND(AVG(Days_Shipping_Real - Days_Shipping_Scheduled), 2) AS Avg_Delay
FROM logistics_clean:

-- Late delivery rate by shipping mode
SELECT
    Shipping_Mode,
    COUNT(*) AS Total_Orders,
    SUM(CASE WHEN Delivery_Status = 'Late delivery' THEN 1 ELSE 0 END) AS Late_Orders,
    ROUND(SUM(CASE WHEN Delivery_Status = 'Late delivery' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Late_Delivery_Rate,
    ROUND(AVG(Days_Shipping_Real - Days_Shipping_Scheduled), 2) AS Avg_Delay
FROM logistics_clean
GROUP BY Shipping_Mode
ORDER BY Late_Delivery_Rate DESC;

-- Late delivery rate by order region
SELECT
    Order_Region,
    Market,
    COUNT(*) AS Total_Orders,
    SUM(CASE WHEN Delivery_Status = 'Late delivery' THEN 1 ELSE 0 END) AS Late_Orders,
    ROUND(SUM(CASE WHEN Delivery_Status = 'Late delivery' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Late_Delivery_Rate,
    ROUND(AVG(Days_Shipping_Real - Days_Shipping_Scheduled), 2) AS Avg_Delay
FROM logistics_clean
GROUP BY Order_Region, Market
ORDER BY Late_Delivery_Rate DESC;

-- Late delivery rate by product category
	SELECT
		Category_Name,
		Department_Name,
		COUNT(*) AS Total_Orders,
		SUM(CASE WHEN Delivery_Status = 'Late delivery' THEN 1 ELSE 0 END) AS Late_Orders,
		ROUND(SUM(CASE WHEN Delivery_Status = 'Late delivery' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Late_Delivery_Rate,
		ROUND(AVG(Days_Shipping_Real - Days_Shipping_Scheduled), 2) AS Avg_Delay
	FROM logistics_clean
	GROUP BY Category_Name, Department_Name
	ORDER BY Late_Delivery_Rate DESC;