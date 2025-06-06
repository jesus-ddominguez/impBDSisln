// Ejercicio 2 – Promedio de ventas mensuales //


CREATE TABLE ventas (
Id_orden INT,
Id_cliente INT,
Fecha DATE,
Total DECIMAL(10, 2),
Estado VARCHAR(10)
);

INSERT INTO ventas (Id_orden, Id_cliente, Fecha, Total, Estado) VALUES
(1, 1001, '2025-01-01', 100, 'JAL'),
(2, 1001, '2025-01-01', 150, 'JAL'),
(3, 1001, '2025-01-01', 75, 'JAL'),
(4, 1001, '2025-02-01', 100, 'JAL'),
(5, 1001, '2025-03-01', 100, 'JAL'),
(6, 2002, '2025-02-01', 75, 'JAL'),
(7, 2002, '2025-02-01', 150, 'JAL'),
(8, 3003, '2025-01-01', 100, 'CDMX'),
(9, 3003, '2025-02-01', 100, 'CDMX'),
(10, 3003, '2025-03-01', 100, 'CDMX'),
(11, 4004, '2025-04-01', 100, 'CDMX'),
(12, 4004, '2025-05-01', 50, 'CDMX'),
(13, 4004, '2025-05-01', 100, 'CDMX');


SELECT Estado
FROM (
SELECT Estado, Id_cliente, DATE_FORMAT(Fecha, '%Y-%m') AS Mes, AVG(Total) AS PromedioMensual
FROM ventas
GROUP BY Estado, Id_cliente, Mes
) AS promedio_mensual
GROUP BY Estado, Id_cliente
HAVING MIN(PromedioMensual) > 100;
