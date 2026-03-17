# Logistics Delivery Performance Dashboard

An end to end analytics project analysing delivery performance across 180,000 shipments
using SQL, Python and Power BI.

Built as a portfolio project to demonstrate practical skills in data preparation,
exploratory analysis and business intelligence reporting.

---

## Business Problem

More than half of all shipments in this dataset arrive late. This project investigates
where, when and why delays occur, and builds a dashboard that gives operations teams
the visibility to understand delivery performance across shipping modes, product
categories and time.

---

## Key Findings

- **54.83%** of all orders are delivered late
- **First Class** shipping has the highest late delivery rate at **95%**, despite being
a premium service
- **Standard Class** performs best at **38%** late delivery rate
- Late delivery rates increased consistently from **~20% in 2015** to **~40% in 2017**
- The problem is **systemic** rather than regional, with all markets showing similar
rates around 54-58%
- **Golf Bags & Carts** and **Lacrosse** products have the highest category level late
delivery rates at 69% and 60%

---

## Tools and Workflow

| Step | Tool | Purpose |
|------|------|---------|
| Data cleaning | SQL (SQLite) | Selected relevant columns, standardised naming |
| Exploration | SQL (SQLite) | Null checks, distribution analysis, late delivery breakdowns |
| KPI queries | SQL (SQLite) | Validated key metrics before building dashboard visuals |
| Analysis | Python (pandas, matplotlib) | Late delivery rate analysis and chart by shipping mode |
| Dashboard | Power BI | Interactive two page dashboard with DAX measures and date intelligence |

---

## Project Structure
```
Logistics Project/
│
├── Data/
│   ├── Clean/
│   │   └── logistics_clean.csv
│   └── Raw/
│       └── DataCoSupplyChainDataset.csv
│
├── Sql/
│   ├── 01_Cleaning.sql
│   ├── 02_Quality_Checks_Exploration.sql
│   └── 03_Dashboard_Queries.sql
│
├── PowerBI/
│   ├── logistics_dashboard.pbix
│   └── Screenshots/
│       ├── page1_delivery_overview.png
│       └── page2_performance_deep_dive.png
│
├── Python/
│   ├── delay_analysis.py
│   └── late_delivery_by_shipping_mode.png
│
└── README.md
```

---

## Dashboard Pages

### Page 1: Delivery Overview
Headline KPIs including total orders, late delivery rate, on time rate and average
shipping days. Includes a breakdown of late delivery rate by shipping mode and a
donut chart showing the full delivery status distribution. Filterable by market.

### Page 2: Performance Deep Dive
Late delivery rate across the top 15 product categories showing which products are
most affected. A clustered column chart comparing actual vs scheduled shipping days
by shipping mode, revealing where delivery promises are consistently broken. A yearly
trend line showing the steady increase in late delivery rates from 2015 to 2017.

---

## Data Notes

- Dataset covers 180,519 orders across five global markets from 2015 to early 2018
- Original dataset: 53 columns. Cleaned dataset: 24 columns
- 2018 data covers January and February only and is excluded from trend analysis
- All KPIs are based on actual delivery outcomes via the Delivery Status column,
not the binary late delivery risk flag

---

## Data Source

DataCo Smart Supply Chain Dataset available on Kaggle.

---

## Certifications

- Microsoft Certified Power BI Data Analyst Associate (PL-300)
- Associate Data Analyst in SQL, DataCamp