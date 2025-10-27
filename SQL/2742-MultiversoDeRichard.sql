SELECT 
  B.name, 
  ROUND(B.omega * 1.618, 3) AS FatorN
FROM dimensions AS A
INNER JOIN life_registry AS B
 ON B.dimensions_id = A.id
WHERE B.name LIKE 'Richard%' 
  AND A.name IN ('C875', 'C774')
ORDER BY B.omega ASC
