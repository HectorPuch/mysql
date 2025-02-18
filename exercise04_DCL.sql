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

-- a) Crea tres rols, DOCTOR amb els privilegis SELECT i UPDATE sobre la taula herois, CIENTIFIC amb els privilegis INSERT sobre la taula armes, i PERIODISTA amb els privilegis SELECT sobre totes les taules.
CREATE ROLE 'doctor';

GRANT SELECT, UPDATE ON hyrule.herois TO 'doctor';

CREATE ROLE 'cientific';

GRANT INSERT ON hyrule.armes TO 'cientific';

CREATE ROLE 'periodista';

GRANT SELECT ON hyrule.* TO 'periodista';

-- b) Crea un usuari clark_kent que només es pugui connectar des de ip_client i un usuari bruce_wayne que es pugui connectar des de qualsevol lloc (%). Assigna els rols PERIODISTA a clark_kent i CIENTIFIC a bruce_wayne.
CREATE USER 'clark_kent'@'192.168.1.44';

CREATE USER 'bruce_wayne'@'%';

GRANT 'periodista' TO 'clark_kent'@'192.168.1.44';

GRANT 'cientific' TO 'bruce_wayne'@'%';

-- c) Connectat amb l'usuari clark_kent i prova de consultar les taules herois i mascares.
sudo mysql -u clark_kent;

SELECT * FROM herois; -- OK

SELECT * FROM mascares; -- OK

-- L'usuari clark_kent pot consultar les dues taules perque el rol periodista té privilegis de SELECT a totes les taules de la base de dades hyrule.

-- d) Connectat amb l'usuari bruce_wayne i prova d'afegir una arma. Comprova que deixa consultar les armes afegides.
sudo mysql -u bruce_wayne;

INSERT INTO armes (nom, poder) VALUES ('batarang', 100);

SELECT * FROM armes WHERE nom = 'batarang' AND poder = 100; -- ERROR

-- L'usuari bruce_wayne pot insertar dades a la taula armes gràcies al seu rol de cientific pero no té permisos per a consultar taules.

-- e) Assigna el rol DOCTOR a clark_kent i comprova que pot utilitzar UPDATE sobre la taula herois.
GRANT 'doctor' TO 'clark_kent'@'192.168.1.44';

sudo mysql -u clark_kent;

UPDATE herois SET nom = 'batman' WHERE edat = 352; -- OK

-- L'usuari clark_kent pot utilitzar UPDATE sobre la taula herois gràcies al rol de doctor.

-- f) Connectat amb clark_kent i activa només el rol REPORTER per a la sessió actual i comprova que ja no pot fer UPDATE sobre la taula herois.
sudo mysql -u clark_kent;

SET ROLE 'reporter';

UPDATE herois SET nom = 'flash' WHERE edat = 21; -- ERROR

-- No pot fer UPDATE ja que no té permisos al utilitzar el rol de REPORTER a la sessió actual.

-- g) Esborra els usuaris clark_kent i bruce_wayne.
DROP USER 'clark_kent'@'192.168.1.44';

DROP USER 'bruce_wayne'@'%';


