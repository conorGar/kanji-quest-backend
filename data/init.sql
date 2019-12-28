
CREATE DATABASE kanji_quest_db;

    use kanji_quest_db;

CREATE TABLE users (
    id INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(30) NOT NULL,
    passwordHash BINARY(64) NOT NULL,
    email VARCHAR(50) NOT NULL,
    points FLOAT
  );