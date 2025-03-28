// Ejercicio 3-Mean,Median,Mode y Range// 


CREATE TABLE numeros (
entero INT
);

INSERT INTO numeros (entero) VALUES
(5), (6), (10), (10), (13), (14), (17), (20), (81), (90), (76);



SELECT 
    (SELECT AVG(entero) FROM numeros) AS media,
    (SELECT entero 
     FROM numeros 
     GROUP BY entero 
     ORDER BY COUNT(entero) DESC, entero ASC 
     LIMIT 1) AS moda,
    (SELECT MAX(entero) - MIN(entero) FROM numeros) AS rango;
