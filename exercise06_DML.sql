-- a) Insereix tres clients amb 3 assumptes associats a cadascun d'ells

INSERT INTO clients (id, DNI, nom, adreca) VALUES (1, '12345678A', 'Juan Pérez', 'Calle Falsa 123, Madrid');
INSERT INTO clients (id, DNI, nom, adreca) VALUES (2, '23456789B', 'María López', 'Avenida Siempre Viva 742, Barcelona');
INSERT INTO clients (id, DNI, nom, adreca) VALUES (3, '34567890C', 'Carlos Ruiz', 'Plaza Mayor 5, Valencia');

-- b) Assigna als advocats 3 assumptes nous (de nova creació o d'altres advocats)

INSERT INTO assumptes (id, periode, estat) VALUES (1, '2023-01-15', 'En proceso');
INSERT INTO assumptes (id, periode, estat) VALUES (2, '2023-03-10', 'Finalizado');
INSERT INTO assumptes (id, periode, estat) VALUES (3, '2023-06-20', 'Pendiente');

-- Altres insert per complementar (no es demana)

INSERT INTO procuradors (id, nom, adreça, DNI) VALUES (1, 'Laura Martínez', 'Calle Luna 34, Zaragoza', '67890123F');
INSERT INTO procuradors (id, nom, adreça, DNI) VALUES (2, 'David Gómez', 'Paseo del Prado 56, Madrid', '78901234G');
INSERT INTO procuradors (id, nom, adreça, DNI) VALUES (3, 'Elena Torres', 'Rambla Cataluña 78, Barcelona', '89012345H');

INSERT INTO assumptes_procuradors (id_assumpte, id_procurador) VALUES (1, 3);
INSERT INTO assumptes_procuradors (id_assumpte, id_procurador) VALUES (2, 1);
INSERT INTO assumptes_procuradors (id_assumpte, id_procurador) VALUES (3, 4);


-- c) Esborra un client i verifica que es borra tota la informació d'un client (assumptes i advocats relacionats) quan es dona de baixa

DELETE FROM clients WHERE id = 3;

SELECT * FROM assumptes WHERE id_client = 3;

SELECT * FROM assumptes_procuradors WHERE id_assumpte NOT IN (SELECT id FROM assumptes);

SELECT * FROM procuradors;
