CREATE DATABASE IF NOT EXISTS db_taller_cotxes;

USE db_taller_cotxes;

CREATE TABLE IF NOT EXISTS mecanics (
    dni CHAR(9) PRIMARY KEY,
    nom VARCHAR(15),
    edat TINYINT
);

DESCRIBE mecanics;

CREATE TABLE IF NOT EXISTS vehicles (
    matricula CHAR(7) PRIMARY KEY,
    propietari VARCHAR(15),
    marca VARCHAR (15),
    reparat_per CHAR(9),
    FOREIGN KEY (reparat_per) REFERENCES mecanics(dni) ON UPDATE SET NULL ON DELETE SET NULL
);

DESCRIBE vehicles;

-- Inserim tres mecanics
INSERT INTO mecanics VALUES ('45645645A', 'Ernest', '27');
INSERT INTO mecanics VALUES ('47147147Z', 'Carla', '28');
INSERT INTO mecanics VALUES ('46946946P', 'Maria', '18');

-- Inserim dos vehicles
INSERT INTO vehicles VALUES ('4545RER', 'Josep', 'Volkswagen', '47147147Z');
INSERT INTO vehicles VALUES ('6565DEF', 'Anna', 'Citroen', '47147147Z');

-- Comprovació del resultat de les insercions
SELECT * FROM mecanics;

SELECT * FROM vehicles;

-- Esborrem els mecanics i comprovem el resultat dels esborrats
DELETE FROM mecanics WHERE dni = '47147147Z';

SELECT FROM vehicles WHERE dni = '47147147Z';

-- Tornem a inserir els mecanics i comprovem el resultat de les actualitzacions
INSERT INTO mecanics VALUES ('47147147Z', 'Carla', '28');

UPDATE mecanics SET dni = '12312312A' WHERE dni = '47147147Z';

SELECT * FROM vehicles WHERE dni = '12312312A';


