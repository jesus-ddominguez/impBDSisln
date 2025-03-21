// Ejercicio 1- carito de compras//

CREATE TABLE carrito1 ( 
  Articulo VARCHAR(50) NOT NULL 
  PRIMARY KEY 
);


INSERT INTO carrito1 (Articulo) VALUES
('Azucar'),
('Pan'),
('Jugo'),
('Refresco'),
('Harina');


CREATE TABLE carrito2 (
    Articulo VARCHAR (50) NOT NULL
    PRIMARY KEY
);


INSERT INTO carrito2 (Articulo) VALUES
('Azucar'),
('Pan'),
('Mantequilla'),
('Queso'),
('Manzana');


SELECT
c1.Articulo AS "Artículos del carrito1",
c2.Articulo AS "Artículos del carrito2"
FROM carrito1 c1
LEFT JOIN carrito2 c2 ON c1.Articulo = c2.Articulo

UNION

SELECT
c1.Articulo AS "Artículos del Carrito1",
c2.Articulo AS "Artículos del Carrito2"
FROM carrito1 c1
RIGHT JOIN carrito2 c2 ON c1.Articulo = c2.Articulo;
