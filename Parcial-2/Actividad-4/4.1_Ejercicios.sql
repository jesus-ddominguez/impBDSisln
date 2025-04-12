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



