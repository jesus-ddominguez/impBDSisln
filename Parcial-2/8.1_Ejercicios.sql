// Ejercicio 1 – Precios de demanda // 


CREATE TABLE precios (
    Id_producto INT,
    Fecha DATE,
    Precio DECIMAL(10, 2)
);


INSERT INTO precios (Id_producto, Fecha, Precio) VALUES
(1001, '2025-01-01', 19.99),
(1001, '2025-04-15', 59.99),
(1001, '2025-06-08', 79.99),
(2002, '2025-04-17', 39.99),
(2002, '2025-05-19', 59.99);

SELECT p.Id_producto, p.Fecha, p.Precio
FROM precios p
JOIN (
    SELECT Id_producto, MAX(Fecha) AS Fecha
    FROM precios
    GROUP BY Id_producto
) ultimos
ON p.Id_producto = ultimos.Id_producto AND p.Fecha = ultimos.Fecha;
