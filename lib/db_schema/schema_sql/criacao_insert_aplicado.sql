DROP TABLE IF EXISTS authors, books, publishers, authors_books, users, likes;

CREATE TABLE authors(
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(45) NOT NULL,
born_date DATE NOT NULL,
PRIMARY KEY(id)
);

CREATE TABLE publishers(
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(45) NOT NULL,
PRIMARY KEY(id)
);


CREATE TABLE books(
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(45) NOT NULL,
published TINYINT(1) NOT NULL,
publisher_id INT NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY (publisher_id) REFERENCES publishers(id)
);


CREATE TABLE authors_books(
id INT NOT NULL AUTO_INCREMENT,
author_id INT NOT NULL,
book_id INT NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY (author_id) REFERENCES authors(id),
FOREIGN KEY (book_id) REFERENCES books(id),
CONSTRAINT UNIQUE (author_id, book_id)
);

CREATE TABLE users(
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(45),
PRIMARY KEY(id)
);

CREATE TABLE likes(
id INT NOT NULL AUTO_INCREMENT,
user_id INT,
ref_type VARCHAR(45),
ref_id INT,
PRIMARY KEY(id),
FOREIGN KEY(user_id) REFERENCES users(id),
CONSTRAINT UNIQUE (user_id, ref_type, ref_id)
);

#CREATE INDEX index_likes ON likes(ref_id);

insert into authors(name, born_date)
values ('George Martin', '2000-01-04'),
('Robin Hobb', '1998-04-03'),
('Ken Follet', '2007-12-20');


insert into publishers(name)
values ('Leitura'),
('Universal');


insert into books(name, published, publisher_id)
values ('Os cavaleiros do reinado', 1, 2),
('O caos da criação', 1, 1),
('A vergonha do guerreiro', 1, 1),
('O roberto', 0, 2);

insert into authors_books(author_id, book_id)
values (1, 2),
(2, 3),
(1, 4),
(3, 2);

insert into users(name)
values ('Kelvin'),
('Clara'),
('Guilherme'),
('Valdeci'),
('Kelen');


insert into likes(user_id, ref_type, ref_id)
values (1, 'books', 1),
(1, 'publishers', 2),
(3, 'author', 1),
(2, 'books', 3),
(4, 'users', 2),
(2, 'users', 1);