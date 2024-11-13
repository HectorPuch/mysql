-- Creament de la base de dades
CREATE DATABASE db_empresa;

-- Utilització de la base de dades
USE db_empresa;

-- Creació de la taula clients
CREATE TABLE clients (
    dni VARCHAR(9) PRIMARY KEY,
    nom VARCHAR(50),
    direccio VARCHAR(50)
);

-- Creació de la taula pagaments_pendents
CREATE TABLE pagaments_pendents (
    codi INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    dni CHAR(9),
    import DOUBLE,
    FOREIGN KEY (dni) REFERENCES clients(dni) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Visualització de les dues taules
SHOW TABLES;

-- Visualització de la taula clients
DESCRIBE clients;

-- Visualització de la taula pagaments_pendents
DESCRIBE pagaments_pendents;

-- Inserim un client i dos pagaments pendents
INSERT INTO clients VALUES ('55667788G', 'Pikachu', 'C\ Pueblo paleta, 22');

INSERT INTO pagaments_pendents (Dni, Import) VALUES ('55667788G', 467);
INSERT INTO pagaments_pendents (Dni, Import) VALUES ('55667788G', 56.7);

-- a) Intentem esborrar el client i no es possible

DELETE FROM clients WHERE nom = 'Pikachu';

-- b) Intentem modificar el dni del client i no ho permet

UPDATE clients SET Dni = '56894619Y' WHERE Nom = 'Pikachu';

-- c) Intentem esborrar la taula clients i tampoc podem

DELETE FROM clients;