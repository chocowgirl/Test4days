CREATE PROCEDURE [dbo].[SP_User_Delete]
	@user_id UNIQUEIDENTIFIER
AS
BEGIN
	UPDATE [User]
		SET [Date_Deactivated] = GETDATE()
		WHERE [User_Id] = @user_id;
END
