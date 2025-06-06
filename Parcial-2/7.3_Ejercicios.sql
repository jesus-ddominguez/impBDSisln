// Ejercicio 3 -  Proveedores principales //

CREATE TABLE ordenes (
Id_orden INT,
Id_cliente INT,
Cantidad INT,
Proveedor VARCHAR(20)
);


INSERT INTO ordenes (Id_orden, Id_cliente, Cantidad, Proveedor) VALUES
(1, 1001, 12, 'IBM'),
(2, 1001, 54, 'IBM'),
(3, 1001, 32, 'Amazon'),
(4, 2002, 7, 'Amazon'),
(5, 2002, 16, 'Amazon'),
(6, 2002, 5, 'IBM');


SELECT Id_cliente, Proveedor
FROM (
SELECT
Id_cliente,
Proveedor,
SUM(Cantidad) AS Total,
ROW_NUMBER() OVER (PARTITION BY Id_cliente ORDER BY SUM(Cantidad) DESC) AS rnk
FROM ordenes
GROUP BY Id_cliente, Proveedor
) AS sub
WHERE rnk = 1;
