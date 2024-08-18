-- Oreder of Ececution
-- 1 (Creating database)
CREATE DATABASE Trigger_Practice

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
	Course_ID INT FOREIGN KEY REFERENCES Universities(University_ID),
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

-- 8 (Creating Trigger Table)
CREATE TABLE DeletionLog (
	LogID INT IDENTITY(1, 1) PRIMARY KEY,
	DeleatioFromTable NVARCHAR (50),
	DeletionDate DATETIME,
	RecordID INT,
	Message NVARCHAR(200)
)

-- 9 (Creating Trigger on Courses)
CREATE TRIGGER trg_Deletion ON Courses
FOR DELETE
AS
	BEGIN
		INSERT INTO DeletionLog (DeleatioFromTable , DeletionDate , RecordID, Message)
		SELECT 'Universities', GETDATE(), Course_ID,'A record with ID' + CAST(Course_ID AS NVARCHAR(10) ) + 'In table Universities was Deleted at: ' + CONVERT(NVARCHAR(50), GETDATE(), 120) 
		FROM DELETED
	END


-- 10 (Deleteing form Courses to test the trigger)
DELETE FROM Courses WHERE Course_ID = 4

-- 11 (Seeing the log from Trigger Table)
SELECT * FROM DeletionLog 
