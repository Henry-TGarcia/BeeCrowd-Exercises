SELECT 
  B.name,
  ROUND(SUM((A.hours * 150) + ((A.hours * 150) * (C.bonus / 100))),1) AS salary
FROM attendances AS A
INNER JOIN doctors AS B 
  ON B.id = A.id_doctor
INNER JOIN work_shifts AS C
  ON C.id = A.id_work_shift
GROUP BY 1
ORDER BY salary DESC;
