/*==============================================================
Mint Classics Warehouse Optimization
01_EDA.sql

Purpose:
Perform exploratory data analysis to understand the database
structure, warehouse distribution, products, and sales period.
==============================================================*/


/*--------------------------------------------------------------
1. Display all tables in the database
--------------------------------------------------------------*/
SHOW TABLES;


/*--------------------------------------------------------------
2. Review table structures
--------------------------------------------------------------*/
DESCRIBE products;

DESCRIBE orders;

DESCRIBE orderdetails;


/*--------------------------------------------------------------
3. List all warehouses
--------------------------------------------------------------*/
SELECT
    warehouseCode,
    warehouseName
FROM warehouses;


/*--------------------------------------------------------------
4. Count total number of products
--------------------------------------------------------------*/
SELECT
    COUNT(*) AS total_products
FROM products;


/*--------------------------------------------------------------
5. Count total number of orders
--------------------------------------------------------------*/
SELECT
    COUNT(*) AS total_orders
FROM orders;


/*--------------------------------------------------------------
6. Identify which product lines are stored in each warehouse
--------------------------------------------------------------*/
SELECT
    warehouseCode,
    productLine,
    SUM(quantityInStock) AS inventory_units
FROM products
GROUP BY warehouseCode, productLine
ORDER BY warehouseCode;


/*--------------------------------------------------------------
7. Determine sales data period
--------------------------------------------------------------*/
SELECT
    MIN(orderDate) AS first_order,
    MAX(orderDate) AS last_order
FROM orders;


/*--------------------------------------------------------------
8. Identify products with no sales history
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
