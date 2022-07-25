SELECT
    MIN(plans.value) 'faturamento_minimo',
    MAX(plans.value) 'faturamento_maximo',
    ROUND(AVG(plans.value), 2) 'faturamento_medio',
    SUM(plans.value) 'faturamento_total'
FROM SpotifyClone.plans `plans`
INNER JOIN SpotifyClone.users `users`
ON plans.plan_id = users.plan_id;