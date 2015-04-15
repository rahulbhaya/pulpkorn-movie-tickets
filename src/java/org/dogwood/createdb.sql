DROP DATABASE IF EXISTS dogwood;

CREATE DATABASE dogwood;

USE dogwood;

CREATE TABLE User(
    Name VARCHAR(25),
    Password VARCHAR(25) NOT NULL,
    Type VARCHAR(25) DEFAULT 'NORMAL',
    PRIMARY KEY (Name),
    CHECK (Type = 'NORMAL' OR Type = 'ADMIN')
);

CREATE TABLE MovieRating(
    UserName VARCHAR(25),
    MovieId VARCHAR(25),
    Rating INT NOT NULL,
    PRIMARY KEY (UserName, MovieId),
    FOREIGN KEY (UserName) REFERENCES User(Name),
    CHECK (Rating >= 1 AND Rating <= 5)
);