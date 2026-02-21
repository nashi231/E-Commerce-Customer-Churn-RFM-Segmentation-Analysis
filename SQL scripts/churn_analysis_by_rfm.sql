SELECT Customer_Segment, 
COUNT(*) as customer_count,
 round(100*COUNT(*)/SUM(COUNT(*)) over (),2) as percent_of_base, 
SUM(Lifetime_Value) AS Total_Revenue, 
ROUND(100.0 * SUM(Lifetime_Value) / SUM(SUM(Lifetime_Value)) OVER(), 2) AS Revenue_Percent,
ROUND(AVG(Churned )* 100, 2) AS Churn_Rate_Percent 
FROM raw_data 
GROUP BY Customer_Segment;

