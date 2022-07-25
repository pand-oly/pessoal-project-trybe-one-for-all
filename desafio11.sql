SELECT name 'nome_musica',
    CASE
      WHEN name LIKE '%Streets%' THEN REPLACE(name, 'Streets', 'Code Review')
      WHEN name LIKE '%Her Own%' THEN REPLACE(name, 'Her Own', 'Trybe')
      WHEN name LIKE '%Inner Fire%' THEN REPLACE(name, 'Inner Fire', 'Project')
      WHEN name LIKE '%Silly%' THEN REPLACE(name, 'Silly', 'Nice')
      WHEN name LIKE '%Circus%' THEN REPLACE(name, 'Circus', 'Pull Request')
    END 'novo_nome'
FROM SpotifyClone.songs
WHERE song_id in (3, 18, 4, 15, 6)
ORDER BY nome_musica;