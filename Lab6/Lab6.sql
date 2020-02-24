-- CREATE TABLE

CREATE TABLE sailors (
	sname VARCHAR(20) NOT NULL,
	age INTEGER NOT NULL
)

-- INSERT

INSERT INTO sailors
VALUES ('Peter', 34);

-- FUNCTION

CREATE FUNCTION check_sailor_name_age()
	RETURNS trigger AS
$BODY$
BEGIN

--Check sailor's name
IF NEW.sname IS NULL THEN
	RAISE EXCEPTION 'The sailor must have a name';
END IF;

-- CHeck sailor's age
IF NEW.age > 50 THEN
	RAISE EXCEPTION 'The sailor must be 50 or below';
END IF;

RETURN NEW;

END

$BODY$ LANGUAGE plpgsql

--TRIGGER

CREATE TRIGGER check_sailor
BEFORE UPDATE ON sailors
FOR EACH ROW
EXECUTE PROCEDURE check_sailor_name_age()

-- UPDATE

UPDATE sailors
SET age = 51
WHERE sname = 'Peter';

UPDATE sailors
SET age = 23
WHERE sname = 'Peter';