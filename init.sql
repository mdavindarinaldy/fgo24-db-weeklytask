CREATE TABLE movies (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    synopsis VARCHAR(255) NOT NULL,
    release_date DATE NOT NULL,
    runtime INT NOT NULL,
    poster VARCHAR(255) NOT NULL,
    backdrop VARCHAR(255) NOT NULL
);

CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
);

CREATE TABLE movie_genres (
    id_genres INT PRIMARY KEY REFERENCES genres(id),
    id_movies INT PRIMARY KEY REFERENCES movies(id)
);

CREATE TABLE directors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
);

CREATE TABLE movie_directors (
    id_directors INT PRIMARY KEY REFERENCES directors(id),
    id_movies INT PRIMARY KEY REFERENCES movies(id)
);

CREATE TABLE casts (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE movie_casts (
    id_casts INT PRIMARY KEY REFERENCES casts(id),
    id_movies INT PRIMARY KEY REFERENCES movies(id)
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE session (
    id SERIAL PRIMARY KEY,
    id_users INT REFERENCES users(id),
    created_at TIMESTAMP
);

CREATE TABLE transactions {
    id SERIAL PRIMARY KEY,
    id_users INT REFERENCES users(id),
    id_movies INT REFERENCES movies(id),
    amount INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    location VARCHAR(255) NOT NULL,
    cinema VARCHAR(255) NOT NULL,
    time DATE,
    seats VARCHAR(255) NOT NULL,
};

