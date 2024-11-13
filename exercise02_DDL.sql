-- Creació database taller
CREATE DATABASE IF NOT EXISTS db_taller;

-- Utilització database taller
USE db_taller;

-- Creació taula mecanics
CREATE TABLE IF NOT EXISTS mecanics (
    dni CHAR(9) PRIMARY KEY,
    nom VARCHAR(9),
    edat TINYINT UNSIGNED
);

-- Creació taula vehicles
CREATE TABLE IF NOT EXISTS vehicles (
    matricula CHAR(7) PRIMARY KEY,
    propietari VARCHAR(20),
    marca VARCHAR(20),
    reparat_per CHAR(9),
    FOREIGN KEY (reparat_per) REFERENCES mecanics(dni) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Veure taula mecanics
DESCRIBE mecanics;

-- Veure taula vehicles
DESCRIBE vehicles;