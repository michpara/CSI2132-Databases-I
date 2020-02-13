SET search_path = "laboratories";

--Exercise 1
SELECT DISTINCT c.name, c.custid
  FROM Customer AS c
  JOIN LikeArtist AS l
    ON l.custid = c.custid

--Exercise 2
SELECT name
  FROM Customer AS c
  JOIN LikeArtist as l
    ON l.custid = c.custid
  JOIN Artist AS a
    ON a.aname = l.aname
 WHERE a.style = 'Cubism'
   AND c.amount > 30000;

--Exercise 3
SELECT c.name FROM Customer c, LikeArtist l, Artist a
 WHERE c.custid = l.custid
   AND l.aname = a.aname
   AND a.birthplace = 'Malaga'
   AND c.custid IN (SELECT c2.custid
  FROM Customer c2, LikeArtist l2, Artist a2
 WHERE c2.custid = l2.custid
   AND l2.aname = a2.aname
   AND a2.birthplace = 'Florence');
 
--Exercise 4

INSERT INTO Artwork (Title, Year, Type, Price, AName)
     VALUES ('Saints', 1470, 'Renaissance', 30000.00, 'Leonardo'),
			('Hand of god', 1510, 'Renaissance', 52000.00, 'Michelangelo'),
 			('Murder', 1600, 'Baroque', 15000.00, 'Caravaggio'),
 			('Green', 1950, 'Modern', 5000.00, 'John');
  
  SELECT type, AVG(price) AS avgprice, COUNT(*) AS numsartworks 
    FROM Artwork 
   WHERE year > 1490 
GROUP BY type
  HAVING COUNT(*) > 1;


SELECT * FROM Artwork;
  SELECT type, AVG(price) AS avgprice, COUNT(*) AS numsartworks 
    FROM Artwork 
   WHERE year > 1490 
GROUP BY type
  HAVING ( SELECT COUNT (*) FROM Artwork a WHERE type=a.type ) >= 2;

--Exercise 5
INSERT INTO LikeArtist (CustId, AName)
VALUES (2,'Caravaggio'),
       (2,'Hans Hofmann'),
	   (2,'John'),
	   (2,'Josefa'),
	   (2,'Michelangelo');
 
SELECT c.name 
  FROM Customer c
  WHERE NOT EXISTS 
  (SELECT a.aname
     FROM Artist a
	WHERE NOT EXISTS
   (SELECT l.aname
	  FROM LikeArtist l
	 WHERE l.aname = a.aname
	   AND c.custid = l.custid));

--Exerise 6

DELETE FROM Artwork WHERE price = 4000;


SELECT tmp.type, tmp.avgprice
  FROM (
	 SELECT a.type, AVG(a.price) AS avgprice
	   FROM Artwork a
   GROUP BY a.type
       ) AS tmp
 WHERE tmp.avgprice = (SELECT MIN(t.avgprice)
						 FROM (
							SELECT a.type, AVG(a.price) AS avgprice
							  FROM Artwork a
						  GROUP BY a.type
						      ) AS T
					  );