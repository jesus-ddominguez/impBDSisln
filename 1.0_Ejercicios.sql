//Ejercicio 1 - Directorio Telefonico// 

CREATE TABLE `Tabla_Original` (
    `Customer ID` INT NOT NULL,
    `Type Phone` VARCHAR(20),
    `Number` VARCHAR(20)
);


INSERT INTO `Tabla_Original` (`Customer ID`, `Type Phone`, `Number`) VALUES
(1, 'Celular', '33-1045-2302'),
(1, 'Trabajo', '33-1234-5678'),
(2, 'Casa', '33-2345-6789'),
(2, 'Celular', '33-3456-7890'),
(3, 'Trabajo', '33-4567-8901');


CREATE TABLE `Tabla_Transformada` (
    `Customer ID` INT NOT NULL,
    `Celular` VARCHAR(20),
    `Trabajo` VARCHAR(20),
    `Casa` VARCHAR(20),
    PRIMARY KEY (`Customer ID`)
);


INSERT INTO `Tabla_Transformada` (`Customer ID`, `Celular`, `Trabajo`, `Casa`)
SELECT 
    `Customer ID`,
    MAX(CASE WHEN `Type Phone` = 'Celular' THEN `Number` END) AS `Celular`,
    MAX(CASE WHEN `Type Phone` = 'Trabajo' THEN `Number` END) AS `Trabajo`,
    MAX(CASE WHEN `Type Phone` = 'Casa' THEN `Number` END) AS `Casa`
FROM 
    `Tabla_Original`
GROUP BY 
    `Customer ID`;


//Ejecicio 2 -Etapas de Desarrollo//

CREATE TABLE `Desarrollos` (
    `Desarrollo` VARCHAR(20),
    `Etapa` INT,
    `Finalizado` DATE
);


INSERT INTO `Desarrollos` (`Desarrollo`, `Etapa`, `Finalizado`) VALUES
('RestAPI', 1, '2024-02-01'),
('RestAPI', 2, '2024-05-30'),
('RestAPI', 3, '2024-06-29'),
('Web', 1, '2024-10-28'),
('Web', 2, '2024-11-20'),
('Web', 3, NULL),
('App', 1, '2025-01-30'),
('App', 2, NULL);


SELECT DISTINCT `Desarrollo`
FROM `Desarrollos`
WHERE `Finalizado` IS NULL;


//Ejercicio 3 -Mision a Marte//

CREATE TABLE `Requisitos` (
    `Descripcion` VARCHAR(20) NOT NULL
);


INSERT INTO `Requisitos` (`Descripcion`) VALUES
('Geólogo'),
('Astrónomo'),
('Técnico');


CREATE TABLE `Candidatos` (
    `Id_candidato` INT NOT NULL,
    `Descripcion` VARCHAR(20) NOT NULL
);


INSERT INTO `Candidatos` (`Id_candidato`, `Descripcion`) VALUES
(1001, 'Geólogo'),
(1001, 'Astrónomo'),
(1001, 'Bioquímico'),
(1001, 'Técnico'),
(2002, 'Cirujano'),
(2002, 'Mecánico'),
(2002, 'Geólogo'),
(3003, 'Geólogo'),
(3003, 'Astrónomo'),
(4004, 'Ingeniero');


SELECT `Id_candidato`
FROM `Candidatos`
WHERE `Descripcion` IN (SELECT `Descripcion` FROM `Requisitos`)
GROUP BY `Id_candidato`
HAVING COUNT(DISTINCT `Descripcion`) = (SELECT COUNT(*) FROM `Requisitos`);
