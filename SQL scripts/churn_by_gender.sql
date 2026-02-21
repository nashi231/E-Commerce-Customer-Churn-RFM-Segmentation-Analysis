select gender, SUM(c.churned) as churned_customers, COUNT(*) as total_customers, ROUND(SUM(c.churned)/COUNT(*)*100,2) as churn_rate
from customers as c 
group by c.gender;
