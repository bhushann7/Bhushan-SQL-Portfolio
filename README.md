# Free-to-Paid Conversion Rate Analysis

## Project Overview

This project analyzes the conversion rate from free to paid subscriptions using SQL and Python. The analysis is performed on a database containing user subscription data.

## Project Structure

1. SQL Database Import
2. SQL Subquery Creation
3. Main SQL Query with Calculations
4. Data Export to CSV
5. Python Analysis

## Detailed Steps

### 1. SQL Database Import

The project begins by importing the necessary database tables using the provided SQL script named `db_course_conversions`.

### 2. SQL Subquery Creation

A subquery is created to prepare the data for the main analysis. This subquery:

- Selects relevant columns from the `student_info`, `student_engagement`, and `student_purchases` tables
- Joins the tables to combine user information with engagement and purchase data
- Calculates the time differences between registration, first watch, and first purchase

```sql
SELECT 
    si.student_id, 
    si.date_registered, 
    MIN(se.date_watched) AS first_date_watched,
    MIN(sp.date_purchased) AS first_date_purchased,
    DATEDIFF(MIN(se.date_watched),MIN(si.date_registered)) AS days_diff_reg_watch,
    DATEDIFF(MIN(sp.date_purchased),MIN(se.date_watched)) AS days_diff_watch_purch
FROM student_info si
JOIN student_engagement se
    ON si.student_id = se.student_id
LEFT JOIN student_purchases sp
    ON si.student_id = sp.student_id
GROUP BY si.student_id
HAVING first_date_watched <= first_date_purchased
    OR first_date_purchased IS NULL
```

### 3. Main SQL Query

The main query builds upon the subquery to perform calculations:
- Free-to-Paid Conversion Rate
- Average Duration Between Registration and First-Time Engagement
- Average Duration Between First-Time Engagement and First-Time Purchase

```sql
SELECT
    ROUND(COUNT(first_date_purchased)/COUNT(first_date_watched),2) AS conversion_rate,
    ROUND(SUM(days_diff_reg_watch)/COUNT(days_diff_reg_watch),2) AS av_reg_watch,
    ROUND(SUM(days_diff_watch_purch)/COUNT(days_diff_watch_purch),2) AS av_watch_purch
FROM
    (
    SELECT 
        si.student_id AS sid, 
        si.date_registered AS sdr, 
        MIN(se.date_watched) AS first_date_watched,
        MIN(sp.date_purchased) AS first_date_purchased,
        DATEDIFF(MIN(se.date_watched),MIN(si.date_registered)) AS days_diff_reg_watch,
        DATEDIFF(MIN(sp.date_purchased),MIN(se.date_watched)) AS days_diff_watch_purch
    FROM student_info si
    INNER JOIN student_engagement se
        ON si.student_id = se.student_id
    LEFT JOIN student_purchases sp
        ON si.student_id = sp.student_id
    GROUP BY si.student_id
    HAVING first_date_watched <= first_date_purchased
        OR first_date_purchased IS NULL
    ) a;
```

### 4. Data Export

The results of the SQL query are exported to a CSV file for further analysis.

### 5. Interpretation of the results
 
Further analysis is performed using Python. The analysis script is named Analysis.py.

The analysis reveals crucial insights into user behavior and platform performance. 

- The free-to-paid conversion rate is approximately 11%, indicating that out of every 100 students who engage with the platform, about 11 purchase a subscription. While this may seem low, it's important to consider factors such as audience targeting, user onboarding, and individual circumstances affecting conversion. 

- The average time between registration and first engagement is 3-4 days, with most users starting immediately (mode and median of 0 days). This right-skewed distribution suggests that while most users engage quickly, some return much later, possibly due to marketing campaigns. 

- Regarding the duration between first engagement and purchase, the average is about 24 days, but the median is just 1 day, with 49% of purchases occurring on the same day as the first lecture view. This indicates that while many users convert quickly, there are outliers who purchase much later, possibly waiting for special offers. 

These insights can guide strategies for improving user onboarding, engagement, and conversion rates.
