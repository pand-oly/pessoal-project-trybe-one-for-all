CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE plans(
    plan_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    type VARCHAR(15) NOT NULL,
    value DECIMAL(5,2) NOT NULL
);

CREATE TABLE users(
    user_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    user_name VARCHAR(20) NOT NULL,
    age TINYINT,
    plan_id INT NOT NULL,
    signature_date DATE,
    FOREIGN KEY (plan_id) REFERENCES plans(plan_id)
);

CREATE TABLE artists(
    artist_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    artist_name VARCHAR(20) NOT NULL
);

CREATE TABLE user_following_artist(
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

CREATE TABLE albums(
    album_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(30) NOT NULL,
    artist_id INT,
    release_year DATE NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

CREATE TABLE songs(
    song_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(30) NOT NULL,
    album_id INT,
    duration INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albums(album_id)
);

CREATE TABLE user_reproduction_history_songs(
    user_id INT NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

