// Ejercicio 3-Seguimiento del inventario//

CREATE TABLE Inventario (
Fecha DATE PRIMARY KEY,
Ajuste INT
);

INSERT INTO Inventario (Fecha, Ajuste) VALUES
('2025-01-03', 100),
('2025-01-04', 75),
('2025-01-05', -150),
('2025-01-06', 50),
('2025-01-07', -70);


SELECT
Fecha,
Ajuste,
SUM(Ajuste) OVER (ORDER BY Fecha) AS Inventario
FROM Inventario;
