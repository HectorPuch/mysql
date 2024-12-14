-- 1) Crea una taula amb nom animals i els camps nom, tipus, raça, pes, color i edat

CREATE TABLE animals (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(20) UNIQUE,
    tipus VARCHAR(20),
    raça VARCHAR(20),
    pes DECIMAL(5, 2),
    color VARCHAR(15),
    edat TINYINT
);

-- 1) Inserta 6 registres

INSERT INTO animals (nom, tipus, raça, pes, color, edat) VALUES ('Rex', 'gos', 'Pastor Alemany', 25.5, 'negre i marró', 5);
INSERT INTO animals (nom, tipus, raça, pes, color, edat) VALUES ('Misha', 'gat', 'Persa', 4.2, 'blanc', 3);
INSERT INTO animals (nom, tipus, raça, pes, color, edat) VALUES ('Thor', 'gos', 'Labrador', 30.0, 'groc', 4);
INSERT INTO animals (nom, tipus, raça, pes, color, edat) VALUES ('Kiara', 'gat', 'Siamès', 3.8, 'marró clar', 2);
INSERT INTO animals (nom, tipus, raça, pes, color, edat) VALUES ('Coco', 'ocell', 'Periquito', 0.1, 'verd', 1);
INSERT INTO animals (nom, tipus, raça, pes, color, edat) VALUES ('Bunny', 'conill', 'Mini Lop', 2.5, 'gris', 3);

-- Mostra el nom i la raça de tots els animals

SELECT nom, raça FROM animals;

-- Mostra el nom i el pes dels animals posant una àlies als camps

SELECT nom AS 'Nom animals', pes AS 'Pes animals' FROM animals;

-- Mostra el nom i la data de naixement aproximada dels animals (utilitza la funció DATE_SUB() i NOW())

SELECT nom, DATE_SUB(NOW(), INTERVAL edat YEAR) AS 'Data de naixement aproximada' FROM animals;
