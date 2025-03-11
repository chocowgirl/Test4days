CREATE TABLE [dbo].[Emprunt]
(
	[Emprunt_Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Date_Lent] DATE NOT NULL, 
    [Date_Returned] DATE NULL, 
    [GameCopy_Id] UNIQUEIDENTIFIER NOT NULL, 
    [Eval_By_Lender] INT NULL, 
    [Eval_By_Borrower] INT NULL, 
    [Borrower_Id] UNIQUEIDENTIFIER NOT NULL, 
    [Lender_Id] UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [Eval_By_Lender] CHECK ([Eval_By_Lender] IS NULL OR ([Eval_By_Lender] > 0 AND [Eval_By_Lender] < 11)),
    CONSTRAINT [Eval_By_Borrower] CHECK ([Eval_By_Borrower] IS NULL OR ([Eval_By_Borrower] > 0 AND [Eval_By_Borrower] < 11)),
    CONSTRAINT [FK_GameCopy_Id] FOREIGN KEY ([GameCopy_Id]) REFERENCES [GameCopy] ([Copy_Id]),
    CONSTRAINT [FK_Borrower_Id] FOREIGN KEY ([Borrower_Id]) REFERENCES [User] ([User_Id]),
    CONSTRAINT [FK_Lender_Id] FOREIGN KEY ([Lender_Id]) REFERENCES [User] ([User_Id])
)
