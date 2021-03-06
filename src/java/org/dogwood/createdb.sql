DROP DATABASE IF EXISTS dogwood;

CREATE DATABASE dogwood;

USE dogwood;

CREATE TABLE User(
    Name VARCHAR(25),
    Email VARCHAR(25) NOT NULL,
    Password VARCHAR(32) NOT NULL,
    Type VARCHAR(6) DEFAULT 'NORMAL',
    PRIMARY KEY (Name),
    UNIQUE (Email),
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
    Trailer TEXT,
    PRIMARY KEY (Id)
);

CREATE TABLE CastMember(
    Name VARCHAR(25),
    MovieId VARCHAR(25),
    PRIMARY KEY (Name, MovieId),
    FOREIGN KEY (MovieId) REFERENCES Movie(Id)
);

CREATE TABLE Comment(
    Commenter VARCHAR(25),
    MovieId VARCHAR(25),
    Message VARCHAR(140) NOT NULL,
    DateCommented DATETIME NOT NULL,
    PRIMARY KEY (Commenter, MovieId, DateCommented),
    FOREIGN KEY (Commenter) REFERENCES User(Name),
    FOREIGN KEY (MovieId) REFERENCES Movie(Id)
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

CREATE TABLE CreditCardInfo(
    Name VARCHAR(25),
    CardNumber VARCHAR(16),
    SecurityCode VARCHAR(4),
    CardName VARCHAR(25),
    BillingAddress VARCHAR(50),
    ExpDateM VARCHAR(2),
    ExpDateY VARCHAR(2), 
    City VARCHAR(25),
    State VARCHAR(2),
    Zip VARCHAR(5),
    Phone VARCHAR(12),
    PRIMARY KEY (CardNumber),
    FOREIGN KEY (Name) REFERENCES User(Name)
);

CREATE TABLE Purchase(
    UserName VARCHAR(25),
    MovieId VARCHAR(25),
    Theater VARCHAR(50),
    ShowTime VARCHAR(10),
    Adults INT NOT NULL,
    Children INT NOT NULL,
    Seniors INT NOT NULL,
    CardNumber VARCHAR(16),
    SecurityCode VARCHAR(4),
    CardName VARCHAR(25),
    BillingAddress VARCHAR(25),
    ExpDateM VARCHAR(2),
    ExpDateY VARCHAR(2),
    PurchaseId INT NOT NULL,
    PRIMARY KEY(PurchaseId)
);

CREATE TABLE CardPurchase(
    UserName VARCHAR(25),
    CardNumber VARCHAR(16),
    SecurityCode VARCHAR(4),
    CardName VARCHAR(25),
    BillingAddress VARCHAR(25),
    ExpDateM VARCHAR(2),
    ExpDateY VARCHAR(2),
    PurchaseId INT NOT NULL,
    Dollar INT NOT NULL,
    Amount INT NOT NULL,
    PRIMARY KEY(PurchaseId)
);

CREATE TABLE FAQ(
    Question VARCHAR(255),
    Answer TEXT NOT NULL,
    PRIMARY KEY (Question)
);

CREATE TABLE Help(
    Topic VARCHAR(255),
    Answer TEXT NOT NULL,
    PRIMARY KEY (Topic)
);

CREATE TABLE NewsArticle(
    Title VARCHAR(255),
    Description TEXT NOT NULL,
    Link TEXT NOT NULL,
    Image TEXT NOT NULL,
    PRIMARY KEY (Title)
);

CREATE TABLE ResetPasswordRequest(
    Email VARCHAR(25),
    Password VARCHAR(32),
    PRIMARY KEY (Email),
    FOREIGN KEY (Email) REFERENCES User(Name)
);

CREATE TABLE Subscriber(
    Email VARCHAR(25),
    PRIMARY KEY (Email)
);
