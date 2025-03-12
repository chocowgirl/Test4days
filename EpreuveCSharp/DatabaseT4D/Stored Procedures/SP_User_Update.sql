CREATE PROCEDURE [dbo].[SP_User_Update]
	@pseudo NVARCHAR(50),
	@user_id UNIQUEIDENTIFIER
AS
BEGIN
	UPDATE [User]
		SET	[Pseudo] = @pseudo
		WHERE [User_Id] = @user_id
END
