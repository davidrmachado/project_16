SELECT user_name AS usuario, 
IF (MAX(YEAR(history.reproduc_date)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM SpotifyClone.user 
RIGHT JOIN SpotifyClone.history ON  history.user_id = user.user_id
GROUP BY usuario ORDER BY usuario;