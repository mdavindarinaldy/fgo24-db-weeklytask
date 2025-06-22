-- Active: 1750325183929@@127.0.0.1@5432@postgres@public
CREATE TABLE movies (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    synopsis TEXT NOT NULL,
    release_date DATE NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    runtime INT NOT NULL,
    poster VARCHAR(255) NOT NULL,
    backdrop VARCHAR(255) NOT NULL,
    CONSTRAINT movies_constraint CHECK(
        LENGTH(TRIM(name))>=3
    )
);

CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE movie_genres (
    id_genres INT REFERENCES genres(id),
    id_movies INT REFERENCES movies(id),
    PRIMARY KEY (id_genres, id_movies)
);

CREATE TABLE directors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    CONSTRAINT directors_constraint CHECK(
        LENGTH(TRIM(name))>=3
    )
);

CREATE TABLE movie_directors (
    id_directors INT REFERENCES directors(id),
    id_movies INT REFERENCES movies(id),
    PRIMARY KEY(id_directors, id_movies)
);

CREATE TABLE casts (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    CONSTRAINT casts_constraint CHECK(
        LENGTH(TRIM(name))>=3
    )
);

CREATE TABLE movie_casts (
    id_casts INT REFERENCES casts(id),
    id_movies INT REFERENCES movies(id),
    PRIMARY KEY (id_casts, id_movies)
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    CONSTRAINT users_constraint CHECK(
        LENGTH(TRIM(name))>=3
        AND
        LENGTH(password) BETWEEN 8 AND 16
    )
);

CREATE TABLE session (
    id SERIAL PRIMARY KEY,
    id_users INT REFERENCES users(id),
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE payment_method (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    CONSTRAINT users_constraint CHECK(
        LENGTH(TRIM(name))>=3
    )
);

CREATE TABLE transactions (
    id SERIAL PRIMARY KEY,
    id_users INT REFERENCES users(id),
    id_movies INT REFERENCES movies(id),
    id_payment_method INT REFERENCES payment_method(id),
    total_amount DECIMAL(10,2) NOT NULL,
    location VARCHAR(255) NOT NULL,
    cinema VARCHAR(255) NOT NULL,
    showtime DATE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE transaction_detail (
    id SERIAL PRIMARY KEY,
    id_transaction INT REFERENCES transactions(id),
    seats VARCHAR(255) NOT NULL
);

