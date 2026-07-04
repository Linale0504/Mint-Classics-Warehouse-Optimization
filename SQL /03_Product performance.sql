/*==============================================================
Mint Classics Warehouse Optimization
03_Product_Performance.sql

Purpose:
Evaluate product performance based on sales,
inventory investment, inventory coverage,
and revenue contribution to identify
fast-moving, slow-moving, and overstock products.
==============================================================*/

/*--------------------------------------------------------------
1. Product Revenue Ranking
--------------------------------------------------------------*/
SELECT
    p.productCode,
    p.productName,
    p.productLine,
    SUM(d.quantityOrdered * d.priceEach) AS product_revenue
FROM products p
JOIN orderdetails d
ON p.productCode = d.productCode
GROUP BY
    p.productCode,
    p.productName,
    p.productLine
ORDER BY product_revenue DESC;

/*--------------------------------------------------------------
2. Pareto Products
--------------------------------------------------------------*/
 WITH ProductRevenue AS (
    SELECT
        productCode,
        SUM(quantityOrdered * priceEach) AS Revenue
    FROM orderdetails
    GROUP BY productCode
),
RankedProducts AS (
    SELECT
        productCode,
        Revenue,
        ROW_NUMBER() OVER (ORDER BY Revenue DESC) AS ProductRank,
        Revenue * 100.0 / SUM(Revenue) OVER() AS RevenuePct,
        SUM(Revenue) OVER (
            ORDER BY Revenue DESC
            ROWS UNBOUNDED PRECEDING
        ) * 100.0 / SUM(Revenue) OVER() AS CumulativePct
    FROM ProductRevenue
)
SELECT *
FROM RankedProducts
ORDER BY ProductRank;

/*--------------------------------------------------------------
3. Products with No Sales
--------------------------------------------------------------*/
SELECT
    p.productCode,
    p.productName,
    p.productLine,
    p.quantityInStock,
    p.warehouseCode
FROM products p
LEFT JOIN orderdetails d
       ON p.productCode = d.productCode
WHERE d.productCode IS NULL;

/*--------------------------------------------------------------
4. Product performance 
--------------------------------------------------------------*/
WITH product_sold AS (SELECT productcode, sum(quantityordered) AS qty_sold FROM orderdetails
GROUP BY productcode),
inventory_stock AS (SELECT warehousecode, productcode, productLine, SUM(quantityInstock) AS Product_inventory 
FROM products GROUP BY warehousecode, productcode),
Revenue AS (SELECT productCode, sum(quantityOrdered*priceEach) AS product_revenue
from orderdetails  Group by productCode),
ratio_table AS (SELECT i.warehousecode, i.productcode, i.productLine, r.product_revenue, 
round(r.product_revenue/sum(product_revenue) OVER ()*100 ,2) as RevenuePCT,
i.product_inventory, p.qty_sold, round(i.product_inventory/(p.qty_sold/28),2) AS months_of_inventory
FROM product_sold p JOIN revenue r USING(productCode) JOIN inventory_stock i USING(productCode)),
ranked AS (SELECT *, NTILE(4) OVER (ORDER BY months_of_inventory DESC) AS inventory_class
FROM ratio_table)
 SELECT *, CASE inventory_class
 WHEN 1 THEN 'Highest Inventory Coverage'
 WHEN 2 THEN 'Above Average'
 WHEN 3 THEN 'Below Average'
 WHEN 4 THEN 'Lowest Inventory Coverage'
 END AS inventory_status
 FROM ranked;
