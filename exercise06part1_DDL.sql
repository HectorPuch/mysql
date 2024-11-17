CREATE DATABASE db_zoologics;

USE db_zoologics;

CREATE TABLE zoologics (
    IdZoologics INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Nom VARCHAR(50),
    Ciutat VARCHAR(25),
    PaisZoologics VARCHAR(43),
    Pressupost DECIMAL(12, 2),
    Grandaria FLOAT CHECK (Grandaria BETWEEN 1000 AND 1000000)
);

DESCRIBE zoologics;

CREATE TABLE animals (
    IdAnimals INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    NumIdentificacio VARCHAR(9),
    Sexe ENUM('Mascle', 'Femella'),
    AnyNaixement DATE,
    PaisOrigenAnimals VARCHAR(43),
    Continent VARCHAR(9),
    IdZoologics INT UNSIGNED,
    FOREIGN KEY (IdZoologics) REFERENCES zoologics(IdZoologics) ON DELETE SET NULL ON UPDATE CASCADE
);

DESCRIBE animals;

CREATE TABLE especies (
    IdEspecies INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    NomVulgar VARCHAR(21),
    NomCientific VARCHAR(22),
    Familia VARCHAR(14),
    EnPerillExtincio VARCHAR(40),
    IdAnimals INT UNSIGNED,
    FOREIGN KEY (IdAnimals) REFERENCES animals(IdAnimals) ON DELETE SET NULL ON UPDATE CASCADE
);

DESCRIBE especies;

