SELECT
    CASE 
        WHEN total_purchases = 1 THEN 'One-time'
        ELSE 'Repeat'
    END AS customer_type,
    COUNT(*) AS total_customers
FROM customers
GROUP BY customer_type;


