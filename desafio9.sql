SELECT COUNT(*) 'quantidade_musicas_no_historico'
FROM SpotifyClone.user_reproduction_history_songs `urhs`
INNER JOIN SpotifyClone.users `users`
ON urhs.user_id = users.user_id
WHERE users.user_name = 'Bill';