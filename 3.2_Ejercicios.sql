// Ejercicio 2- Promedio de dias //

CREATE TABLE Iteraciones (
    Desarrollo VARCHAR(20),
    Terminacion DATE
);


INSERT INTO Iteraciones (Desarrollo, Terminacion)
VALUES
('RestAPI', '2024-06-01'),
('RestAPI', '2024-06-14'),
('RestAPI', '2024-06-15'),
('Web', '2024-06-01'),
('Web', '2024-06-02'),
('Web', '2024-06-19'),
('App', '2024-06-01'),
('App', '2024-05-15'),
('App', '2024-06-30');


WITH cte AS (
SELECT
desarrollo,
terminacion,
LAG(terminacion) OVER (PARTITION BY desarrollo ORDER BY terminacion) AS terminacion_previa
FROM Iteraciones
)
SELECT
desarrollo,
ROUND(AVG(DATEDIFF(terminacion, terminacion_previa)), 0) AS promedio
FROM cte
WHERE terminacion_previa IS NOT NULL
GROUP BY desarrollo;
