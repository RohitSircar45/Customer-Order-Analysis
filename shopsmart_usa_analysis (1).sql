-- ShopSmart USA Business Analysis
-- Tables: customers, orders


-- 1. Executive Summary

SELECT
    COUNT(*)                           AS Total_Orders,
    ROUND(SUM(grand_total_usd), 2)     AS Total_Revenue_USD,
    ROUND(AVG(grand_total_usd), 2)     AS Avg_Order_Value_USD,
    ROUND(MIN(grand_total_usd), 2)     AS Min_Order_USD,
    ROUND(MAX(grand_total_usd), 2)     AS Max_Order_USD,
    ROUND(SUM(discount_amount_usd), 2) AS Total_Discount_USD,
    ROUND(SUM(tax_amount_usd), 2)      AS Total_Tax_USD,
    ROUND(SUM(shipping_fee_usd), 2)    AS Total_Shipping_USD
FROM orders;


-- 2. Customer Segments

SELECT
    membership_tier,
    COUNT(DISTINCT customer_id)    AS Total_Customers,
    ROUND(AVG(total_spent_usd), 2) AS Avg_Spent_USD,
    ROUND(SUM(total_spent_usd), 2) AS Total_Spent_USD,
    ROUND(AVG(total_orders), 1)    AS Avg_Orders
FROM customers
GROUP BY membership_tier
ORDER BY Total_Spent_USD DESC;


-- 3. Sales by Category

SELECT
    category,
    COUNT(*)                        AS Total_Orders,
    SUM(quantity)                   AS Total_Units_Sold,
    ROUND(SUM(grand_total_usd), 2)  AS Total_Revenue_USD,
    ROUND(AVG(grand_total_usd), 2)  AS Avg_Order_Value_USD,
    ROUND(AVG(discount_percent), 2) AS Avg_Discount_Pct
FROM orders
GROUP BY category
ORDER BY Total_Revenue_USD DESC;


-- 4. Regional Performance (top category per state)

WITH state_category AS (
    SELECT
        shipping_state,
        category,
        COUNT(*)                       AS Total_Orders,
        ROUND(SUM(grand_total_usd), 2) AS Total_Revenue_USD
    FROM orders
    GROUP BY shipping_state, category
),
ranked AS (
    SELECT *,
        RANK() OVER (PARTITION BY shipping_state ORDER BY Total_Revenue_USD DESC) AS Rank_No
    FROM state_category
)
SELECT shipping_state, category, Total_Orders, Total_Revenue_USD, Rank_No
FROM ranked
WHERE Rank_No = 1
ORDER BY Total_Revenue_USD DESC;


-- 5. Discount Analysis

SELECT
    CASE
        WHEN discount_percent = 0               THEN '0% - No Discount'
        WHEN discount_percent BETWEEN 1  AND 10 THEN '01-10% - Low'
        WHEN discount_percent BETWEEN 11 AND 20 THEN '11-20% - Medium'
        WHEN discount_percent BETWEEN 21 AND 30 THEN '21-30% - High'
        WHEN discount_percent BETWEEN 31 AND 40 THEN '31-40% - Very High'
    END                                                                        AS Discount_Range,
    COUNT(*)                                                                   AS Total_Orders,
    ROUND(AVG(grand_total_usd), 2)                                             AS Avg_Order_Value_USD,
    ROUND(AVG(customer_review_score), 2)                                       AS Avg_Review_Score,
    ROUND(100.0 * SUM(CASE WHEN is_returned THEN 1 ELSE 0 END) / COUNT(*), 2) AS Return_Rate_Pct,
    ROUND(SUM(grand_total_usd), 2)                                             AS Total_Revenue_USD
FROM orders
GROUP BY Discount_Range
ORDER BY MIN(discount_percent);


-- 6. Loyalty & Churn Risk (top 50 high-value customers)

SELECT
    customer_id,
    CONCAT(first_name, ' ', last_name)                             AS Full_Name,
    membership_tier,
    total_orders,
    DATE(last_login_date)                                          AS Last_Login,
    CAST(JULIANDAY('now') - JULIANDAY(last_login_date) AS INT)     AS Inactive_Days,
    ROUND(total_spent_usd, 2)                                      AS Total_Spent_USD
FROM customers
ORDER BY total_spent_usd DESC
LIMIT 50;


-- 7. Revenue Trends (monthly)

SELECT
    CAST(STRFTIME('%Y', order_date) AS INT) AS Year,
    CAST(STRFTIME('%m', order_date) AS INT) AS Month,
    STRFTIME('%B', order_date)              AS Month_Name,
    COUNT(*)                                AS Total_Orders,
    ROUND(SUM(grand_total_usd), 2)          AS Total_Revenue_USD,
    ROUND(AVG(grand_total_usd), 2)          AS Avg_Order_Value_USD
FROM orders
GROUP BY Year, Month
ORDER BY Year, Month;


-- 8. Operational Metrics (returns & reviews by category)

SELECT
    category,
    COUNT(*)                                                                       AS Total_Orders,
    SUM(CASE WHEN is_returned THEN 1 ELSE 0 END)                                  AS Total_Returns,
    ROUND(100.0 * SUM(CASE WHEN is_returned THEN 1 ELSE 0 END) / COUNT(*), 2)     AS Return_Rate_Pct,
    ROUND(AVG(customer_review_score), 2)                                           AS Avg_Review_Score
FROM orders
GROUP BY category
ORDER BY Return_Rate_Pct DESC;
