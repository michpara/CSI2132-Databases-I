SET search_path = "laboratories";

--Alter

ALTER TABLE Artist
 ADD COLUMN Country VARCHAR(20);

ALTER TABLE Customer
 ADD COLUMN Rating INT
     CHECK(Rating <= 10 AND Rating >= 1);

--Insert

INSERT INTO Artist(AName, Birthplace, Style, DateOfBirth, Country) 
     VALUES ('Leonardo', 'Florence', 'Renaissance', '04-15-1452', 'Italy'), ('Michelangelo', 'Arezzo', 'Renaissance', '03-06-1475', 
'Italy'), ('Josefa', 'Seville', 'Baroque', '09-09-1630', 'Spain'), ('Hans Hofmann', 'Weisenburg', 'Modern', '02-17-1966', 'Germany'), ('John', 'San Francisco', 'Modern', '02-17-1920', 'USA');

INSERT INTO Artwork(Title, Year, Type, Price, AName) 
     VALUES ('Waves', 2000, null, 4000.00, 'John'), ('Three Musicians', 1921, 'Modern', 11000.00, 'Picasso');

INSERT INTO Customer(CustId, Name, Address, Amount, Rating) 
     VALUES (1, 'Emre', 'Preston', 20000.00, 5), (2, 'Saeid', null, 40000.00, 6);

INSERT INTO LikeArtist(CustId, AName) 
     VALUES (1, 'Picasso'), (2, 'Picasso'), (2, 'Leonardo');

--Select

SELECT * 
  FROM Artist;

SELECT AName, Birthplace 
  FROM Artist;

SELECT Title, Price 
  FROM Artwork 
 WHERE Year > 1600;

SELECT Title, Type 
  FROM Artwork 
 WHERE Year = 2000 
    OR AName = 'Picasso';

SELECT Artist.AName, Birthplace 
  FROM Artist 
 WHERE EXTRACT(YEAR FROM DateOfBirth) >= 1880 
   AND EXTRACT(YEAR FROM DateOfBirth) <= 1930;

SELECT AName, Country 
  FROM Artist 
 WHERE Style IN ('Modern', 'Baroque', 'Renaissance');

  SELECT * 
    FROM Artwork
GROUP BY Title;

SELECT Name, Customer.CustId 
  FROM Customer 
  JOIN LikeArtist 
    ON Customer.CustId = LikeArtist.CustId
 WHERE AName = 'Picasso';

SELECT Name FROM Customer 
  JOIN LikeArtist 
    ON Customer.CustId = LikeArtist.CustId 
  JOIN Artist 
    ON LikeArtist.AName = Artist.AName 
 WHERE Artist.Style = 'Renaissance'
   AND Amount > 30000;