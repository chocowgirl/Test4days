CREATE TABLE [dbo].[GameCopy]
(
	[Copy_Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(), 
    [Jeu_Id] INT NOT NULL, 
    [UserOwner_Id] UNIQUEIDENTIFIER NOT NULL, 
    [Copy_Condition] VARCHAR(10) NOT NULL,
    CONSTRAINT [FK_Jeu_Id] FOREIGN KEY ([Jeu_Id]) REFERENCES [Jeu] ([Jeu_Id]),
    CONSTRAINT [FK_UserOwner_Id] FOREIGN KEY ([UserOwner_Id]) REFERENCES [User] ([User_Id]),
    CONSTRAINT [Copy_Condition] CHECK ([Copy_Condition] IN ('damaged', 'incomplete', 'good'))


)
