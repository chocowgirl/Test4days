CREATE PROCEDURE [dbo].[SP_Jeu_Create]
	@title NVARCHAR(100),
	@description NVARCHAR(MAX),
	@min_age INT,
	@max_age INT,
	@min_players INT,
	@max_players INT,
	@duration_mins INT NULL
AS
BEGIN
	INSERT INTO [Jeu] ([Title],[Description],[Min_Age],[Max_Age],[Min_Players],[Max_Players],[Duration_Mins])
		OUTPUT [inserted].[Jeu_Id]
		VALUES
			(@title, @description, @min_age, @max_age, @min_players, @max_players, @duration_mins);
END