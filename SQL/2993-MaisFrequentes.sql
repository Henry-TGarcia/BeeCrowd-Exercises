SELECT 
  A.amount
FROM value_table AS A
GROUP BY A.amount
ORDER BY COUNT(A.amount) DESC
LIMIT 1;
