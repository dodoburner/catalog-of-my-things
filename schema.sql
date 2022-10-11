CREATE DATABASE catalog;

CREATE TABLE item (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  genre_id INT,
  author_id INT,
  label_id INT,
  publish_date DATE,
  archived BOOLEAN,
  FOREIGN KEY (genre_id) REFERENCES genres (id),
);

CREATE TABLE genres (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
);

CREATE TABLE music (
  id  INT,
  name VARCHAR(100),
  on_spotify BOOLEAN,
  FOREIGN KEY(id) REFERENCES item(id)
);