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

-- a) Crea un usuari anomenat user@direccio_IP, on direcció_IP és l'identificador d'una màquina client que tinguis i ganon un usuari al que vulguis donar accés a aquella màquina, per exemple ganon@192.168.70.10
CREATE USER 'ganon'@'192.168.1.44';

-- b) Dona permisos de selecció a totes les taules de la base de dades hyrule per a l'usuari creat anteriorment.
GRANT SELECT ON hyrule.* TO ganon@192.168.1.44;

-- c) Connectat al servidor des de la màquina client i esbrina quins permisos li has concedit a l'usuari. Indica quina comanda SQL executes per conèixer els permisos que tens.
sudo mysql -u ganon;

SHOW GRANTS FOR 'ganon'@'192.168.1.44';

-- d) Revoca-li els permisos concedits a l'usuari user@direccio_IP.
REVOKE SELECT ON hyrule.* FROM 'ganon'@'192.168.1.44';

SHOW GRANTS FOR 'ganon'@'192.168.1.44';

-- e) Ara concedeix-li permisos de creació de taules a una nova base de dades que has de crear.
CREATE DATABASE lorule;

USE lorule;

GRANT CREATE ON lorule.* TO 'ganon'@'192.168.1.44';

SHOW GRANTS FOR 'ganon'@'192.168.1.44';

-- f) Connectat des del client i prova de crear una taula en aquesta base de dades que acabes de crear. Pots consultar la informació?
sudo mysql -u ganon;

SHOW DATABASES;

USE lorule;

CREATE TABLE objectes (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	nom VARCHAR(25),
	tipus VARCHAR(15)
);

SELECT * FROM objectes;

-- No podem consultar perque no tenim permisos de consulta només de creació de taules.

-- g) Esborra l'usuari user@direccio_IP.
sudo mysql -u root -p;

DROP USER 'ganon'@'192.168.1.44';

SELECT User, Host FROM mysql.user; -- User: ganon / Host: 192.168.1.44

-- h) Amb la BD mysql, consulta quins privilegis té l'usuari skillkid@localhost a nivell de servidor (taula user), a nivell de base de dades (taula db), a nivell de taules (taula tables_priv) i a nivell de columnes (taula columns_priv).
SELECT * FROM mysql.user WHERE User = 'skullkid' AND Host = 'localhost'; -- A nivell de servidor

SELECT * FROM mysql.db WHERE User = 'skullkid' AND Host = 'localhost'; -- A nivell de base de dades

SELECT * FROM mysql.tables_priv WHERE User = 'skullkid' AND Host = 'localhost'; -- A nivell de taules

SELECT * FROM mysql.columns_priv WHERE User = 'skullkid' AND Host = 'localhost'; -- A nivell de columnes

