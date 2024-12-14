-- a) Extreure el número total de regions

SELECT COUNT(*) AS TotalRegions FROM regions;

-- b) Extreure el nom de totes les localitats que comencen amb la lletra 'B'

SELECT NomLocalitats FROM localitats WHERE NomLocalitats LIKE 'B%';

-- c) Extreure el salari més alt dels empleats

SELECT MAX(Salari) AS SalariMaxim FROM empleats;

-- d) Extreure el nom i telèfon dels empleats que tenen un salari inferior a 20,000€

SELECT Nom, Telefon FROM empleats WHERE Salari < 20000;

-- e) Extreure el nom i salari dels empleats que pertanyen a una localitat específica (per exemple, "Barcelona")

SELECT empleats.Nom, empleats.Salari FROM empleats JOIN localitats ON empleats.CodiLocalitats = localitats.CodiLocalitats WHERE localitats.NomLocalitats = 'Barcelona';

-- f) Extreure la mitjana de salari dels empleats que viuen a la localitat de 'Barcelona'

SELECT AVG(empleats.Salari) AS MitjanaSalari FROM empleats JOIN localitats ON empleats.CodiLocalitats = localitats.CodiLocalitats WHERE localitats.NomLocalitats = 'Barcelona';

-- g) Extreure el nom de totes les províncies que pertanyen a la regió "Comunitat Valenciana"

SELECT provincies.NomProvincies FROM provincies JOIN regions ON provincies.NomRegions = regions.NomRegions WHERE regions.NomRegions = 'Comunitat Valenciana';

-- h) Extreure el codi i nom de les localitats on no hi ha cap empleat assignat

SELECT localitats.CodiLocalitats, localitats.NomLocalitats FROM localitats LEFT JOIN empleats ON localitats.CodiLocalitats = empleats.CodiLocalitats WHERE empleats.CodiLocalitats IS NULL;

-- i) Extreure el nom i codi de les regions que tenen més d'una província associada

SELECT regions.NomRegions, regions.NomRegions FROM regions JOIN provincies ON regions.NomRegions = provincies.NomRegions GROUP BY regions.NomRegions HAVING COUNT(provincies.CodiProvincies) > 1;
