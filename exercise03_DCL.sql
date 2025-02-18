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
	poder INT UNSIGNED
);

-- Inserir algunes dades a les taules creades.
INSERT INTO herois (nom,edat) VALUES ('superman', 352), ('spiderman', 21);
INSERT INTO mascares (nom, color) VALUES ('majora', 'marró'), ('rupies', 'verd');
INSERT INTO armes (nom,poder) VALUES ('espasa mestra', 100), ('arc', 40);

-- a) Crea dos rols, un anomenat ORNI amb tots els privilegis sobre la taula herois i mascares i un altre anomenat GERUDO amb tots els privilegis sobre la taula armes.
CREATE ROLE 'orni';

GRANT ALL PRIVILEGES ON hyrule.herois TO 'orni';
GRANT ALL PRIVILEGES ON hyrule.mascares TO 'orni';

CREATE ROLE 'gerudo';

GRANT ALL PRIVILEGES ON hyrule.armes TO 'gerudo';

-- b) Crea un usuari anomenat ganon i atorga-li el rol GERUDO per defecte.
CREATE USER 'ganon'@'192.168.1.44';

GRANT 'gerudo' TO 'ganon'@'192.168.1.44';

SET DEFAULT ROLE 'gerudo' TO 'ganon'@'192.168.1.44';

-- c) Connectat amb l'usuari ganon i prova d'executar una consulta sobre la taula herois i una altra sobre la taula armes.
sudo mysql -u ganon;

SELECT * FROM herois; -- ERROR
SELECT * FROM armes; -- OK

-- No pot consultar la taula herois perque el rol GERUDO només té permisos per a la taula armes.

-- d) A continuació, des de root, atorga el rol ORNI a ganon i repeteix la consulta sobre la taula armes amb l'usuari ganon.
sudo mysql -u root -p;

GRANT 'orni' TO 'ganon'@'192.168.1.44';

sudo mysql -u ganon;

SELECT * FROM armes; -- OK

-- No hi ha cap problema per consultar.

-- e) Seguidament, amb l'usuari ganon activa el rol ORNI per a la sessió actual (SET ROLE) i repeteix una altra vegada la consulta sobre la taula armes.
sudo mysql -u ganon;

SET ROLE 'orni';

SELECT * FROM armes; -- ERROR

-- El rol ORNI no té privilegis sobre la taula armes.

-- f) Desactiva tots els rols de l'usuari ganon.
SET ROLE NONE;

-- g) Consulta la taula herois amb l'usuari ganon.
SELECT * FROM herois; -- ERROR

-- L'usuari ganon té els rols desactivats i, per tant, no té privilegis per a realitzar la consulta sobre la taula herois.

