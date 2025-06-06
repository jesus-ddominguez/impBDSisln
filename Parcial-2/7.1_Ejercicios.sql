// Ejercicio 1 – Dividir a la mitad //


CREATE TABLE jugadores (
    Id_jugador INT,
    Marcador INT
);


INSERT INTO jugadores (Id_jugador, Marcador)
VALUES 
    (1001, 2343),
    (2002, 9432),
    (3003, 6548),
    (4004, 1054),
    (5005, 6832);


SELECT 
    CASE 
        WHEN RANK() OVER (ORDER BY Marcador DESC) <= (SELECT COUNT(*) / 2 FROM jugadores) 
        THEN 1 
        ELSE 2 
    END AS Categoria,
    Id_jugador,
    Marcador
FROM jugadores
ORDER BY Categoria, Marcador DESC;
