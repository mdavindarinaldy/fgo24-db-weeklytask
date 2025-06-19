-- Active: 1750243722212@@127.0.0.1@5432@postgres@public
INSERT INTO movies(name, synopsis, release_date, price, runtime, poster, backdrop)
VALUES
('Jumbo','Menceritakan kisah Don, seorang anak laki-laki yang bertubuh besar dan sering dipanggil "Jumbo".','2025-03-31',10000,102,'url','url-backdrop'),
('Final Destination Bloodlines','Plagued by a violent and recurring nightmare.','2025-05-16',10000,109,'url','url-backdrop'),
('Lilo & Stitch','Ohana means family. Family means nobody gets left behind or forgotten.','2025-05-22',10000,108,'url','url-backdrop');

INSERT INTO genres (name)
VALUES ('Action'),('Adventure'),('Thriller'),('Animation'),('Sci-Fi'),('Family');

INSERT INTO directors (name)
VALUES ('Ryan Adriandhy'),('Adam Stein'),('Zach Lipovsky'),('Dean Fleischer Camp');

INSERT INTO casts (name)
VALUES ('Angga Yunanda'),('Bunga Citra Lestari'),('Nazril Ilham'),('Tony Todd'),('Richard Harmon'),('Maia Kealoha'),('Chris Sanders');

INSERT INTO movie_genres(id_genres, id_movies)
VALUES 
(4,1),
(6,1),
(3,2),
(2,2),
(5,3),
(6,3);

INSERT INTO movie_casts (id_casts,id_movies)
VALUES
(1,1),
(2,1),
(3,1),
(4,2),
(5,2),
(6,3),
(7,3);

INSERT INTO movie_directors(id_directors, id_movies)
VALUES
('1','1'),
('2','2'),
('3','2'),
('4','3');

INSERT INTO payment_method(name)
VALUES ('OVO'), ('Gopay'), ('Dana'), ('QRIS');

INSERT INTO users(name,email,phone_number,password)
VALUES
('rinto','rinto@gmail.com','081','12345678'),
('rana','rana@gmail.com','083','12345678'),
('rizqo','rizqo@gmail.com','082','12345678');

INSERT INTO transactions(id_users,id_movies,id_payment_method,amount,location,cinema,time)
VALUES
(2,1,1,3,'Jakarta','XXI','2025-06-26'),
(3,1,2,1,'Jakarta','XXI','2025-06-26'),
(4,1,3,2,'Jakarta','XXI','2025-06-26');

INSERT INTO transaction_detail(id_transaction,seats)
VALUES
('12','A1'),
('12','A3'),
('12','A4'),
('13','A9'),
('14','A6'),
('14','A7');

INSERT INTO session(id_users)
VALUES (2),(3),(4);

SELECT m.name, string_agg(g.name,', ') AS genres FROM movies m 
JOIN movie_genres mg ON mg.id_movies = m.id
JOIN genres g ON g.id = mg.id_genres
GROUP BY m.name;

SELECT m.name, string_agg(d.name,', ') AS directors FROM movies m 
JOIN movie_directors md ON md.id_movies = m.id
JOIN directors d ON d.id = md.id_directors
GROUP BY m.name;

SELECT m.name, string_agg(g.name,', ') AS genres, string_agg(d.name,', ') AS directors FROM movies m 
JOIN movie_genres mg ON mg.id_movies = m.id
JOIN genres g ON g.id = mg.id_genres
JOIN movie_directors md ON md.id_movies = m.id
JOIN directors d ON d.id = md.id_directors
GROUP BY m.name;