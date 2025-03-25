mysql> SELECT 
    ->     `Customer ID`,
    ->     MAX(CASE WHEN `Type Phone` = 'Celular' THEN `Number` END) AS `Celular`,
    ->     MAX(CASE WHEN `Type Phone` = 'Trabajo' THEN `Number` END) AS `Trabajo`,
    ->     MAX(CASE WHEN `Type Phone` = 'Casa' THEN `Number` END) AS `Casa`
    -> FROM 
    ->     `Tabla_Original`
    -> GROUP BY 
    ->     `Customer ID`;
+-------------+--------------+--------------+--------------+
| Customer ID | Celular      | Trabajo      | Casa         |
+-------------+--------------+--------------+--------------+
|           1 | 33-1045-2302 | 33-1234-5678 | NULL         |
|           2 | 33-3456-7890 | NULL         | 33-2345-6789 |
|           3 | NULL         | 33-4567-8901 | NULL         |
+-------------+--------------+--------------+--------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM Tabla_Original;
+-------------+------------+--------------+
| Customer ID | Type Phone | Number       |
+-------------+------------+--------------+
|           1 | Celular    | 33-1045-2302 |
|           1 | Trabajo    | 33-1234-5678 |
|           2 | Casa       | 33-2345-6789 |
|           2 | Celular    | 33-3456-7890 |
|           3 | Trabajo    | 33-4567-8901 |
+-------------+------------+--------------+
5 rows in set (0.00 sec)

mysql> SELECT 
    ->     `Customer ID`,
    ->     MAX(CASE WHEN `Type Phone` = 'Celular' THEN `Number` END) AS `Celular`,
    ->     MAX(CASE WHEN `Type Phone` = 'Trabajo' THEN `Number` END) AS `Trabajo`,
    ->     MAX(CASE WHEN `Type Phone` = 'Casa' THEN `Number` END) AS `Casa`
    -> FROM 
    ->     `Tabla_Original`;
+-------------+--------------+--------------+--------------+
| Customer ID | Celular      | Trabajo      | Casa         |
+-------------+--------------+--------------+--------------+
|           1 | 33-3456-7890 | 33-4567-8901 | 33-2345-6789 |
+-------------+--------------+--------------+--------------+
1 row in set (0.00 sec)

mysql> SELECT 
    ->     `Customer ID`,
    ->     MAX(CASE WHEN `Type Phone` = 'Celular' THEN `Number` END) AS `Celular`,
    ->     MAX(CASE WHEN `Type Phone` = 'Trabajo' THEN `Number` END) AS `Trabajo`,
    ->     MAX(CASE WHEN `Type Phone` = 'Casa' THEN `Number` END) AS `Casa`
    -> FROM 
    ->     (SELECT 1 AS `Customer ID`, 'Celular' AS `Type Phone`, '33-1045-2302' AS `Number`
    ->      UNION ALL SELECT 1, 'Trabajo', '33-1234-5678'
    ->      UNION ALL SELECT 2, 'Casa', '33-2345-6789'
    ->      UNION ALL SELECT 2, 'Celular', '33-3456-7890'
    ->      UNION ALL SELECT 3, 'Trabajo', '33-4567-8901') AS `Tabla_Original`
    -> GROUP BY 
    ->     `Customer ID`;
+-------------+--------------+--------------+--------------+
| Customer ID | Celular      | Trabajo      | Casa         |
+-------------+--------------+--------------+--------------+
|           1 | 33-1045-2302 | 33-1234-5678 | NULL         |
|           2 | 33-3456-7890 | NULL         | 33-2345-6789 |
|           3 | NULL         | 33-4567-8901 | NULL         |
+-------------+--------------+--------------+--------------+
3 rows in set (0.00 sec)

mysql> SELECT 
    ->     `Customer ID`,
    ->     MAX(CASE WHEN `Type Phone` = 'Celular' THEN `Number` END) AS `Celular`,
    ->     MAX(CASE WHEN `Type Phone` = 'Trabajo' THEN `Number` END) AS `Trabajo`,
    ->     MAX(CASE WHEN `Type Phone` = 'Casa' THEN `Number` END) AS `Casa`
    -> FROM 
    ->     `Tabla_Original`
    -> GROUP BY 
    ->     `Customer ID`;
+-------------+--------------+--------------+--------------+
| Customer ID | Celular      | Trabajo      | Casa         |
+-------------+--------------+--------------+--------------+
|           1 | 33-1045-2302 | 33-1234-5678 | NULL         |
|           2 | 33-3456-7890 | NULL         | 33-2345-6789 |
|           3 | NULL         | 33-4567-8901 | NULL         |
+-------------+--------------+--------------+--------------+
3 rows in set (0.00 sec)

mysql> CREATE TABLE `Desarrollos` (
    ->     `Desarrollo` VARCHAR(20),
    ->     `Etapa` INT,
    ->     `Finalizado` DATE
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> INSERT INTO `Desarrollos` (`Desarrollo`, `Etapa`, `Finalizado`) VALUES
    -> ('RestAPI', 1, '2024-02-01'),
    -> ('RestAPI', 2, '2024-05-30'),
    -> ('RestAPI', 3, '2024-06-29'),
    -> ('Web', 1, '2024-10-28'),
    -> ('Web', 2, '2024-11-20'),
    -> ('Web', 3, NULL),
    -> ('App', 1, '2025-01-30'),
    -> ('App', 2, NULL);
Query OK, 8 rows affected (0.01 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> SELECT DISTINCT `Desarrollo`
    -> FROM `Desarrollos`
    -> WHERE `Finalizado` IS NULL;
+------------+
| Desarrollo |
+------------+
| Web        |
| App        |
+------------+
2 rows in set (0.00 sec)

mysql> CREATE TABLE `Requisitos` (
    ->     `Descripcion` VARCHAR(20) NOT NULL
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> INSERT INTO `Requisitos` (`Descripcion`) VALUES
    -> ('Geólogo'),
    -> ('Astrónomo'),
    -> ('Técnico');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0
mysql> CREATE TABLE `Candidatos` (
    ->     `Id_candidato` INT NOT NULL,
    ->     `Descripcion` VARCHAR(20) NOT NULL
    -> );
Query OK, 0 rows affected (0.02 sec)
mysql> INSERT INTO `Candidatos` (`Id_candidato`, `Descripcion`) VALUES
    -> (1001, 'Geólogo'),
    -> (1001, 'Astrónomo'),
    -> (1001, 'Bioquímico'),
    -> (1001, 'Técnico'),
    -> (2002, 'Cirujano'),
    -> (2002, 'Mecánico'),
    -> (2002, 'Geólogo'),
    -> (3003, 'Geólogo'),
    -> (3003, 'Astrónomo'),
    -> (4004, 'Ingeniero');
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0
mysql> SELECT `Id_candidato`
    -> FROM `Candidatos`
    -> WHERE `Descripcion` IN (SELECT `Descripcion` FROM `Requisitos`)
    -> GROUP BY `Id_candidato`
    -> HAVING COUNT(DISTINCT `Descripcion`) = (SELECT COUNT(*) FROM `Requisitos`);
+--------------+
| Id_candidato |
+--------------+
|         1001 |
+--------------+
1 row in set (0.00 sec)
mysql> 
