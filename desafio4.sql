SELECT
    users.user_name 'usuario',
    IF(MAX(YEAR(urhs.date)) = 2021, 'Usuário ativo', 'Usuário inativo') 'condicao_usuario'
FROM SpotifyClone.users `users`
INNER JOIN SpotifyClone.user_reproduction_history_songs `urhs`
ON urhs.user_id = users.user_id
GROUP BY users.user_id
ORDER BY users.user_name;;