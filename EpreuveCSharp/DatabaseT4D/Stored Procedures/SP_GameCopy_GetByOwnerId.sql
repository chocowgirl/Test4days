CREATE PROCEDURE [dbo].[SP_GameCopy_GetByOwnerId]
	@user_id UNIQUEIDENTIFIER
AS
BEGIN
	SELECT	[Copy_id],
			[Jeu_id],
			[Copy_Condition]
		FROM [GameCopy]
		WHERE [UserOwner_Id] = @user_id
END
