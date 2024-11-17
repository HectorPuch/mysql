USE db_zoologics;

SHOW CREATE TABLE animals;

SHOW CREATE TABLE especies;

ALTER TABLE animals DROP CONSTRAINT animals_ibfk_1;

ALTER TABLE especies DROP CONSTRAINT especies_ibfk_1;

SHOW CREATE TABLE animals;

SHOW CREATE TABLE especies;
