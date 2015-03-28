DROP DATABASE IF EXISTS dogwood;

CREATE DATABASE dogwood;

USE dogwood;

CREATE TABLE User(
    Name VARCHAR(25),
    Password VARCHAR(25) NOT NULL,
    Email VARCHAR(25) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    Type VARCHAR(25) NOT NULL,
    PRIMARY KEY (Name),
    CHECK (Type = 'REGULAR' OR Type = 'ADMIN')
);

CREATE TABLE Movie(
    Name VARCHAR(50),
    Synopsis TEXT NOT NULL,
    PRIMARY KEY (Name)
);

CREATE TABLE MovieTheater(
    Name VARCHAR(50),
    Address VARCHAR(50) NOT NULL,
    PRIMARY KEY (Name, Address)
);

CREATE TABLE MovieTime(
    MovieName VARCHAR(50),
    MovieTheaterName VARCHAR(50),
    Showing DATETIME,
    Tickets INT NOT NULL,
    PRIMARY KEY (MovieName, MovieTheaterName, Showing),
    FOREIGN KEY (MovieName) REFERENCES Movie(Name),
    FOREIGN KEY (MovieTheaterName) REFERENCES MovieTheater(Name)
);

CREATE TABLE MovieRating(
    UserName VARCHAR(25),
    MovieName VARCHAR(50),
    Rating INT NOT NULL,
    PRIMARY KEY (UserName, MovieName),
    FOREIGN KEY (UserName) REFERENCES User(Name),
    FOREIGN KEY (MovieName) REFERENCES Movie(Name),
    CHECK (Rating >= 0 AND Rating <= 5)
);

CREATE TABLE MovieReview(
    UserName VARCHAR(25),
    MovieName VARCHAR(50),
    Review TEXT NOT NULL,
    PRIMARY KEY (UserName, MovieName),
    FOREIGN KEY (UserName) REFERENCES User(Name),
    FOREIGN KEY (MovieName) REFERENCES Movie(Name)
);

CREATE TABLE CreditCardInfo(
    UserName VARCHAR(25),
    Type VARCHAR(25),
    Number VARCHAR(16),
    PRIMARY KEY (UserName, Type, Number),
    FOREIGN KEY (UserName) REFERENCES User(Name)
);