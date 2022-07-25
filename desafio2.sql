SELECT
  (SELECT COUNT(*) FROM  SpotifyClone.songs) 'cancoes',
  (SELECT COUNT(*) FROM  SpotifyClone.artists) 'artistas',
  (SELECT COUNT(*) FROM  SpotifyClone.albums) 'albuns';