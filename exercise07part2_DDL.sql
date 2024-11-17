USE bestiari;

ALTER TABLE animals ADD PRIMARY KEY (nom);

CREATE TABLE encanteris (
    IdEncanteris INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    data_encanteri DATE,
    nom_mag VARCHAR(20),
    nom VARCHAR(20),
    FOREIGN KEY (nom) REFERENCES animals(nom) ON DELETE SET NULL ON UPDATE CASCADE
);