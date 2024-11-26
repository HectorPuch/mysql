USE db_empresa;

-- a) Esborra totes les localitats que no tinguin empleats

DELETE FROM localitats WHERE CodiLocalitats NOT IN (SELECT CodiLocalitats FROM empleats WHERE CodiLocalitats IS NOT NULL);

SELECT * FROM localitats;

-- b) Esborra els empleats amb un sou superior a 70000€

DELETE FROM empleats WHERE Salari > 70000;

SELECT * FROM empleats;

-- c) Estableix a 50000€ el sou dels empleats que han nascut a Barcelona

UPDATE empleats SET Salari = 50000 WHERE CodiLocalitats = (SELECT CodiLocalitats FROM localitats WHERE NomLocalitats = 'Barcelona');

SELECT * FROM empleats;

-- d) Incrementa un 20% el sou dels empleats amb un sou inicial inferior a 20000€

UPDATE empleats SET Salari = Salari * 1.2 WHERE Salari < 20000;

SELECT * FROM empleats;