SELECT songs.name 'cancao', COUNT(urhs.song_id) 'reproducoes'
FROM SpotifyClone.songs `songs`
INNER JOIN SpotifyClone.user_reproduction_history_songs `urhs`
ON songs.song_id = urhs.song_id
GROUP BY songs.song_id
HAVING reproducoes = 2
ORDER BY songs.name
LIMIT 2;