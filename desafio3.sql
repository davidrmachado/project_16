
SELECT user.user_name AS usuario, 
COUNT(SpotifyClone.history.song_id) AS qt_de_musicas_ouvidas,  
ROUND(SUM(song.length)/60, 2) AS total_minutos FROM SpotifyClone.history 
INNER JOIN SpotifyClone.user ON SpotifyClone.history.user_id = SpotifyClone.user.user_id 
INNER JOIN SpotifyClone.song ON SpotifyClone.history.song_id = SpotifyClone.song.song_id
GROUP BY usuario ORDER BY usuario;
