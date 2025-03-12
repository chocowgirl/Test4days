CREATE PROCEDURE [dbo].[SP_Jeu_GetAll]
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
END
