SELECT 
  A.name,
	CAST((((B.math * 2) + (B.specific * 3) + (B.project_plan * 5)) / 10) AS NUMERIC(10,2)) AS avg
FROM candidate AS A
INNER JOIN score AS B
  ON A.id = B.candidate_id
ORDER BY avg DESC;
