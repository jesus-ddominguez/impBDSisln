// Ejercicios 3 - Volver al Futuro// 


CREATE TABLE Periodos (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Inicio DATE NOT NULL,
    Final DATE NOT NULL
);


INSERT INTO Periodos (Inicio, Final) VALUES
('2025-01-01', '2025-01-05'),
('2025-01-03', '2025-01-09'),
('2025-01-10', '2025-01-11'),
('2025-01-12', '2025-01-16'),
('2025-01-15', '2025-01-19');


WITH CTE AS (
    SELECT Inicio, Final
    FROM Periodos
    UNION ALL
    SELECT 
        LEAST(t1.Inicio, t2.Inicio) AS Inicio,
        GREATEST(t1.Final, t2.Final) AS Final
    FROM Periodos t1
    JOIN Periodos t2 ON t1.Final >= t2.Inicio AND t1.Inicio <= t2.Final
    WHERE t1.Id < t2.Id
)
SELECT MIN(Inicio) AS Inicio, MAX(Final) AS Final
FROM CTE
GROUP BY Inicio
ORDER BY Inicio;
