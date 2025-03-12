CREATE PROCEDURE [dbo].[SP_User_GetById]
	@user_id UNIQUEIDENTIFIER
AS
BEGIN
	SELECT	[User_Id],
			[Email], 
			[Pseudo],
			[Date_Created]
		FROM [User]
		WHERE [User_Id] = @user_id
END