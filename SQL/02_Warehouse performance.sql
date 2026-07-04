/*==============================================================
Mint Classics Warehouse Optimization
02_Warehouse_Performance.sql

Purpose:
Evaluate warehouse performance in terms of inventory investment,
sales contribution, warehouse utilization, and product line allocation
to support warehouse optimization decisions.
==============================================================*/

/*--------------------------------------------------------------
1. Warehouse Capacity
--------------------------------------------------------------*/
SELECT
warehouseCode,
warehouseName,
warehousePctCap
FROM warehouses;

/*--------------------------------------------------------------
2. Inventory warehouse performance
--------------------------------------------------------------*/
WITH inventory AS (SELECT 
warehouseCode, 
COUNT(productcode) as total_products, 
SUM(quantityInStock) as total_stock,  
SUM(quantityInStock*buyPrice) as Inventory_value
FROM products
GROUP BY warehousecode),
Sale AS (SELECT w.warehousecode, sum(d.quantityOrdered) AS unit_sold, 
sum(d.quantityordered * d.priceEach) AS total_revenue
FROM warehouses w JOIN products p ON w.warehousecode = p.warehousecode
JOIN orderdetails d ON d.productCode = p.productCode
GROUP BY w.warehousecode)
SELECT * , round(s.total_revenue/sum(s.total_revenue) OVER (),2) AS RevenuePCT,
round(s.total_revenue/i.inventory_value,2) AS revenueInventory_ratio
FROM inventory i
JOIN sale s
USING (warehouseCode)
ORDER BY revenueInventory_ratio DESC;

/*--------------------------------------------------------------
3. Product Line Allocation and Productivity
--------------------------------------------------------------*/
WITH inventory AS (Select warehousecode, productline, sum(quantityInstock) AS Line_inventory,
SUM(quantityinstock*buyPrice) as LineInventory_Value
FROM products
GROUP BY warehousecode, productline),
sale AS (Select p.warehousecode, p.productline, sum(d.quantityordered * d.priceEach) as Line_revenue
From products p JOIN orderdetails d ON p.productcode= d.productcode
GROUP BY p.warehousecode, p.productline)
SELECT *, round(i.LineInventory_Value/sum(i.LineInventory_Value) OVER ()*100,2) as InventoryPCT,
round(s.line_revenue/sum(s.line_revenue) OVER ()*100,2) as Line_revenuePCT, 
round(s.line_revenue/i.LineInventory_value,2) AS LineProductivity_ratio 
FROM inventory i JOIN sale s USING(warehousecode,productline)
ORDER BY LineProductivity_ratio DESC;