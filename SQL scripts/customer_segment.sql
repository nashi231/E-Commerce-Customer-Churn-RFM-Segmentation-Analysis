update raw_data
set customer_segment = 
CASE
    WHEN RFM_Total >= 8 THEN 'High Value Loyal'
    WHEN RFM_Total >= 6 THEN 'Active Mid-Tier'
    WHEN RFM_Total >= 4 THEN 'Low Engagement'
    ELSE 'At Risk'
END;
