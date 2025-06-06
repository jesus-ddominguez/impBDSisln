// ejercicio 1-permutaciones //

CREATE TABLE casos_de_prueba (
id INT AUTO_INCREMENT PRIMARY KEY,
caso VARCHAR(10) NOT NULL
);


INSERT INTO casos_de_prueba (caso)
VALUES ('A'), ('B'), ('C');


WITH RECURSIVE Permutaciones (perm, restantes) AS (
SELECT
caso AS perm,
REPLACE(
(SELECT GROUP_CONCAT(caso ORDER BY caso SEPARATOR ',')
FROM casos_de_prueba),
caso,
''
) AS restantes
FROM casos_de_prueba

UNION ALL

SELECT
CONCAT_WS(',', p.perm, c.caso) AS perm,
REPLACE(p.restantes, c.caso, '') AS restantes
FROM Permutaciones p
JOIN casos_de_prueba c
ON LOCATE(c.caso, p.restantes) > 0
)
SELECT perm AS Permutacion
FROM Permutaciones
WHERE LENGTH(REPLACE(perm, ',', '')) = (
SELECT SUM(LENGTH(caso))
FROM casos_de_prueba
)
ORDER BY perm;
