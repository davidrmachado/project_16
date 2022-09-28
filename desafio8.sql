SELECT 
artistas.artist_name AS artista,
albuns.album_name AS album
FROM SpotifyClone.artist AS artistas
INNER JOIN SpotifyClone.album AS albuns ON artistas.artist_id = albuns.artist_id
WHERE artistas.artist_name = 'Elis Regina'
ORDER BY album ASC;
