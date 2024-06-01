
USE dsstudent;

# 1: 
CREATE TABLE customer_Yanelly(
   insert_order INT AUTO_INCREMENT PRIMARY KEY,
   customer_id SMALLINT,
   name VARCHAR(20),
   location VARCHAR(20),
   total_expenditure VARCHAR(20),
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

# 2: 
INSERT INTO customer_Yanelly (customer_id, name, location, total_expenditure) VALUES
    (1701, 'John', 'Newport Beach, CA', 2000),
    (1707, 'Tracy', 'Irvine, CA', 1500),
    (1711, 'Daniel', 'Newport Beach, CA', 2500),
    (1703, 'Ella', 'Santa Ana, CA', 1800),
    (1708, 'Mel', 'Orange, CA', 1700),
    (1716, 'Steve', 'Irvine, CA', 18000);
SELECT customer_Yanelly.customer_id, customer_Yanelly.name, customer_Yanelly.location, customer_Yanelly.total_expenditure 
FROM customer_Yanelly;

# 3: 
UPDATE customer_Yanelly
SET total_expenditure = 1800
WHERE name = 'Steve';
SELECT customer_Yanelly.customer_id, customer_Yanelly.name, customer_Yanelly.location, customer_Yanelly.total_expenditure 
FROM customer_Yanelly;


# 4: 
ALTER TABLE customer_Yanelly
ADD gender VARCHAR(20);
SELECT customer_Yanelly.customer_id, customer_Yanelly.name, customer_Yanelly.location, customer_Yanelly.total_expenditure, customer_Yanelly.gender 
FROM customer_Yanelly;


# 5: 
UPDATE customer_Yanelly
SET gender = CASE 
	WHEN customer_id = 1701 THEN 'M'
    WHEN customer_id = 1707 THEN 'F'
    WHEN customer_id = 1711 THEN 'M'
    WHEN customer_id = 1703 THEN 'F'
    WHEN customer_id = 1708 THEN 'F'
    WHEN customer_id = 1716 THEN 'M'
END;

SELECT customer_id, name, location, total_expenditure, gender 
FROM customer_Yanelly;

# 6: 
DELETE FROM customer_Yanelly
WHERE name = 'Steve';
SELECT customer_id, name, location, total_expenditure, gender 
FROM customer_Yanelly;

# 7: 
ALTER TABLE customer_Yanelly
ADD store VARCHAR (20);

# 8: 
ALTER TABLE customer_Yanelly
DROP COLUMN store;

# 9:
SELECT customer_id, name, location, total_expenditure, gender 
FROM customer_Yanelly;

# 10
SELECT name, total_expenditure
FROM customer_Yanelly;

# 11
SELECT name AS n, total_expenditure AS total_exp
FROM customer_Yanelly;

# 12
ALTER TABLE customer_Yanelly
MODIFY COLUMN total_expenditure SMALLINT;

# 13
SELECT total_expenditure
FROM customer_Yanelly
ORDER BY total_expenditure DESC;

# 14
SELECT name, total_expenditure
FROM customer_Yanelly
ORDER BY total_expenditure DESC
LIMIT 3;

# 15
SELECT COUNT(DISTINCT location) AS nuniques
FROM customer_Yanelly;

# 16
SELECT DISTINCT location AS unique_cities
FROM customer_Yanelly;

# 17
SELECT customer_id, name, location, total_expenditure, gender 
FROM customer_Yanelly
WHERE gender = 'M';

# 18
SELECT customer_id, name, location, total_expenditure, gender 
FROM customer_Yanelly
WHERE gender = 'F';

# 19
SELECT customer_id, name, location, total_expenditure, gender 
FROM customer_Yanelly
WHERE location = 'Irvine, CA';

# 20
SELECT name, location
FROM customer_Yanelly
WHERE total_expenditure < 2000
ORDER BY name ASC
LIMIT 3;

# 21
DROP TABLE customer_Yanelly;
