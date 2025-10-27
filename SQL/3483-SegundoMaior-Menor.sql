WITH populacoes AS (
 SELECT DISTINCT population
 FROM cities
 ORDER BY population DESC
),
numerar AS (
 SELECT population, 
        ROW_NUMBER() OVER() AS posicao,
        (SELECT COUNT(*) FROM populacoes) AS total
 FROM populacoes
),
valor_alvo AS (
 SELECT population
 FROM numerar
 WHERE posicao IN (2, total - 1)
)
SELECT city_name,
       population
FROM cities
WHERE population IN (SELECT population FROM valor_alvo)
