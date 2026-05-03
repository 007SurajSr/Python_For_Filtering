# Sales Analyst Project

> End-to-end sales analysis using Python & PostgreSQL

![Python](https://img.shields.io/badge/Python-3.x-blue?style=flat-square)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-orange?style=flat-square)
![Pandas](https://img.shields.io/badge/Pandas-green?style=flat-square)
![Jupyter](https://img.shields.io/badge/Jupyter-Notebook-purple?style=flat-square)

---

## About

A complete data analysis project that filters and cleans raw order data in **Jupyter Notebook**, exports it to **PostgreSQL**, and runs advanced SQL queries to extract business insights on revenue, regional performance, and year-over-year growth.

---

## Key Analysis

| # | Question |
|---|----------|
| Q1 | Top 10 highest revenue-generating sub-categories |
| Q2 | Top 5 best-selling products per region |
| Q3 | Month-over-month sales comparison: 2022 vs 2023 |
| Q4 | Sub-category profit growth: 2022 vs 2023 |
| Q5 | Highest sales month per category |
| Q6 | Sub-category with highest profit growth in 2023 |

---

## Tech Stack

`Python` `Pandas` `Jupyter Notebook` `PostgreSQL` `pgAdmin` `SQLAlchemy` `psycopg2`

---

## Project Structure

```
sales-analyst/
├── data/
│   └── orders.csv
├── notebooks/
│   └── data_cleaning.ipynb
├── sql/
│   ├── create_table.sql
│   ├── analysis_queries.sql
│   └── insights.sql
├── report/
│   └── SalesAnalyst_Report.docx
└── README.md
```

---

## Quick Start

```bash
# 1. Install dependencies
pip install pandas sqlalchemy psycopg2-binary

# 2. Run Jupyter notebook
jupyter notebook notebooks/data_cleaning.ipynb

# 3. Open SQL queries in pgAdmin
# Run sql/analysis_queries.sql
```

---

## Key Insights

- **Phones & Chairs** are the top revenue drivers
- **TEC-CO-10004722** is the #1 product across 3 out of 4 regions
- **February 2023** saw 42% growth over February 2022
- **Machines** had the highest profit growth in 2023 (+48%)
- **Appliances** declined 41% in 2023 — needs strategic intervention

---

*Built with Python + PostgreSQL | 2022–2023 Sales Data*
