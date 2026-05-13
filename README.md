# ShopSmart USA — Customer & Sales Analysis

> An end-to-end data analytics project analyzing 50,000 customers and 50,000 orders from a fictional U.S. e-commerce retailer — covering SQL, Python EDA, and Power BI dashboards.

![Python](https://img.shields.io/badge/Python-3.11-blue?logo=python&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-16-336791?logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?logo=powerbi&logoColor=black)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

---

## Overview

ShopSmart USA is a simulated retail analytics project built to demonstrate a full data workflow — from raw CSV files to SQL business questions, Python-based EDA and machine learning, and a multi-page Power BI dashboard. The dataset includes customer demographics, membership tiers, order history, discounts, returns, and review scores.

---

## Tech Stack

| Layer | Tools |
|---|---|
| Database | PostgreSQL, pgAdmin |
| Analysis | Python, Jupyter Notebook |
| Visualization | Power BI |
| Libraries | pandas, matplotlib, seaborn, plotly, scikit-learn, Prophet |

---

## Dataset

| File | Rows | Description |
|---|---|---|
| `customers.csv` | 50,000 | Demographics, membership tier, spend history, account status |
| `orders.csv` | 50,000 | Order details, categories, discounts, returns, review scores |

---

## Project Structure

```
shopsmart-usa-analysis/
├── data/
│   ├── customers.csv
│   └── orders.csv
├── sql/
│   └── shopsmart_usa_analysis.sql
├── notebooks/
│   └── shopsmart_eda.ipynb
├── report/
│   └── ShopSmart_USA_Executive_Report.xlsx
└── README.md
```

---

## SQL Analysis

15 business questions written in PostgreSQL, organized by difficulty.

<details>
<summary><strong>Basic (Questions 1–5)</strong></summary>

1. How many total customers are there and how many are active?
2. How many customers are in each membership tier?
3. Who are the top 10 customers with the most orders?
4. Which state has the most customers?
5. What is the total revenue and average order value?

</details>

<details>
<summary><strong>Intermediate (Questions 6–10)</strong></summary>

6. What is the total sales and average discount per category?
7. Which payment method is used the most?
8. Monthly revenue trend (2022–2025)
9. Which category has the highest return rate?
10. What is the average spending of Platinum members?

</details>

<details>
<summary><strong>Advanced (Questions 11–15)</strong></summary>

11. Customer Lifetime Value (CLV)
12. Top selling category per state using window functions (RANK, PARTITION BY)
13. Customers with no orders in the last 6 months — churn risk identification
14. Cohort analysis — which registration year drives the most purchases?
15. Impact of discount percentage on revenue

</details>

---

## Python Analysis

Conducted in Jupyter Notebook across three sections.

**Data Cleaning**
- Null value checks, duplicate removal, data type corrections, outlier detection via box plots

**Exploratory Data Analysis**
- Age distribution histogram, revenue distribution with skewness check
- Correlation matrix, category sales bar chart, monthly revenue line chart
- State-wise choropleth map (Plotly), review score distribution

**Advanced Analysis**
- RFM Segmentation — customers classified into Champions, Loyal, and At Risk
- Sales forecasting with Prophet
- Churn prediction using Logistic Regression
- Category revenue heatmap (Month × Category)

---

## Power BI Dashboard

Four interactive pages:

| Page | Contents |
|---|---|
| Executive Summary | Total revenue, orders, customers, avg order value, monthly trend line, USA revenue map |
| Customer Intelligence | Membership tier donut, gender breakdown, top 10 states, payment methods, account status |
| Sales & Product Analysis | Category revenue, return rates by category, review scores, discount vs revenue scatter |
| Trends & Forecasting | Year-over-year growth, seasonal trends, 6-month forecast, churn risk count |

---

## Key Findings

- Platinum members generate a disproportionate share of total revenue despite being the smallest customer segment
- Electronics carries the highest return rate across all product categories
- California and Texas rank first and second in both customer count and total sales
- Customers receiving discounts in the 21–30% range show notably lower review scores on average
- Approximately 15% of the customer base qualifies as churn risk based on 6-month purchase inactivity

---

## Business Recommendations

1. **Retain Platinum customers** — introduce exclusive loyalty rewards or early access programs to protect this high-value segment
2. **Reduce Electronics return rate** — implement stricter quality checks and clearer product descriptions to set better expectations
3. **Double down on California and Texas** — these states have the highest ROI potential for targeted marketing spend
4. **Re-engage at-risk customers** — trigger automated win-back campaigns for customers inactive for 90+ days before they reach the 6-month churn threshold
5. **Rethink deep discounts** — the 21–30% discount band is hurting review scores; consider capping promotional discounts or improving delivery/product quality at those tiers
6. **Optimize payment options** — analyze the most-used payment methods by membership tier and reduce friction for underused but high-converting options
7. **Seasonal campaign planning** — leverage cohort and seasonal trend data to align inventory and marketing pushes with peak buying periods
8. **Upsell Gold members to Platinum** — Gold members are likely the easiest conversion target; a targeted upgrade campaign could shift significant revenue upward

---

## Author

**Rohit Sircar**
Data Analytics Student — Northern Virginia Community College | Microsoft PL-300 | Tableau Certified | DP-900 | Google Generative AI Leader

[LinkedIn](https://linkedin.com/in/rohitsircar) · [GitHub](https://github.com/RohitSircar45) · [Portfolio](https://rohitsircar.com)
