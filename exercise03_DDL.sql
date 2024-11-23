-- Creació de la base de dades
CREATE DATABASE IF NOT EXISTS db_escola;

-- Utilització de la base de dades
USE db_escola;

-- Creació de la taula alumnes
CREATE TABLE IF NOT EXISTS alumnes (
    NumMatricula VARCHAR(10) PRIMARY KEY,
    NomAlumne VARCHAR(15),
    DataNaixement DATE,
    Telefon CHAR(9)
);

-- Descripció de la taula alumnes
DESCRIBE alumnes;

-- Creació de la taula professors
CREATE TABLE IF NOT EXISTS professors (
    ID_P INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    NIF_P VARCHAR(9) UNIQUE,
    Nom VARCHAR(15), 
    Especialitat VARCHAR(10),
    Telefon CHAR(9)
);

-- Descripció de la taula professors
DESCRIBE professors;

-- Creació de la taula assignatures
CREATE TABLE IF NOT EXISTS assignatures (
    Codi VARCHAR(10) PRIMARY KEY,
    NomAssignatura VARCHAR(15),
    ID_P INT UNSIGNED,
    FOREIGN KEY (ID_P) REFERENCES professors(ID_P) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Descripció de la taula assignatures
DESCRIBE assignatures;

-- Creació de la taula matriculacions que neix de les taules alumnes i assignatures
CREATE TABLE IF NOT EXISTS matriculacions (
    IdMatriculacions INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    any_academic CHAR(9),
    NumMatricula VARCHAR(10),
    Codi VARCHAR(10),
    FOREIGN KEY (NumMatricula) REFERENCES alumnes(NumMatricula) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (Codi) REFERENCES assignatures(Codi) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Descripció de la taula matriculacions
DESCRIBE matriculacions;



