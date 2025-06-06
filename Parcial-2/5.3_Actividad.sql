// Ejercicio 3-Marcadores globales // 


CREATE TABLE Marcadores ( 
    JugadorA INT, 
    JugadorB INT,
     Marcador INT );

INSERT INTO Marcadores (JugadorA, JugadorB, Marcador)
 VALUES (1001, 2002, 150), (3003, 4004, 15), (4004, 3003, 125);

SELECT 
    CASE 
  WHEN JugadorA < JugadorB THEN JugadorA 
  ELSE JugadorB 
  END AS Jugador_A,
    CASE 
  WHEN JugadorA > JugadorB THEN JugadorA 
  ELSE JugadorB 
  END AS Jugador_B, 
  SUM(Marcador) AS Marcador 
  FROM Marcadores 
  GROUP BY Jugador_A, Jugador_B;
