SELECT 
  A.temperature, 
  COUNT(A.mark) AS number_of_records
FROM records AS A
GROUP BY A.mark, A.temperature
ORDER BY mark;
