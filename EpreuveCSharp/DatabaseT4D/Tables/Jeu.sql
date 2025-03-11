CREATE TABLE [dbo].[Jeu]
(
	[Jeu_Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Title] NVARCHAR(100) NOT NULL, 
    [Description] NVARCHAR(MAX) NOT NULL, 
    [Min_Age] INT NOT NULL, 
    [Max_Age] INT NOT NULL, 
    [Min_Players] INT NOT NULL, 
    [Max_Players] INT NOT NULL, 
    [Duration_Mins] INT NULL, 
    [Date_Created] DATE NOT NULL DEFAULT GETDATE(),
    CONSTRAINT [UK_Title] UNIQUE ([Title]),
    CONSTRAINT [CK_Min_Age] CHECK ([Min_Age] < [Max_Age] AND [Min_Age] > 0),
    CONSTRAINT [CK_Max_Age] CHECK ([Max_Age] > [Min_Age] AND [Max_Age] < 130),
    CONSTRAINT [CK_Min_Players] CHECK ([Min_Players] < [Max_Players] AND [Min_Players] > 0),
    CONSTRAINT [CK_Max_Players] CHECK ([Max_Players] > [Min_Players])

)
