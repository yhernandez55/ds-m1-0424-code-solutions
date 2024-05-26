USE telecom;

SELECT * FROM event_type et 
	LEFT JOIN log_feature lf  ON et.id =lf.id;


SELECT t.id, t.location, t.fault_severity, et.event_type, st.severity_type, rt.resource_type, lf.log_feature, lf.volume 
	FROM train t  
	LEFT JOIN event_type et  ON t.id = et.id 
	LEFT JOIN severity_type st ON et.id = st.id 
	LEFT JOIN resource_type rt ON st.id = rt.id
	LEFT JOIN log_feature lf ON rt.id =lf.id;
	