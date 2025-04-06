// Ejercicios 1 - Desagrupacion//

CREATE TABLE Productos (
    Producto VARCHAR(50),
    Cantidad INT
);



INSERT INTO Productos (Producto, Cantidad) VALUES
('Lápiz', 3),
('Borrador', 4),
('Cuaderno', 2);


SELECT Producto, 1 AS Cantidad
FROM Productos
JOIN (
    SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5
) AS Numeros
ON Numeros.n <= Productos.Cantidad
ORDER BY Producto;
