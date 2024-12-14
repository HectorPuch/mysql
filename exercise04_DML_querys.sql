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
