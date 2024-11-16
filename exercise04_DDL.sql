CREATE DATABASE db_empresa;

USE db_empresa;

CREATE TABLE IF NOT EXISTS regions (
    NomRegions VARCHAR(20) PRIMARY KEY
);

DESCRIBE regions;

CREATE TABLE IF NOT EXISTS provincies (
    CodiProvincies INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    NomProvincies VARCHAR (20),
    NomRegions VARCHAR(20),
    FOREIGN KEY (NomRegions) REFERENCES regions(NomRegions) ON DELETE SET NULL ON UPDATE CASCADE
);

DESCRIBE provincies;

CREATE TABLE IF NOT EXISTS localitats (
    CodiLocalitats INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    NomLocalitats VARCHAR(20),
    CodiProvincies INT UNSIGNED,
    FOREIGN KEY (CodiProvincies) REFERENCES provincies(CodiProvincies) ON DELETE SET NULL ON UPDATE CASCADE
);

DESCRIBE localitats;

CREATE TABLE IF NOT EXISTS empleats (
    ID_E INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DNI_E VARCHAR(9) UNIQUE,
    Nom VARCHAR(20),
    Telefon CHAR(9),
    Salari DECIMAL(7, 2),
    CodiLocalitats INT UNSIGNED,
    FOREIGN KEY (CodiLocalitats) REFERENCES localitats(CodiLocalitats) ON DELETE SET NULL ON UPDATE CASCADE
);

DESCRIBE empleats;



