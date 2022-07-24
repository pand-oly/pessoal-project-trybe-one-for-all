DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plans(
    plan_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    type VARCHAR(15) NOT NULL,
    value DECIMAL(4,2) NOT NULL
);

CREATE TABLE SpotifyClone.users(
    user_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    user_name VARCHAR(20) NOT NULL,
    age TINYINT,
    plan_id INT NOT NULL,
    signature_date DATE,
    FOREIGN KEY (plan_id) REFERENCES SpotifyClone.plans(plan_id)
);

CREATE TABLE SpotifyClone.artists(
    artist_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    artist_name VARCHAR(20) NOT NULL
);

CREATE TABLE SpotifyClone.user_following_artist(
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(user_id),
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(artist_id)
);

CREATE TABLE SpotifyClone.albums(
    album_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    album_name VARCHAR(30) NOT NULL,
    artist_id INT,
    release_year YEAR NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(artist_id)
);

CREATE TABLE SpotifyClone.songs(
    song_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    album_id INT,
    duration INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.albums(album_id)
);

CREATE TABLE SpotifyClone.user_reproduction_history_songs(
    user_id INT NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    song_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(user_id),
    FOREIGN KEY (song_id) REFERENCES SpotifyClone.songs(song_id)
);

INSERT INTO SpotifyClone.plans (type, value)
    VALUES('gratuito', 0),
        ('universitário', 5.99),
        ('pessoal', 6.99),
        ('familiar', 7.99);

INSERT INTO SpotifyClone.users (user_name, age, plan_id, signature_date)
    VALUES('Thati', 23, 1, '2019-10-20'),
        ('Cintia', 35, 4, '2017-12-30'),
        ('Bill', 20, 2, '2019-06-05'),
        ('Roger', 45, 3, '2020-05-13'),
        ('Norman', 58, 3, '2017-02-17'),
        ('Patrick', 33, 4, '2017-01-06'),
        ('Vivian', 26, 2, '2018-01-05'),
        ('Carol', 19, 2, '2018-02-14'),
        ('Angelina', 42, 4, '2018-04-29'),
        ('Paul', 46, 4, '2017-01-17');

INSERT INTO SpotifyClone.artists (artist_name)
    VALUES('Walter Phoenix'), -- 1
        ('Peter Strong'), -- 2
        ('Lance Day'), -- 3
        ('Freedie Shannon'), -- 4
        ('Tyler Isle'), -- 5
        ('Fog'); -- 6

INSERT INTO SpotifyClone.user_following_artist (user_id, artist_id)
    VALUES(1, 1),
        (1, 4),
        (1, 3),
        (2, 1),
        (2, 3),
        (3, 2),
        (3, 1),
        (4, 4),
        (5, 5),
        (5, 6),
        (6, 6),
        (6, 3),
        (6, 1),
        (7, 2),
        (7, 5),
        (8, 1),
        (8, 5),
        (9, 6),
        (9, 4),
        (9, 3),
        (10, 2),
        (10, 6);

INSERT INTO SpotifyClone.albums (album_name, artist_id, release_year)
    VALUES('Envious', 1, 1990), -- 1
        ('Exuberant', 1, 1993), -- 2
        ('Hallowed Steam', 2, 1995), -- 3
        ('Incandescent', 3, 1998), -- 4
        ('Temporary Culture', 4, 2001), -- 5
        ('Library of liberty', 4, 2003), -- 6
        ('Chained Down', 5, 2007), -- 7
        ('Cabinet of fools', 5, 2012), -- 8
        ('No guarantees', 5, 2015), -- 9
        ('Apparatus', 6, 2015); -- 10

