// Ejercicio 3 – Ocurrencias // 

CREATE TABLE logs (
    Proceso VARCHAR(20),
    Mensaje TEXT,
    Ocurrencia INT
);

INSERT INTO logs (Proceso, Mensaje, Ocurrencia) VALUES
('Web', 'Error: No se puede dividir por 0', 3),
('RestAPI', 'Error: Fallo la conversión', 5),
('App', 'Error: Fallo la conversión', 7),
('RestAPI', 'Error: Error sin identificar', 9),
('Web', 'Error: Error sin identificar', 1),
('App', 'Error: Error sin identificar', 10),
('Web', 'Estado Completado', 8),
('RestAPI', 'Estado Completado', 6);


SELECT Proceso, Mensaje, Ocurrencia
FROM logs l
WHERE (Mensaje, Ocurrencia) IN (
SELECT Mensaje, MAX(Ocurrencia)
FROM logs
GROUP BY Mensaje
);
