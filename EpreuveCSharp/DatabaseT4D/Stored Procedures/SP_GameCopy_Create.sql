CREATE PROCEDURE [dbo].[SP_GameCopy_Create]
	@jeu_id INT,
	@userOwner_id UNIQUEIDENTIFIER,
	@copy_condition VARCHAR(10)
AS
BEGIN
	INSERT INTO [GameCopy] ([Jeu_Id],[UserOwner_Id],[Copy_Condition])
		OUTPUT [inserted].[Copy_Id]
		VALUES
			(@jeu_id, @userOwner_id, @copy_condition)
END
