CREATE TABLE [dbo].[GameCopy]
(
	[Copy_Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, 
    [Jeu_Id] INT NOT NULL, 
    [UserOwner_Id] UNIQUEIDENTIFIER NOT NULL, 
    [Copy_Condition] VARCHAR(10) NOT NULL,
    CONSTRAINT [FK_Jeu_Id] FOREIGN KEY ([Jeu_Id]) REFERENCES [Jeu] ([Jeu_Id]),
    CONSTRAINT [FK_UserOwner_Id] FOREIGN KEY ([UserOwner_Id]) REFERENCES [User] ([User_Id]),
    CONSTRAINT [FK_Copy_Condition] FOREIGN KEY ([Copy_Condition]) REFERENCES [Condition] ([Condition_State])

)
