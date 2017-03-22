DROP TABLE artists;
DROP TABLE albums;
DROP TABLE genres;

CREATE TABLE artists (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE albums (
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  artist_id INT2 REFERENCES artists(id),
  genre_id INT2 REFERENCES genres(id)
);

CREATE TABLE genres (
  id SERIAL8 PRIMARY KEY,
  genre VARCHAR(255)
);


INSERT INTO artists(name) VALUES ('Guns N Roses');
INSERT INTO artists(name) VALUES ('Drake');
INSERT INTO artists(name) VALUES ('Black Flag');
INSERT INTO artists(name) VALUES ('Tom Petty');
INSERT INTO artists(name) VALUES ('Die Antwoord');
INSERT INTO artists(name) VALUES ('Grimes');


INSERT INTO genres(genre) VALUES ('rock');
INSERT INTO genres(genre) VALUES ('punk');
INSERT INTO genres(genre) VALUES ('pop');


INSERT INTO albums(title, artist_id, genre_id) VALUES ('Appetite For Destruction', 1, 1 );
INSERT INTO albums(title, artist_id, genre_id) VALUES ('Chinese Democracy', 1, 1);
INSERT INTO albums(title, artist_id, genre_id) VALUES ('More Life', 2, 3);
