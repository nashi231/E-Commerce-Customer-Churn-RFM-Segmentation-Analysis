ALTER TABLE customers
ALTER COLUMN age TYPE INT
USING (
    CASE
        WHEN TRIM(age) ~ '^\d+$' THEN TRIM(age)::INT
        ELSE NULL
    END
);
