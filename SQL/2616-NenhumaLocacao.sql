SELECT 
  customers.id, 
  customers.name 
FROM locations
FULL OUTER JOIN customers
  ON locations.id_customers = customers.id
WHERE locations_date IS NULL
ORDER BY customers.id
