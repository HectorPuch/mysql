CREATE DATABASE IF NOT EXISTS db_bufet_advocats;

USE db_bufet_advocats;

CREATE TABLE IF NOT EXISTS clients (
    IdClients INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DNI CHAR(9) UNIQUE,
    Nom VARCHAR(20),
    AdrecaClients VARCHAR(40)
);

DESCRIBE clients;

CREATE TABLE IF NOT EXISTS assumptes (
    IdAssumptes INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Periode DATE,
    Estat ENUM('actiu', 'inactiu') DEFAULT 'actiu',
    IdClients INT UNSIGNED,
    FOREIGN KEY (IdClients) REFERENCES clients(IdClients)
);

DESCRIBE assumptes;

CREATE TABLE IF NOT EXISTS procuradors (
    IdProcuradors INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Nom VARCHAR(20),
    AdrecaProcuradors VARCHAR(40),
    DNI CHAR(9) UNIQUE
);

DESCRIBE procuradors;

CREATE TABLE IF NOT EXISTS assumptes_procuradors (
    IdAssumptes INT UNSIGNED,
    IdProcuradors INT UNSIGNED,
    FOREIGN KEY (IdAssumptes) REFERENCES assumptes(IdAssumptes) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (IdProcuradors) REFERENCES procuradors(IdProcuradors) ON DELETE SET NULL ON UPDATE CASCADE
);

DESCRIBE assumptes_procuradors;