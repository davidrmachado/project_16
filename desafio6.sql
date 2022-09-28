SELECT 
CONCAT(ROUND(MIN(plan_value), 2), '.00') AS faturamento_minimo,
CONCAT(ROUND(MAX(plan_value), 2)) AS faturamento_maximo,
CONCAT(ROUND(AVG(plan_value), 2)) AS faturamento_medio,
CONCAT(ROUND(SUM(plan_value), 2)) AS faturamento_total
FROM SpotifyClone.plan
INNER JOIN SpotifyClone.user ON user.plan_id = plan.plan_id;