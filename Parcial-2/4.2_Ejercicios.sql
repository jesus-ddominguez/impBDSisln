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

