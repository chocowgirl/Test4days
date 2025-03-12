CREATE PROCEDURE [dbo].[SP_User_Create]
	@email NVARCHAR(320),
	@password NVARCHAR(32),
	@pseudo NVARCHAR(50)
AS
BEGIN 

	DECLARE @salt UNIQUEIDENTIFIER
	SET @salt = NEWID()

    IF @pseudo IS NULL
    BEGIN
        SET @pseudo = 'User' + LEFT(NEWID(), 8)
    END

	INSERT INTO [User] ([Email],[Password],[Pseudo],[Salt])
	OUTPUT [inserted].[User_Id]
	VALUES (@email, [dbo].[SF_SaltAndHash](@password,@salt), @pseudo, @salt)
END
