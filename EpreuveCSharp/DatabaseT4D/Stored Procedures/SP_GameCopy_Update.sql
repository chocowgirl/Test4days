CREATE PROCEDURE [dbo].[SP_GameCopy_Update]
	@copy_id UNIQUEIDENTIFIER,
	@copy_condition VARCHAR(10)
AS
BEGIN
	UPDATE [GameCopy]
		SET	[Copy_Condition] = @copy_condition
		WHERE [Copy_Id] = @copy_id
END
