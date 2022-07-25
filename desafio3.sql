SELECT
    users.user_name 'usuario',
    COUNT(urhs.song_id) 'qtde_musicas_ouvidas',
    ROUND(SUM(songs.duration/60), 2) 'total_minutos'
FROM SpotifyClone.users `users`
INNER JOIN SpotifyClone.user_reproduction_history_songs `urhs`
ON users.user_id = urhs.user_id
INNER JOIN SpotifyClone.songs `songs`
on songs.song_id = urhs.song_id
GROUP BY users.user_name;
