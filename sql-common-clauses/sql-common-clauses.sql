USE telecom;
# ex 1: SELECT/FROM/AS
SELECT lf.id, lf.log_feature, lf.volume  
FROM log_feature lf;


#ex 2: SORTING
SELECT id, resource_type
FROM resource_type rt 
ORDER BY id ASC 
LIMIT 5;


SELECT id, resource_type
FROM resource_type
ORDER BY id ASC
LIMIT 5;

SELECT id, resource_type 
FROM resource_type rt 
ORDER BY id,resource_type  ASC 
LIMIT 5;

# ex 3: COUNT /DISTINCT
SELECT 
    COUNT(*),
    COUNT(DISTINCT id),
    COUNT(DISTINCT severity_type) 
FROM 
    severity_type;

 # ex 4
SELECT id, log_feature, volume 
FROM log_feature 
WHERE log_feature = 'feature 201'
AND volume >= 100 AND volume <= 300
ORDER BY volume;