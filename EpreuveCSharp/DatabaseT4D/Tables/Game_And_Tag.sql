CREATE TABLE [dbo].[Game_And_Tag]
(
	[Jeu_Id] INT NOT NULL, 
    [Tag_Name] VARCHAR(50) NOT NULL,
	CONSTRAINT [PK_Game_And_Tag] PRIMARY KEY ([Jeu_Id], [Tag_Name]),
	CONSTRAINT [FK_Tagged_Jeu_Id] FOREIGN KEY ([Jeu_Id]) REFERENCES [Jeu] ([Jeu_Id]),
	CONSTRAINT [FK_Tagged_Jeu_Tag] FOREIGN KEY ([Tag_Name]) REFERENCES [Tag] ([Tag_Name])
)
