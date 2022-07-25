SELECT
    artists.artist_name 'artista',
    albums.album_name 'album'
FROM SpotifyClone.artists `artists`
INNER JOIN SpotifyClone.albums `albums`
ON artists.artist_id = albums.artist_id
GROUP BY albums.album_id, artists.artist_id
HAVING artists.artist_name = 'Walter Phoenix'
ORDER BY album;