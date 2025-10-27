SELECT A.name,
       COUNT(B.id) as matches,
       SUM(CASE
	    WHEN A.id = B.team_1 AND B.team_1_goals > B.team_2_goals THEN 1
	    WHEN A.id = B.team_2 AND B.team_2_goals > B.team_1_goals THEN 1
      	    ELSE 0
            END) AS victories,
       SUM(CASE
            WHEN A.id = B.team_1 AND B.team_1_goals < B.team_2_goals THEN 1
            WHEN A.id = B.team_2 AND B.team_2_goals < B.team_1_goals THEN 1
            ELSE 0
            END) AS defeats,
       SUM(CASE
	    WHEN A.id = B.team_1 AND B.team_1_goals = B.team_2_goals THEN 1
            WHEN A.id = B.team_2 AND B.team_2_goals = B.team_1_goals THEN 1
            ELSE 0
            END) AS draws,
       SUM(CASE
	    WHEN A.id = B.team_1 AND B.team_1_goals > B.team_2_goals THEN 3
	    WHEN A.id = B.team_2 AND B.team_2_goals > B.team_1_goals THEN 3
	    WHEN A.id = B.team_1 AND B.team_1_goals < B.team_2_goals THEN 0
            WHEN A.id = B.team_2 AND B.team_2_goals < B.team_1_goals THEN 0
            WHEN A.id = B.team_1 AND B.team_1_goals = B.team_2_goals THEN 1
            WHEN A.id = B.team_2 AND B.team_2_goals = B.team_1_goals THEN 1
            ELSE 0
            END) AS score
FROM teams AS A
INNER JOIN matches AS B
 ON A.id IN (B.team_1 ,B.team_2)
GROUP BY A.name
ORDER BY score DESC;
