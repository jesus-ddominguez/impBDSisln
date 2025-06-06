// Ejerccio 2 - Paginacion //


CREATE TABLE pedidos (
    Id_orden INT,
    Id_cliente INT,
    Fecha DATE,
    Cantidad INT,
    Estado VARCHAR(10)
);


INSERT INTO pedidos (Id_orden, Id_cliente, Fecha, Cantidad, Estado)
VALUES 
    (1, 1001, '2025-01-01', 100, 'JAL'),
    (2, 3003, '2025-01-01', 100, 'COL'),
    (3, 1001, '2025-01-03', 100, 'JAL'),
    (4, 2002, '2025-01-02', 150, 'JAL'),
    (5, 1001, '2025-01-02', 100, 'JAL'),
    (6, 4004, '2025-01-05', 50, 'COL'),
    (7, 1001, '2025-01-01', 150, 'JAL'),
    (8, 3003, '2025-01-03', 100, 'COL'),
    (9, 4004, '2025-01-04', 100, 'COL'),
    (10, 1001, '2025-01-01', 75, 'JAL'),
    (11, 2002, '2025-01-02', 75, 'JAL'),
    (12, 3003, '2025-02-02', 100, 'COL'),
    (13, 4004, '2025-01-05', 100, 'COL');


SELECT *
FROM pedidos
ORDER BY Id_orden
LIMIT 5 OFFSET 4;
