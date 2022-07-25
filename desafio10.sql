SELECT songs.name 'nome', COUNT(urhs.song_id) 'reproducoes'
FROM SpotifyClone.songs `songs`
INNER JOIN SpotifyClone.user_reproduction_history_songs `urhs`
ON urhs.user_id IN (
        SELECT user_id
        FROM SpotifyClone.users
        WHERE plan_id IN (1, 3)
    ) AND songs.song_id = urhs.song_id
GROUP BY songs.song_id
ORDER BY songs.name;