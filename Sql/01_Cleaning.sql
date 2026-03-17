-- Dropping existing table if it exists
DROP TABLE IF EXISTS logistics_clean;

-- Create a clean table with standardised naming and relevant columns
CREATE TABLE logistics_clean AS
SELECT
	Type,
	"Days for shipping (real)" AS Days_Shipping_Real,
	"Days for shipment (Scheduled)" AS Days_Shipping_Scheduled,
	"Delivery Status" AS Delivery_Status,
	Late_delivery_risk,
	"Shipping Mode" AS Shipping_Mode,
	"order date (DateOrders)" AS Order_Date,
	"shipping date (DateOrders)" AS Shipping_Date,
	"Customer City" AS Customer_City,
	"Customer Country" AS Customer_Country,
	"Customer State" AS Customer_State,
	"Order Region" AS Order_Region,
	"Order Country" AS Order_Country,
	Market,
	"Order Id" AS Order_ID,
	"Order Status" AS Order_Status,
	"Order Item Quantity" AS Order_Quantity,
	"Product Name" AS Product_Name,
	"Product Category Id" AS Product_Category_ID,
	"Category Name" AS Category_Name,
	"Department Name" AS Department_Name,
	Sales,
	"Order Profit Per Order" AS Order_Profit,
	"Order Item Profit Ratio" AS Profit_Ratio
FROM DataCoSupplyChainDataset;