USE db_zoologics;

SHOW CREATE TABLE animals;

ALTER TABLE animals DROP CONSTRAINT animals_ibfk_1;
ALTER TABLE animals DROP CONSTRAINT animals_ibfk_2;

SHOW CREATE TABLE animals;
