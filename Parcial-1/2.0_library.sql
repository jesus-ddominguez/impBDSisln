CREATE TABLE IF NOT EXISTS CATEGORIES (
    ID INT PRIMARY KEY,
    NAME VARCHAR(50) NOT NULL
);

INSERT INTO CATEGORIES (ID, NAME) VALUES
(1, 'Cat-A'),
(2, 'Cat-B'),
(3, 'Cat-C'),
(4, 'Cat-D'),
(5, 'Cat-E'),
(6, 'Cat-F'),
(7, 'Cat-G'),
(8, 'Cat-H'),
(9, 'Cat-I');

CREATE TABLE IF NOT EXISTS AUTHORS (
    ID INT PRIMARY KEY,
    NAME VARCHAR(50) NOT NULL
);

INSERT INTO AUTHORS (ID, NAME) VALUES
(1, 'Author-A'),
(2, 'Author-B'),
(3, 'Author-C'),
(4, 'Author-D'),
(5, 'Author-E'),
(6, 'Author-F'),
(7, 'Author-G'),
(8, 'Author-H'),
(9, 'Author-I');

CREATE TABLE IF NOT EXISTS BOOKS (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(50) NOT NULL,
    PRICE INT,
    CATEGORYID INT,
    AUTHORID INT,
    FOREIGN KEY (CATEGORYID) REFERENCES CATEGORIES(ID),
    FOREIGN KEY (AUTHORID) REFERENCES AUTHORS(ID)
);

INSERT INTO BOOKS (ID, NAME, PRICE, CATEGORYID, AUTHORID) VALUES
(DEFAULT, 'Book-A', 100, 1, 2),
(DEFAULT, 'Book-B', 200, 2, 2),
(DEFAULT, 'Book-C', 150, 3, 2),
(DEFAULT, 'Book-D', 100, 3, 1),
(DEFAULT, 'Book-E', 200, 3, 1),
(DEFAULT, 'Book-F', 150, 4, 1),
(DEFAULT, 'Book-G', 100, 5, 5),
(DEFAULT, 'Book-H', 200, 5, 6),
(DEFAULT, 'Book-I', 150, 7, 8);

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- INNER JOIN 
SELECT BOOKS.NAME AS BookName, CATEGORIES.NAME AS CategoryName
FROM BOOKS
INNER JOIN CATEGORIES ON BOOKS.CATEGORYID = CATEGORIES.ID;

-- INNER JOIN
SELECT BOOKS.NAME AS BookName, AUTHORS.NAME AS AuthorName
FROM BOOKS
INNER JOIN AUTHORS ON BOOKS.AUTHORID = AUTHORS.ID;

-- LEFT OUTER JOIN
SELECT BOOKS.NAME AS BookName, CATEGORIES.NAME AS CategoryName
FROM BOOKS
LEFT OUTER JOIN CATEGORIES ON BOOKS.CATEGORYID = CATEGORIES.ID;

-- LEFT OUTER JOIN 
SELECT BOOKS.NAME AS BookName, AUTHORS.NAME AS AuthorName
FROM BOOKS
LEFT OUTER JOIN AUTHORS ON BOOKS.AUTHORID = AUTHORS.ID;

-- RIGHT OUTER JOIN 
SELECT BOOKS.NAME AS BookName, CATEGORIES.NAME AS CategoryName
FROM BOOKS
RIGHT OUTER JOIN CATEGORIES ON BOOKS.CATEGORYID = CATEGORIES.ID;

-- RIGHT OUTER JOIN
SELECT BOOKS.NAME AS BookName, AUTHORS.NAME AS AuthorName
FROM BOOKS
RIGHT OUTER JOIN AUTHORS ON BOOKS.AUTHORID = AUTHORS.ID;

-- NATURAL JOIN 
SELECT BOOKS.NAME AS BookName, CATEGORIES.NAME AS CategoryName
FROM BOOKS
NATURAL JOIN CATEGORIES;

-- NATURAL JOIN 
SELECT BOOKS.NAME AS BookName, AUTHORS.NAME AS AuthorName
FROM BOOKS
NATURAL JOIN AUTHORS;

-- LEFT EXCLUDING JOIN 
SELECT BOOKS.NAME AS BookName, CATEGORIES.NAME AS CategoryName
FROM BOOKS
LEFT JOIN CATEGORIES ON BOOKS.CATEGORYID = CATEGORIES.ID
WHERE CATEGORIES.ID IS NULL;

-- LEFT EXCLUDING JOIN 
SELECT BOOKS.NAME AS BookName, AUTHORS.NAME AS AuthorName
FROM BOOKS
LEFT JOIN AUTHORS ON BOOKS.AUTHORID = AUTHORS.ID
WHERE AUTHORS.ID IS NULL;

-- RIGHT EXCLUDING JOIN 
SELECT BOOKS.NAME AS BookName, CATEGORIES.NAME AS CategoryName
FROM BOOKS
RIGHT JOIN CATEGORIES ON BOOKS.CATEGORYID = CATEGORIES.ID
WHERE BOOKS.ID IS NULL;

-- RIGHT EXCLUDING JOIN 
SELECT BOOKS.NAME AS BookName, AUTHORS.NAME AS AuthorName
FROM BOOKS
RIGHT JOIN AUTHORS ON BOOKS.AUTHORID = AUTHORS.ID
WHERE BOOKS.ID IS NULL;


