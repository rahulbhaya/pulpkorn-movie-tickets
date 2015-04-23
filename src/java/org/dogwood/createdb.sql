DROP DATABASE IF EXISTS dogwood;

CREATE DATABASE dogwood;

USE dogwood;

CREATE TABLE User(
    Name VARCHAR(25),
    Password VARCHAR(25) NOT NULL,
    CardType VARCHAR(25),
    CardNumber VARCHAR(16),
    SecurityCode VARCHAR(4),
    CardName VARCHAR(25),
    Type VARCHAR(25) DEFAULT 'NORMAL',
    PRIMARY KEY (Name),
    CHECK (Type = 'NORMAL' OR Type = 'ADMIN')
);

CREATE TABLE Movie(
    Id VARCHAR(25),
    Title VARCHAR(100) NOT NULL,
    MPAARating VARCHAR(7) DEFAULT 'Unrated',
    Runtime VARCHAR(3) NOT NULL,
    ReleaseDate DATE NOT NULL,
    Synopsis TEXT NOT NULL,
    Image TEXT NOT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE MovieRating(
    UserName VARCHAR(25),
    MovieId VARCHAR(25),
    Rating INT NOT NULL,
    PRIMARY KEY (UserName, MovieId),
    FOREIGN KEY (UserName) REFERENCES User(Name),
    FOREIGN KEY (MovieId) REFERENCES Movie(Id),
    CHECK (Rating >= 1 AND Rating <= 5)
);