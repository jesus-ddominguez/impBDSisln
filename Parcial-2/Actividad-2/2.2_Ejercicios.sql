// Ejercicio 2- Empleados y Gerentes//

CREATE TABLE Empleados (
    Id_empleado INT PRIMARY KEY,
    Id_gerente INT NULL,
    puesto VARCHAR (50) NOT NULL

);


INSERT INTO Empleados (Id_empleado, Id_gerente, Puesto) VALUES
(1001, NULL, 'Presidente'),
(2002, 1001, 'Director'),
(3003, 1001, 'Gerente'),
(4004, 2002, 'Ingeniero'),
(5005, 2002, 'Contador'),
(6006, 2002, 'Administrador');


WITH RECURSIVE Jerarquia AS (

SELECT Id_empleado, Id_gerente, Puesto, 0 AS Nivel
FROM Empleados
WHERE Id_gerente IS NULL

UNION ALL


SELECT e.Id_empleado, e.Id_gerente, e.Puesto, j.Nivel + 1
FROM Empleados e
JOIN Jerarquia j ON e.Id_gerente = j.Id_empleado
)

SELECT * FROM Jerarquia ORDER BY Nivel, Id_empleado;
