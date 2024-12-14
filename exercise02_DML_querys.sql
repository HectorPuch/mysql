-- 2) Extreu l'equivalència de preu a iens japonesos dels jocs que estan entre 40 i 60 euros. Pren com a equivalènica 1€ = 165,43¥

SELECT nom, desenvolupador, preu, ROUND(preu * 165.43, 2) AS preu_iens FROM videojocs WHERE preu BETWEEN 40 AND 60;
