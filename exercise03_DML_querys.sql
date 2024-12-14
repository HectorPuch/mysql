-- a) Extreure el nombre total d'alumnes (comptar-los)

SELECT COUNT(*) AS NombreTotalAlumnes FROM alumnes;

-- b) Extreure el nombre total d'alumnes matriculats en l'any acadèmic '2022'

SELECT COUNT(*) AS AlumnesMatriculats2022 FROM matriculacions WHERE any_academic = '2022';

-- c) Extreure els ID dels professors amb NIF que comença amb '4'

SELECT ID_P FROM professors WHERE NIF_P LIKE '4%';

-- d) Extreure el nom i telèfon dels professors que tenen telèfon acabat en '9'

SELECT Nom, Telefon FROM professors WHERE Telefon LIKE '%9';

