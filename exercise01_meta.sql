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

-- a) Amb les taules mysql.user i mysql.tables_priv crea una consulta per a que et retorni els privilegis dels usuaris sobre les taules de la BD hyrule que tens dins SGBD.
SELECT
	-- mysql.user
	mysql.user.user,
	mysql.user.host,
	mysql.user.plugin,
	mysql.user.password_expired,

	-- mysql.tables_priv
	mysql.tables_priv.Db,
	mysql.tables_priv.Table_name,
	mysql.tables_priv.Table_priv,
	mysql.tables.priv.Column_priv

	FROM mysql.user
	JOIN mysql.tables_priv
	ON mysql.user.user = mysql.tables_priv.User
	WHERE Db='hyrule'\G

-- b) Amb la taula tables de la base de dades information_schema consulta les taules creades al SGBD. Crea la consulta SELECT que retorni el mateix resultat que fent un SHOW TABLES FROM 'hyrule'.
SELECT TABLE AS 'Tables_in_hyrule' FROM information_schema.tables WHERE TABLE_SCHEMA = 'hyrule';

-- c) Consulta el nombre de files que té cada taula de la base de dades hyrule.
SELECT Table_name, Table_rows FROM information_schema.tables WHERE TABLE_SCHEMA = 'hyrule';

-- d) Mostra les columnes de la taula armes de la base de dades hyrule.
SELECT Column_name FROM information_schema.columns WHERE TABLE_SCHEMA = 'hyrule' AND TABLE_NAME = 'armes';
