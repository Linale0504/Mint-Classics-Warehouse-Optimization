# Mint-Classics-Warehouse-Optimization
SQL + Power BI project analyzing warehouse performance and inventory optimization using the Mint Classics dataset.
# 📦 Mint Classics Warehouse Optimization

SQL | Power BI | Data Analysis | Inventory Optimization

---

## 📖 Project Overview

Mint Classics is a collectible model car company that plans to close one of its storage warehouses while maintaining customer service levels. The objective of this project is to analyze inventory and sales performance to identify opportunities for warehouse consolidation and inventory optimization.

Using SQL for data exploration and Power BI for visualization, this project evaluates warehouse productivity, product performance, inventory allocation, and revenue contribution to provide data-driven business recommendations.

---

## 🎯 Business Problem

Mint Classics management would like to:

- Reduce warehouse operating costs
- Optimize inventory allocation
- Identify slow-moving and excess inventory
- Understand warehouse utilization
- Make informed decisions before closing a warehouse

The challenge is determining which products and warehouses contribute the most business value while minimizing operational risks.

---
## 📌 Project Highlights

- Analyzed 110 products across 4 warehouses
- Evaluated inventory value, warehouse productivity and revenue contribution
- Built an interactive 2-page Power BI dashboard
- Developed SQL analyses using CTEs and Window Functions
- Identified slow-moving inventory and warehouse optimization opportunities

  ---
## 📂 Dataset

Source:
Mint Classics Sample Database (MySQL)

Main tables used:

- Products
- Warehouses
- Orders
- OrderDetails

Analysis period:

January 2003 – May 2005

---

## 🛠 Tools Used

| Tool | Purpose |
|-------|----------|
| SQL (MySQL) | Data extraction & analysis |
| Power BI | Dashboard & visualization |
| Excel | Business interpretation |
| GitHub | Project documentation |

---

# 🔍 Project Workflow

```
Business Problem
        │
        ▼
Exploratory Data Analysis (SQL)
        │
        ▼
Warehouse Performance Analysis
        │
        ▼
Product Performance Analysis
        │
        ▼
Power BI Dashboard
        │
        ▼
Business Insights
        │
        ▼
Recommendations
```

---

# 📊 Dashboard Preview

## Page 1 – Warehouse Performance

<img width="1313" height="742" alt="image" src="https://github.com/user-attachments/assets/26ef7734-f050-4c27-be2e-912fbeb05473" />


Key metrics include:

- Total Revenue
- Inventory Value
- Warehouse Utilization
- Revenue Contribution
- Inventory Productivity

---

## Page 2 – Product Performance

<img width="1313" height="737" alt="image" src="https://github.com/user-attachments/assets/f002fbbc-7cb1-4520-bc4f-05e75a48e4fa" />


Key metrics include:

- Product Revenue Ranking
- Pareto Analysis
- Inventory Coverage
- Product Categories
- Slow-moving Products

---

# 📈 SQL Analysis

The SQL analysis is organized into three modules.

### 01_EDA.sql

Exploratory analysis including:

- Dataset overview
- Warehouse summary
- Product distribution
- Sales period
- Products with no sales

---

### 02_Warehouse_Performance.sql

Warehouse-level performance analysis:

- Warehouse capacity
- Inventory value
- Revenue contribution
- Product line allocation
- Revenue-to-inventory ratio

---

### 03_Product_Performance.sql

Product-level analysis including:

- Revenue ranking
- Pareto (80/20) analysis
- Products without sales
- Inventory coverage analysis

---

# 🔑 Key Findings

### Warehouse Performance

- Warehouse B stores the largest inventory value but does not generate proportional revenue.
- Revenue productivity differs significantly between warehouses.
- Certain product lines occupy substantial inventory while contributing relatively low revenue.

---

### Product Performance

- Approximately 20% of products contribute the majority of total revenue (Pareto Principle).
- One product has never been sold despite occupying warehouse space.
- Inventory coverage varies greatly among products, indicating opportunities for inventory optimization.

---

### Inventory Coverage

Inventory coverage was estimated using:

Months of Inventory =
Current Inventory ÷ Average Monthly Sales

Because vendor lead time data is unavailable, inventory coverage is used instead of traditional safety stock calculations.

---

# 💡 Recommendations

Based on the analysis:

- Review products with extremely high inventory coverage.
- Consider reducing inventory levels for low-performing products.
- Maintain adequate stock for high-revenue products.
- Investigate products with zero historical sales.
- Reallocate warehouse space according to product performance.
- Use inventory turnover and revenue contribution together when making warehouse consolidation decisions.

---

# 📁 Repository Structure

```
Mint-Classics-Warehouse-Optimization
│
├── SQL
│   ├── 01_EDA.sql
│   ├── 02_Warehouse_Performance.sql
│   └── 03_Product_Performance.sql
│
├── Dashboard
│   ├── Dashboard_Page1.png
│   ├── Dashboard_Page2.png
│   └── MintClassics.pbix
│
├── Report
│   ├── Executive_Report.pdf
│   └── Executive_Report.docx
│
└── README.md
```

---

# 🚀 Skills Demonstrated

- SQL
- Common Table Expressions (CTEs)
- Window Functions
- Business Analysis
- Inventory Analytics
- Data Visualization
- Power BI Dashboard Design
- Warehouse Performance Analysis
- Pareto Analysis
- GitHub Documentation

---

# 👤 Author

Le Thi Thuy Nhung (Lina Le)

Aspiring Data Analyst with interests in:

- Supply Chain Analytics
- Manufacturing
- Semiconductor Industry
- Business Intelligence
- Data Visualization

GitHub:
https://github.com/Linale0504

---
