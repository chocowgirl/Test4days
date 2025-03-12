CREATE PROCEDURE [dbo].[SP_Jeu_GetById]
	@jeu_id INT
AS
BEGIN
	SELECT	[Jeu_Id],
			[Title], 
			[Description],
			[Min_Age],
			[Max_Age],
			[Min_Players],
			[Max_Players],
			[Duration_Mins]
		FROM [Jeu]
	WHERE [Jeu_Id] = @jeu_id
END
