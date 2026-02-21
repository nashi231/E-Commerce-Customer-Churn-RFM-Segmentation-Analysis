# 📊E-Commerce-Customer-Churn-RFM-Segmentation-Analysis

📌Overview  
This project analyzes customer behavior and churn patterns using an e-commerce dataset of 50,000 customers sourced from kaggle. The analysis was conducted entirely in SQL, including data cleaning, transformation, segmentation, and revenue risk evaluation.  

**🧠Business Objective**  
Customer churn directly impacts revenue stability. This project aims to:
-Identify high-value customer segments
-Measure revenue concentration across segments
-Quantify churn rates by segment
-Demonstrate a structured analytical pipeline from raw data to business insights  

**📂 Dataset Information**  
Source: Kaggle (E-Commerce Customer Behavior Dataset)
Records: ~50,000 customers
No. of features: 25   

Key features:   
Demographics: Age, Gender, Country, City
Behavioral: Login Frequency, Session Duration, Email Open Rate
Financial: Total Purchases, Average Order Value, Lifetime Value
Engagement: Mobile App Usage, Product Reviews, churned  

**🛠 Data Preparation & Cleaning**  
The dataset is preprocessed before analysis.
- Data type corrections. 
  - eg: ALTER TABLE customers
        ALTER COLUMN age TYPE INT
        USING (
            CASE
            WHEN TRIM(age) ~ '^\d+$' THEN TRIM(age)::INT
            ELSE NULL
        END
    );
- Data Validation Checks
Performed inspection and validation including churn distribution, negative value etection, null value detection and handling
-Analytical table creation
Carried out customer analysis by demographic and gender using a sub table created from the main database called customers. 
  -CREATE TABLE customers AS
   SELECT age, gender, country, city, total_purchases, churned, signup_quarter
   FROM raw_data;  
  
**Methodology**
Customers were segmented using Recency, Frequency, and Monetary scoring.  

Each component was scored from 1–3 based on thresholds.
The total RFM score was calculated: rfm_total = recency_score + frequency_score + monetary_score
Customers were classified into four segments:  

High Value Loyal  
Active Mid-Tier
Low Engagement
At Risk  

**📈 Key Analysis Performed**  
- Churn Rate by Gender & Country
Measured churn distribution across demographic groups.
- Purchase Behavior Classification
Customers categorized as:
One-time buyers
Repeat buyers
-Revenue Concentration by Segment
Calculated:
Segment size (% of total customers)
Revenue contribution (% of total revenue)
Churn rate by segment
-eg:   SELECT Customer_Segment,
       COUNT(*) AS customer_count,
       SUM(Lifetime_Value) AS Total_Revenue,
       ROUND(AVG(Churned) * 100, 2) AS Churn_Rate_Percent
       FROM raw_data
       GROUP BY Customer_Segment;  
  
**Key Insights**  
-Male and female customers make up similar portions of the base while other customers are a significantly lower number. However, churn rate is distributed almost equally among all three with others being slightly higher.
-USA makes up the highest portion of the customer base (34%) followed by UK (15%)
-Churn rates across all countries and all 3 genders are very similar (~30%) and so they show that these two factors are not making an impact on churn.
-Over 98% of customers are repeat customers and only <2% of customers never came back (one time customers)
-Revenue was heavily concentrated among higher RFM segments(high value making up 57% and active making up 40% of the revenue generated).
-At Risk customers exhibited significantly higher churn rates while the higher tiers had <30% churn rate each
-High Value Loyal and active customers represented a huge portion of the base and so contributed a disproportionately large share of revenue.  


🏁 Conclusion  

This project demonstrates a structured, end-to-end analytical workflow:
Raw Data → Cleaning → Validation → Segmentation → Revenue & Churn Analysis
The approach highlights how SQL can be used not just for querying data, but for building business-relevant segmentation frameworks and identifying retention risk.  

**Future scope**
-Dashboard visualization layer (Power BI / Tableau)
-Statistical validation of RFM thresholds
-Predictive modeling (Logistic Regression)
