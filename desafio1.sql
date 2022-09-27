DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE SpotifyClone;

  CREATE TABLE SpotifyClone.plan(
      plan_id INT AUTO_INCREMENT PRIMARY KEY,
      plan_type VARCHAR(255) NOT NULL UNIQUE,
      plan_value DOUBLE NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.user(
      user_id INT AUTO_INCREMENT PRIMARY KEY,
      user_name VARCHAR(255) NOT NULL,
      age INT NOT NULL,
      subscrip_date DATE,
      plan_id INT NOT NULL,
      FOREIGN KEY (plan_id) REFERENCES plan (plan_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artist(
      artist_id INT AUTO_INCREMENT PRIMARY KEY,
      artist_name VARCHAR(255) NOT NULL UNIQUE
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.album(
      album_id INT AUTO_INCREMENT PRIMARY KEY,
      album_name VARCHAR(255) NOT NULL UNIQUE,
      launch_year INT NOT NULL,
      artist_id INT NOT NULL,
      FOREIGN KEY (artist_id) REFERENCES artist (artist_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.song(
      song_id INT AUTO_INCREMENT PRIMARY KEY,
      song_name VARCHAR(255) NOT NULL UNIQUE,
      length INT NOT NULL,
      album_id INT NOT NULL,
      artist_id INT NOT NULL,
      FOREIGN KEY (album_id) REFERENCES album (album_id),
      FOREIGN KEY (artist_id) REFERENCES artist (artist_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.following(
      user_id INT NOT NULL,
      artist_id INT NOT NULL,
      CONSTRAINT PRIMARY KEY (user_id, artist_id),
      FOREIGN KEY (user_id) REFERENCES user (user_id),
      FOREIGN KEY (artist_id) REFERENCES artist (artist_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.history(
      song_id INT NOT NULL,
      user_id INT NOT NULL,
      reproduc_date DATETIME NOT NULL,
      CONSTRAINT PRIMARY KEY (song_id, user_id),
      FOREIGN KEY (song_id) REFERENCES song (song_id),
      FOREIGN KEY (user_id) REFERENCES user (user_id)
  ) engine = InnoDB;


  INSERT INTO SpotifyClone.plan (plan_id, plan_type, plan_value)
  VALUES
    (1, 'gratuito', 0.00),
    (2, 'familiar', 7.99),
    (3, 'universitário', 5.99),
    (4, 'pessoal', 6.99);

  INSERT INTO SpotifyClone.user (user_id, user_name, age, subscrip_date, plan_id)
  VALUES
    (1, 'Barbara Liskov', 82, '2019-10-20', 1),
    (2, 'Robert Cecil Martin', 58, '2017-01-06', 1),
    (3, 'Ada Lovelace', 37, '2017-12-30', 2),
    (4, 'Martin Fowler', 46, '2017-01-17', 2),
    (5, 'Sandi Metz', 58, '2018-04-29', 2),
    (6, 'Paulo Freire', 19, '2018-02-14', 3),
    (7, 'Bell Hooks', 26, '2018-01-05', 3),
    (8, 'Christopher Alexander', 85, '2019-06-05', 4),
    (9, 'Judith Butler', 45, '2020-05-13', 4),
    (10, 'Jorge Amado', 58, '2017-02-17', 4);

  INSERT INTO SpotifyClone.artist (artist_id, artist_name)
  VALUES
    (1, 'Beyoncé'),
    (2, 'Queen'),
    (3, 'Elis Regina'),
    (4, 'Baco Exu do Blues'),
    (5, 'Blind Guardian'),
    (6, 'Nina Simone');

  INSERT INTO SpotifyClone.album (album_id, album_name, launch_year, artist_id)
  VALUES
    (1, 'Renaissance', 2022, 1),
    (2, 'Jazz', 1978, 2),
    (3, 'Hot Space', 1982, 2),
    (4, 'Falso Brilhante', 1998, 3),
    (5, 'Vento de Maio', 2001, 3),
    (6, 'QVVJFA?', 2003, 4),
    (7, 'Somewhere Far Beyond', 2007, 5),
    (8, 'I Put A Spell On You', 2012, 6);

  INSERT INTO SpotifyClone.song (song_id, song_name, length, album_id, artist_id)
  VALUES
    (1, 'BREAK MY SOUL', 279, 1, 1),
    (2, 'VIRGO’S GROOVE', 369, 1, 1),
    (3, 'ALIEN SUPERSTAR', 116, 1, 1),
    (4, 'Don’t Stop Me Now', 203, 2, 2),
    (5, 'Under Pressure', 152, 3, 2),
    (6, 'Como Nossos Pais', 105, 4, 3),
    (7, 'O Medo de Amar é o Medo de Ser Livre', 207, 5, 3),
    (8, 'Samba em Paris', 267, 6, 4),
    (9, 'The Bard’s Song', 244, 7, 5),
    (10, 'Feeling Good', 100, 8, 6);

  INSERT INTO SpotifyClone.following (user_id, artist_id)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);

  INSERT INTO SpotifyClone.history (song_id, user_id, reproduc_date)
  VALUES
    (8, 1, '2022-02-28 10:45:55'),
    (2, 1, '2020-05-02 05:30:35'),
    (10, 1, '2020-03-06 11:22:33'),
    (10, 2, '2022-08-05 08:05:17'),
    (7, 2, '2020-01-02 07:40:33'),
    (10, 3, '2020-11-13 16:55:13'),
    (2, 3, '2020-12-05 18:38:30'),
    (8, 4, '2021-08-15 17:10:10'),
    (8, 5, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (7, 6, '2017-01-24 00:31:17'),
    (1, 6, '2017-10-12 12:35:20'),
    (4, 7, '2011-12-15 22:30:49'),
    (4, 8, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (3, 10, '2015-12-13 08:30:22');