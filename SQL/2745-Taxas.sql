SELECT 
  A.name,
  CAST(A.salary * 0.1 AS NUMERIC(10,2)) AS tax
FROM people AS A
WHERE A.Salary > 3000;