INSERT INTO SpotifyClone.songs (name, album_id, duration)
    VALUES("Soul For Us", 1, 200), -- 1
        ("Reflections Of Magic", 1, 163), -- 2
        ("Dance With Her Own", 1, 116), -- 3
        ("Troubles Of My Inner Fire", 2, 203), -- 4
        ("Time Fireworks", 2, 152), -- 5
        ("Magic Circus", 3, 105), -- 6
        ("Honey, So Do I", 3, 207), -- 7
        ("Sweetie, Let's Go Wild", 3, 139), -- 8
        ("She Knows", 3, 244), -- 9
        ("Fantasy For Me", 4, 100), -- 10
        ("Celebration Of More", 4, 146), -- 11
        ("Rock His Everything", 4, 223), -- 12
        ("Home Forever", 4, 231), -- 13
        ("Diamond Power", 4, 241), -- 14
        ("Let's Be Silly", 4, 132), -- 15
        ("Thang Of Thunder", 5, 240), -- 16
        ("Words Of Her Life", 5, 185), -- 17
        ("Without My Streets", 5, 176), -- 18
        ("Need Of The Evening", 6, 190), -- 19
        ("History Of My Roses", 6, 222), -- 20
        ("Without My Love", 6, 111), -- 21
        ("Walking And Game", 6, 123), -- 22
        ("Young And Father", 6, 197), -- 23
        ("Finding My Traditions", 7, 179), -- 24
        ("Walking And Man", 7, 229), -- 25
        ("Hard And Time", 7, 135), -- 26
        ("Honey, I'm A Lone Wolf", 7, 150), -- 27
        ("She Thinks I Won't Stay Tonight", 8, 166), -- 28
        ("He Heard You're Bad For Me", 8, 154), -- 29
        ("He Hopes We Can't Stay", 8, 210), -- 30
        ("I Know I Know", 8, 117), -- 31
        ("He's Walking Away", 9, 159), -- 32
        ("He's Trouble", 9, 138), -- 33
        ("I Heard I Want To Bo Alone", 9, 120), -- 34
        ("I Ride Alone", 9, 151), -- 35
        ("Honey", 10, 79), -- 36
        ("You Cheated On Me", 10, 95), -- 37
        ("Wouldn't It Be Nice", 10, 213), -- 38
        ("Baby", 10, 136), -- 39
        ("You Make Me Feel So..", 10, 83); -- 40

INSERT INTO SpotifyClone.user_reproduction_history_songs (user_id, date, song_id)
    VALUES(1, '2020-02-28 10:45:55', 36),
        (1, '2020-05-02 05:30:35', 25),
        (1, '2020-03-06 11:22:33', 23),
        (1, '2020-08-05 08:05:17', 14),
        (1, '2020-09-14 16:32:22', 15),
        (2, '2020-01-02 07:40:33', 34),
        (2, '2020-05-16 06:16:22', 24),
        (2, '2020-10-09 12:27:48', 21),
        (2, '2020-09-21 13:14:46', 39),
        (3, '2020-11-13 16:55:13', 6),
        (3, '2020-12-05 18:38:30', 3),
        (3, '2020-07-30 10:00:00', 26),
        (4, '2021-08-15 17:10:10', 2),
        (4, '2021-07-10 15:20:30', 35),
        (4, '2021-01-09 01:44:33', 27),
        (5, '2020-07-03 19:33:28', 7),
        (5, '2017-02-24 21:14:22', 12),
        (5, '2020-08-06 15:23:43', 14),
        (5, '2020-11-10 13:52:27', 1),
        (6, '2019-02-07 20:33:48', 38),
        (6, '2017-01-24 00:31:17', 29),
        (6, '2017-10-12 12:35:20', 30),
        (6, '2018-05-29 14:56:41', 22),
        (7, '2018-05-09 22:30:49', 5),
        (7, '2020-07-27 12:52:58', 4),
        (7, '2018-01-16 18:40:43', 11),
        (8, '2018-03-21 16:56:40', 39),
        (8, '2020-10-18 13:38:05', 40),
        (8, '2019-05-25 08:14:03', 32),
        (8, '2021-08-15 21:37:09', 33),
        (9, '2021-05-24 17:23:45', 16),
        (9, '2018-12-07 22:48:52', 17),
        (9, '2021-03-14 06:14:26', 8),
        (9, '2020-04-01 03:36:00', 9),
        (10, '2017-02-06 08:21:34', 20),
        (10, '2017-12-04 05:33:43', 21),
        (10, '2017-07-27 05:24:49', 12),
        (10, '2017-12-25 01:03:57', 13);