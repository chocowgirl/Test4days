/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
INSERT INTO [Tag] ([Tag_Name]) VALUES ('Cooperative');
INSERT INTO [Tag] ([Tag_Name]) VALUES ('Team');
INSERT INTO [Tag] ([Tag_Name]) VALUES ('Dice');
INSERT INTO [Tag] ([Tag_Name]) VALUES ('Cards');
INSERT INTO [Tag] ([Tag_Name]) VALUES ('Board');
INSERT INTO [Tag] ([Tag_Name]) VALUES ('Money');
INSERT INTO [User] ([User_Id],[Email], [Password], [Pseudo], [Salt]) VALUES ('916a7414-b651-4662-a047-9bd359b98a98', 'john.doe@hotmail.com', CONVERT(VARBINARY, 'Test1234='), 'PseudoJohn', CAST('e3f47b5a-2d6c-4f90-9b2e-1a8a4e6d7c3f' AS UNIQUEIDENTIFIER));
INSERT INTO [User] ([User_Id],[Email], [Password], [Pseudo], [Salt]) VALUES ('7cfc15b0-5391-44f2-9b83-c8da2ab13aa3','jane.doe@hotmail.com', CONVERT(VARBINARY, 'Test1234='), 'PseudoJane', CAST('3f5d6c8a-7e12-4b9a-bf25-9a3d2eab4f68' AS UNIQUEIDENTIFIER));
INSERT INTO [Jeu] ([Title], [Description], [Min_Age], [Max_Age], [Min_Players], [Max_Players], [Duration_Mins]) VALUES ('Solitaire', 'A game played solo against a deck of cards', 6, 120, 1, 1, 60);
INSERT INTO [Jeu] ([Title], [Description], [Min_Age], [Max_Age], [Min_Players], [Max_Players]) VALUES ('Battleship', 'The game where you try to sink the fleet of your opponent', 5, 129, 2, 2);
INSERT INTO [GameCopy] ([Jeu_Id], [UserOwner_Id], [Copy_Condition]) VALUES (1, '916a7414-b651-4662-a047-9bd359b98a98', 'incomplete');
INSERT INTO [GameCopy] ([Jeu_Id], [UserOwner_Id], [Copy_Condition]) VALUES (2, '7cfc15b0-5391-44f2-9b83-c8da2ab13aa3', 'good');

GO
