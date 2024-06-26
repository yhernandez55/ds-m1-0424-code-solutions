USE telecom;

# part 1
CREATE TEMPORARY TABLE temp_log_feature AS
SELECT *,
	CASE 
		WHEN volume < 100 THEN "low"
		WHEN volume >= 100 AND volume <= 500 THEN "medium"
		WHEN volume > 500 THEN "large"
		ELSE "unknown"
	END volume_1
FROM log_feature;

SELECT volume_1, count(*)
FROM temp_log_feature
GROUP BY volume_1;

# part 2

USE hr;

SELECT e.EmployeeNumber, e.Hourlyrate,
	CASE 
		WHEN HourlyRate > 80 THEN "high hourly rate"
		WHEN HourlyRate >= 40 AND HourlyRate <= 80 THEN "medium hourly rate"
		WHEN HourlyRate < 40 THEN "low hourly rate"
		ELSE "unknown"
	END hourly_rate_category
FROM employee e;

SELECT e.EmployeeNumber, e.Gender,
	CASE 
		WHEN Gender = 'Female' THEN 0
		WHEN Gender = 'Male' THEN 1
	END Gender_1
FROM employee e;


DROP TEMPORARY TABLE temp_log_feature;