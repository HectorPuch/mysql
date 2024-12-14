INSERT INTO zoologics (id, nom, ciutat, pais, pressupost, grandaria) VALUES (1, 'Zoo Barcelona', 'Barcelona', 'España', 5000000.00, 25.5);
INSERT INTO zoologics (id, nom, ciutat, pais, pressupost, grandaria) VALUES (2, 'Zoo Madrid', 'Madrid', 'España', 6000000.00, 30.0);
INSERT INTO zoologics (id, nom, ciutat, pais, pressupost, grandaria) VALUES (3, 'Safari Park', 'Nairobi', 'Kenia', 3000000.00, 50.0);

INSERT INTO animals (id, num_identificacio, sexe, any_naixement, pais_origen, continent) VALUES (1, 'AN123', 'M', 2015, 'España', 'Europa', 1);
INSERT INTO animals (id, num_identificacio, sexe, any_naixement, pais_origen, continent) VALUES (2, 'AN124', 'F', 2018, 'España', 'Europa', 1);
INSERT INTO animals (id, num_identificacio, sexe, any_naixement, pais_origen, continent) VALUES (3, 'AN125', 'M', 2010, 'Sudáfrica', 'África', 3);

INSERT INTO especies (id, nom_vulgar, nom_cientific, familia, en_perill_extincio) VALUES (1, 'León', 'Panthera leo', 'Felidae', 'Si');
INSERT INTO especies (id, nom_vulgar, nom_cientific, familia, en_perill_extincio) VALUES (2, 'Tigre', 'Panthera tigris', 'Felidae', 'Si');
INSERT INTO especies (id, nom_vulgar, nom_cientific, familia, en_perill_extincio) VALUES (3, 'Elefante africano', 'Loxodonta africana', 'Elephantidae', 'Si');
INSERT INTO especies (id, nom_vulgar, nom_cientific, familia, en_perill_extincio) VALUES (4, 'Cebra', 'Equus quagga', 'Equidae', 'No');

-- a) Incrementa en un 10% el pressupost del zoològic amb animals femenins del continent africà

UPDATE zoologics SET pressupost = pressupost * 1.10 WHERE id IN (SELECT DISTINCT id_zoologic FROM animals WHERE sexe = 'F' AND continent = 'África');

-- b) Esborra un dels zoològics i comprova si s'han eliminat també els animals associats

DELETE FROM zoologics WHERE id = 1;

SELECT * FROM animals WHERE id_zoologic = 1;

SELECT * FROM zoologics;

SELECT * FROM animals;

-- c) Esborra una espècie de la base de dades i comprova si els animals associats continuen presents o si s'han esborrat

DELETE FROM especies WHERE id = 1;

SELECT * FROM especies WHERE id = 1;

SELECT * FROM animals;
