SET search_path = "laboratories";

--Create
CREATE TABLE Artist ( AName VARCHAR(20), Birthplace VARCHAR(20), Style VARCHAR(20), DateOfBirth DATE, PRIMARY KEY (AName) );

CREATE TABLE Artwork(Title VARCHAR(20),Year INTEGER,Type VARCHAR(20),Price NUMERIC(8,2),AName VARCHAR(20),PRIMARY KEY (Title),FOREIGN KEY(AName)REFERENCES Artist);

CREATE TABLE Customer(CustId INTEGER,Name VARCHAR(20),Address VARCHAR(20),Amount NUMERIC(8,2),PRIMARY KEY (CustId));

CREATE TABLE LikeArtist(CustId INTEGER,AName VARCHAR(20),PRIMARY KEY(Aname, CustId),FOREIGN KEY (Aname)  REFERENCES Artist,FOREIGN KEY (CustId) REFERENCES Customer);

--Insert
INSERT INTO Customer(CustId, Name, Address, Amount) 
     VALUES (1, 'John', 'Ottawa', 8.5), (2, 'Amy', 'Orleans', 9.0), (3, 'Peter', 'Gatineau', 6.3);

INSERT INTO Artist(AName, Birthplace, Style, DateOfBirth) 
     VALUES ('Caravaggio','Milan','Baroque','1571-09-28' ), ('Smith', 'Ottawa', 'Modern', '1977-12-12'), ('Picasso','Malaga','Cubism','1881-10-25');

INSERT INTO Artwork(Title, Year, Type, Price, AName) 
     VALUES ('Blue', 2000, 'Modern', 10000.00, 'Smith'), ('The Cardsharps', 1594, 'Baroque', 40000.00, 'Caravaggio');

--Select
SELECT * 
  FROM Artist 
 WHERE Birthplace = 'Ottawa';

SELECT title, price 
  FROM Artwork 
 WHERE Year = 2000;

--Update
UPDATE Customer 
   SET Name = 'Bruce' 
 WHERE CustId = 1;

UPDATE Customer 
   SET Amount = 9.8, Address = 'Gatineau';

--Delete
DELETE FROM Customer 
      WHERE Name = 'Bruce';

DELETE FROM Customer;

DELETE FROM Artwork 
      WHERE AName = 'Smith';
DELETE FROM Artist 
      WHERE AName = 'Smith';
