-- a) Extreure el nombre total d'alumnes (comptar-los)

SELECT COUNT(*) AS NombreTotalAlumnes FROM alumnes;

-- b) Extreure el nombre total d'alumnes matriculats en l'any acadèmic '2022'

SELECT COUNT(*) AS AlumnesMatriculats2022 FROM matriculacions WHERE any_academic = '2022';

-- c) Extreure els ID dels professors amb NIF que comença amb '4'

SELECT ID_P FROM professors WHERE NIF_P LIKE '4%';

-- d) Extreure el nom i telèfon dels professors que tenen telèfon acabat en '9'

SELECT Nom, Telefon FROM professors WHERE Telefon LIKE '%9';

-- e) Extreure el num_matricula, nom i telefon dels alumnes que han nascut entre el 1995 i el 2005

SELECT NumMatricula, NomAlumne, Telefon FROM alumnes WHERE DataNaixement BETWEEN '1995-01-01' AND '2005-12-31';

-- f) Extreure el nom i el telèfon dels professors que imparteixen alguna assignatura

SELECT professors.Nom, professors.Telefon FROM professors JOIN assignatures a ON professors.ID_P = assignatures.ID_P;

-- g) Extreure el nom i any acadèmic de les assignatures en què està matriculat algun alumne

SELECT assignatures.NomAssignatura, matriculacions.any_academic FROM assignatures JOIN matriculacions ON assignatures.Codi = matriculacions.Codi;

-- h) Extreure el nom de cada assignatura i nombre total d'alumnes que estan matriculats en cadascuna

SELECT assignatures.NomAssignatura, COUNT(matriculacions.NumMatricula) AS NombreAlumnes FROM assignatures LEFT JOIN matriculacions ON assignatures.Codi = matriculacions.Codi GROUP BY assignatures.Codi;


