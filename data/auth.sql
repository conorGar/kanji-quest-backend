

--PROCEDURE= makes it so I can reuse SQL code over and over
-- NVARCHAR= used for UNICODE DATA, as oppossed to ASCII
-- Code gotten more or less from https://www.mssqltips.com/sqlservertip/4037/storing-passwords-in-a-secure-way-in-a-sql-server-database/
CREATE PROCEDURE userlogin
    @LoginName NVARCHAR(254),
    @Password VARCHAR(50),
    @responseMessage NVARCHAR(250)='' OUTPUT
AS
BEGIN

    DECLARE @userID INT

    IF EXISTS (SELECT TOP 1 id FROM users WHERE username=@LoginName)
    BEGIN
        SET @userID=(SELECT id FROM users WHERE username=@LoginName AND passwordHash=HASHBYTES('SHA2_512', @Password))

        IF(@userID IS NULL)
            SET @responseMessage='Incorrect Password'
        ELSE
            SET @responseMessage='User successfully logged in'
    END
    ELSE
           SET @responseMessage='Invalid login'
END
