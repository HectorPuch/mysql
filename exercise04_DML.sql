-- Accedim a la base de dades
USE db_escola;

-- a) Inserim un professor amb el nom de Joel Miller
INSERT INTO professors (ID_P, NIF_P, Nom, Especialitat, Telefon) VALUES ('01', '12345678J', 'Joel Miller', 'Ciencies', '612345678');

SELECT * FROM professors;

-- b) Insereix 2 assignatures que imparteixi Joel Miller
INSERT INTO assignatures (Codi, NomAssignatura, ID_P) VALUES ('2024/2025F', 'Fisica', '001');
INSERT INTO assignatures (Codi, NomAssignatura, ID_P) VALUES ('2024/2025Q', 'Quimica', '001');

SELECT * FROM assignatures;

-- c) Insereix un alumne nou amb el nom d'Ellie williams
INSERT INTO alumnes (NumMatricula, NomAlumne, DataNaixement, Telefon) VALUES ('M2024/25-1', 'Ellie Williams', '1990-10-01', '612345678');

SELECT * FROM alumnes;

-- d) Insereix 2 matriculacions que ha fet l'Ellie a les 2 assignatures que imparteix Joel Miller
SET autocommit = 0;

START TRANSACTION;

INSERT INTO matriculacions (NumMatricula, Codi) VALUES ('M2024/25-1', '2024/2025F');
INSERT INTO matriculacions (NumMatricula, Codi) VALUES ('M2024/25-1', '2024/2025Q');

COMMIT;

SET autocommit = 1;

-- e) Actualitza el camp clau de l'Ellie Williams i esbrina si hi ha hagut algun canvi

UPDATE alumnes SET NumMatricula = 'M2024/25-2' WHERE NumMatricula = 'M2024/25-1';

-- f) Esborra a l'Ellie de la taula d'alumnes i verifica si ha hagut canvis

DELETE FROM alumnes WHERE NomAlumne = 'Ellie Williams';