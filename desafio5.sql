SELECT music.song_name AS cancao,
COUNT(music.song_id) AS reproducoes
FROM SpotifyClone.song AS music
INNER JOIN SpotifyClone.history AS user_history ON music.song_id = user_history.song_id
GROUP BY user_history.song_id
ORDER BY reproducoes DESC, cancao
LIMIT 2;