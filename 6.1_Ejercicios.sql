// Ejercicio 1 - Desagrupación //

CRATE TABLE Productos (
  Producto VARCHAR(50),
  Cantidad INT 
);

INSERT INTO Productos (Producto,Cantidad)
VALUES
('Lapiz',3),
('Borrador',3),
('Cuaderno',3);


WITH Numeros AS (
  SELECT 1 AS Numero UNION ALL 
SELECT 2 UNION ALL
  SELECT 3 UNION ALL
SELECT 4 UNION ALL
  SELECT 5
  )

SELECT p.Producto, 1 AS Cantidad
FROM Productos p
JOIN Numeros n ON n.Numero <= p.Cantidad;
