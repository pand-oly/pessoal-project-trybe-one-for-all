SELECT
    artists.artist_name 'artista',
    albums.album_name 'album',
    COUNT(ufa.artist_id) 'seguidores'
FROM SpotifyClone.artists `artists`
INNER JOIN SpotifyClone.albums `albums`
ON artists.artist_id = albums.artist_id
INNER JOIN SpotifyClone.user_following_artist `ufa`
ON artists.artist_id = ufa.artist_id
GROUP BY artists.artist_id, albums.album_id
ORDER BY seguidores DESC, artista, album;