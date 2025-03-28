// Ejercicio 1-Flujos de trabajo//

CREATE TABLE flujos_trabajo (
Flujo VARCHAR(50),
Caso_1 INT,
Caso_2 INT,
Caso_3 INT
);

INSERT INTO flujos_trabajo (Flujo, Caso_1, Caso_2, Caso_3) VALUES
('Alta de usuario', 0, 0, 0),
('Baja de usuario', 0, 1, 1),
('Nueva Orden', 1, 0, 0),
('Elimina Orden', 0, 0, 0);

SELECT
Flujo,
(Caso_1 + Caso_2 + Caso_3) AS Aprobado
FROM flujos_trabajo;


// Ejercicio 2-Licencias//

CREATE TABLE licencias (
id_empleado INT,
licencia VARCHAR(10)
);

INSERT INTO licencias (id_empleado, licencia) VALUES
(1001, 'Tipo A'),
(1001, 'Tipo B'),
(1001, 'Tipo C'),
(2002, 'Tipo A'),
(2002, 'Tipo B'),
(2002, 'Tipo C'),
(3003, 'Tipo A'),
(3003, 'Tipo D'),
(4004, 'Tipo A'),
(4004, 'Tipo B'),
(4004, 'Tipo D'),
(5005, 'Tipo A'),
(5005, 'Tipo B'),
(5005, 'Tipo D');


SELECT a.id_empleado AS id_empleado_1, b.id_empleado AS id_empleado_2, COUNT(*) AS coincidencias
FROM licencias a
JOIN licencias b ON a.licencia = b.licencia AND a.id_empleado != b.id_empleado
GROUP BY a.id_empleado, b.id_empleado
HAVING COUNT(*) = (SELECT COUNT(*) FROM licencias c WHERE c.id_empleado = a.id_empleado)
AND COUNT(*) = (SELECT COUNT(*) FROM licencias d WHERE d.id_empleado = b.id_empleado);


// Ejercicio 3-Mean,Median,Mode y Range// 


CREATE TABLE numeros (
entero INT
);

INSERT INTO numeros (entero) VALUES
(5), (6), (10), (10), (13), (14), (17), (20), (81), (90), (76);


SELECT
AVG(entero) AS media, 
(SELECT entero
FROM numeros
ORDER BY entero
LIMIT 1 OFFSET (SELECT FLOOR((COUNT(*) - 1) / 2) FROM numeros)) AS mediana, 
(SELECT entero
FROM numeros
GROUP BY entero
ORDER BY COUNT(*) DESC, entero ASC
LIMIT 1) AS moda,
(MAX(entero) - MIN(entero)) AS rango 
FROM numeros;
