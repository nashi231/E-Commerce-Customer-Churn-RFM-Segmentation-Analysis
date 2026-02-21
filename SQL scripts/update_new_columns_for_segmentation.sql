update raw_data
set recency_score = 
	case
	when days_since_last_purchase <=30 THEN 3
	when days_since_last_purchase <=90 THEN 2
	else 1
	end,
    frequency_score = 
	CASE
    WHEN Total_Purchases >= 20 THEN 3
    WHEN Total_Purchases >= 5 THEN 2
    ELSE 1
	END,
    monetary_score =
	CASE
    WHEN Lifetime_Value >= 1000 THEN 3
    WHEN Lifetime_Value >= 300 THEN 2
    ELSE 1
	END;
