USE dsstudent;

# 1
CREATE TEMPORARY TABLE storage
SELECT table_name, table_rows
FROM information_schema.tables
WHERE table_schema = 'loandb';

SELECT *
FROM storage;

# 2
SELECT 
    AMT_INCOME_TOTAL AS annual_income,
    AMT_INCOME_TOTAL / 12 AS monthly_income
FROM loandb.train t;
   
  # 3
SELECT round((DAYS_BIRTH / -365.0)) AS age
FROM loandb.train t;
 
# 4
SELECT
    OCCUPATION_TYPE AS occupation_type,
    COUNT(*) AS quantity 
FROM loandb.train t 
WHERE  occupation_type IS NOT NULL
GROUP BY OCCUPATION_TYPE
ORDER BY quantity DESC;
    
 # 5
SELECT DAYS_EMPLOYED ,
    CASE
        WHEN DAYS_EMPLOYED = (SELECT MAX(DAYS_EMPLOYED) FROM loandb.train t ) THEN 'bad data'
        ELSE 'normal data'
    END AS Flag_for_bad_data
FROM loandb.train t;

# 6
SELECT 
	t.target,
	min(ip.DAYS_INSTALMENT) min_days_installment,
	max(ip.DAYS_INSTALMENT) max_days_installment,
	min(ip.DAYS_ENTRY_PAYMENT) min_days_entry_payment,
	max(ip.DAYS_ENTRY_PAYMENT) max_days_entry_payment

FROM loandb.installments_payments ip 
	LEFT JOIN loandb.credit_card_balance ccb ON ip.SK_ID_PREV  = ccb.SK_ID_PREV 
	LEFT JOIN loandb.previous_application pa ON ip.SK_ID_PREV = pa.SK_ID_PREV 
	LEFT JOIN loandb.train t ON ip.SK_ID_CURR = t.SK_ID_CURR 
GROUP BY t.target;
	
DROP TABLE storage; 

