// Ejercicios 2 - Tabla de Asientos//

CREATE TABLE asientos (
    num_asiento INT
);


INSERT INTO asientos (num_asiento) VALUES
    (7), (13), (14), (15), (27), (28), (29), (30), 
    (31), (32), (33), (34), (35), (52), (53), (54);

WITH RECURSIVE numeros AS (
    SELECT 1 AS num
    UNION ALL
    SELECT num + 1
    FROM numeros
    WHERE num + 1 <= 54
),
disponibles AS (
    SELECT num
    FROM numeros
    WHERE num NOT IN (SELECT num_asiento FROM asientos)
),
agrupados AS (
    SELECT 
        num,
        num - ROW_NUMBER() OVER (ORDER BY num) AS grupo
    FROM disponibles
)
SELECT
    MIN(num) AS espacio_inicio,
    MAX(num) AS espacio_final
FROM agrupados
GROUP BY grupo;

SELECT 
    COUNT(*) AS disponibles
FROM (
    SELECT 1 + units.i + tens.i * 10 AS num
    FROM
        (SELECT 0 i UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
         UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) units,
        (SELECT 0 i UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4) tens
    WHERE 1 + units.i + tens.i * 10 <= 54
) AS numeros
WHERE num NOT IN (SELECT num_asiento FROM asientos);


SELECT 
    CASE WHEN num % 2 = 0 THEN 'pares' ELSE 'impares' END AS tipo,
    COUNT(*) AS total
FROM (
    SELECT 1 + units.i + tens.i * 10 AS num
    FROM
        (SELECT 0 i UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
         UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) units,
        (SELECT 0 i UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4) tens
    WHERE 1 + units.i + tens.i * 10 <= 54
) AS numeros
WHERE num NOT IN (SELECT num_asiento FROM asientos)
GROUP BY tipo;
