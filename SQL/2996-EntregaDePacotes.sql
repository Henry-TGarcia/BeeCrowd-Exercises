SELECT 
  A.year, 
  B.name AS sender, 
  C.name AS receiver
FROM packages AS A
INNER JOIN users AS B 
  ON A.id_user_sender = B.id
INNER JOIN users AS C 
  ON A.id_user_receiver = C.id
WHERE (A.color = 'blue' OR A.year = 2015) AND B.address <> 'Taiwan' AND C.address <> 'Taiwan'
ORDER BY A.year DESC;
