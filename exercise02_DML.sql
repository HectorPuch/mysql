-- Creem la taula clients i pagaments_pendents
CREATE TABLE clients (
    dni CHAR(9) PRIMARY KEY,
    nom VARCHAR(50),
    direccio VARCHAR(50)
);

CREATE TABLE pagaments_pendents (
    codi INTEGER PRIMARY KEY AUTO_INCREMENT,
    dni CHAR(9),
    import DOUBLE,
    FOREIGN KEY (dni) REFERENCES clients(dni) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Inserim un client i dos pagaments pendents
INSERT INTO clients VALUES ('55667788G', 'Pikachu', 'C\ Pueblo paleta, 22');

INSERT INTO pagaments_pendents (dni, import) VALUES ('55667788G', 467);
INSERT INTO pagaments_pendents (dni, import) VALUES ('55667788G', 56.7);

-- a) Esborrem el client; verifiquem que s'han esborrat en cascada els seus pagaments pendents.
DELETE FROM clients WHERE dni = '55667788G';

SELECT * FROM pagaments_pendents WHERE dni = '55667788G';

-- b) Tornem a inserir el client i modifiquem el seu dni; verifiquem que s'ha canviat el dni de la taula pagaments_pendents.
INSERT INTO clients VALUES ('55667788G', 'Pikachu', 'C\ Pueblo paleta, 22');

UPDATE clients SET dni = '11223344F' WHERE dni = '55667788G';

SELECT * FROM pagaments_pendents WHERE dni = '11223344F'; 