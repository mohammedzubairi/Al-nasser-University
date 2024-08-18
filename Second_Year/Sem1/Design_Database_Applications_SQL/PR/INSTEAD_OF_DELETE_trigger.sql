-- Oreder of Ececution
-- 1 (Creating database)
CREATE DATABASE Trigger_Practice_1
USE Trigger_Practice_1

-- 2 (Creating table Universities)
CREATE TABLE Universities(
	University_ID INT PRIMARY KEY,
	University_name NVARCHAR(100),
	University_address NVARCHAR(100),
	University_Regisration_Number BIGINT,
	University_Contact_Number BIGINT
)

-- 3 (Inserting Values into Universities)
INSERT INTO Universities VALUES 
		(1, 'Al-nasser', 'Yemen, Sana''a', 02137408756192387, 92384272983),
		(2, 'Sana''a University', 'Yemen, Sana''a', 022342342342392387, 23484272983),
		(3, 'Al-Yemen', 'Yemen, Sana''a', 02137408756192387, 768674272983),
		(4, 'Al-Hekmah', 'Yemen, Sana''a', 02137453456192387, 2334234272983)

-- 4 (Optinal)
SELECT * FROM Universities

-- 5 (Creating Courses)
CREATE TABLE Courses (
	Course_ID INT PRIMARY KEY,
	Course_Name NVARCHAR(50),
	Course_Instructor NVARCHAR(50),
	Course_Feild NVARCHAR(50)
)

-- 6 (Inserting Values into Courses)
INSERT INTO Courses VAlUES 
		(1, 'CSS', 'Saleh Zaid', 'Web Design'),
		(2, 'Java Script', 'Saleh Zaid', 'Web Design'),
		(3, 'HTML', 'Saleh Zaid', 'Web Design'),
		(4, 'Java', 'Mohammed Ali', 'Applications')


-- 7 (Optinal)
SELECT * FROM Universities
SELECT * FROM Courses

-- 8 (Creating view on both tables)
CREATE VIEW vw_Uni_Courses
AS
SELECT University_ID, University_name, Course_Name, Course_Feild 
FROM Universities
JOIN Courses ON University_ID = Course_ID

-- 9 (Optinal)
SELECT * FROM vw_Uni_Courses


-- 10 (Creating INSTEAD OF DELETE Trigger)
CREATE TRIGGER trg_on_view ON vw_Uni_Courses 
INSTEAD OF DELETE
AS
	BEGIN
		DELETE FROM Universities WHERE University_ID IN (SELECT University_ID FROM DELETED)
	END

-- 11 (Deleteing from a view)
DELETE FROM vw_Uni_Courses WHERE University_ID = 3

-- 12 (Seeing the result)
SELECT * FROM vw_Uni_Courses 

