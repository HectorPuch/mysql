-- Crear base de dades hyrule.
CREATE DATABASE hyrule;

USE hyrule;

-- Crear taules herois, mascares i armes al teu gust. La taula armes necessita els camps id i nom.
CREATE TABLE herois (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	nom VARCHAR(25),
	edat INT UNSIGNED
);

CREATE TABLE mascares (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	nom VARCHAR(25),
	color VARCHAR(15)
);

CREATE TABLE armes (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	nom VARCHAR(25),
	poder INT UNSIGNED,
	propietari INT UNSIGNED,
	FOREIGN KEY (propietari) REFERENCES herois(id)
);

-- Inserir algunes dades a les taules creades.
INSERT INTO herois (nom,edat) VALUES ('superman', 352), ('spiderman', 21);
INSERT INTO mascares (nom, color) VALUES ('majora', 'marró'), ('rupies', 'verd');
INSERT INTO armes (nom,poder) VALUES ('espasa mestra', 100), ('arc', 40);

-- a) Amb la taula key_column_usage de la base de dades information_schema consulta quines són les columnes que actuen com a clau primària i com a clau forana a la base de dades hyrule.
SELECT
	Table_name,
	Column_name,
	Constraint_name,
	Referenced_table_name,
	Referenced_column_name
FROM information_schema.key_column_usage WHERE TABLE_SCHEMA = 'hyrule' AND (Constraint_name = 'PRIMARY' OR Referenced_table_name IS NOT NULL);
-- Retornem tant les columnes que formen part de la PRIMARY KEY com les columnes que són FOREIGN KEY perque Referenced_table_name no és nul·la.

-- b) Crea la consulta SELECT que retorni el mateix resultat que fent un SHOW GLOBAL VARIABLES LIKE '%LOG%';.
SELECT * FROM information_schema.GLOBAL_VARIABLES WHERE Variable_name LIKE '%log%';

-- C) Crea la consulta SELECT que retorni el mateix resultat que fent un DESCRIBE 'hyrule';.
SELECT 
	Table_name, 
	Column_name,
	Data_type,
	Column_type,
	Is_nullable,
	Column_key
FROM information_schema.columns WHERE TABLE_SCHEMA = 'hyrule';
-- Això és similar a fer un DESCRIBE perque fer un DESCRIBE 'hyrule'; no es pot fer ja que és una base de dades i no una taula.
