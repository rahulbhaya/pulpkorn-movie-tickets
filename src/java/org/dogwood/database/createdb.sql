DROP DATABASE IF EXISTS dogwood;

CREATE DATABASE dogwood;

USE dogwood;

CREATE TABLE User(
    Email VARCHAR(25),
    Password VARCHAR(25) NOT NULL,
    Type VARCHAR(25) DEFAULT 'NORMAL',
    PRIMARY KEY (Email),
    CHECK (Type = 'NORMAL' OR Type = 'ADMIN')
);

CREATE TABLE MovieRating(
    UserEmail VARCHAR(25),
    MovieId VARCHAR(25),
    Rating INT NOT NULL,
    PRIMARY KEY (UserEmail, MovieId),
    FOREIGN KEY (UserEmail) REFERENCES User(Email),
    CHECK (Rating >= 1 AND Rating <= 5)
);