CREATE DATABASE products;

\c products;

CREATE TABLE raincoats (id SERIAL PRIMARY KEY,
name VARCHAR(255), size VARCHAR(255),
color VARCHAR(255), price Money, hooded Boolean, image_url VARCHAR(255)
);

INSERT INTO raincoats (name, size, color, price, hooded, image_url)
VALUES ('North Face', 'XXL', 'Black', 200.00, true, 'https://theweinblog.files.wordpress.com/2012/06/raincoat.jpg');
