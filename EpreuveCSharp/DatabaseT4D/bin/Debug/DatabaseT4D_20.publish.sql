﻿/*
Deployment script for DBT4D

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "DBT4D"
:setvar DefaultFilePrefix "DBT4D"
:setvar DefaultDataPath "C:\Users\Jessica\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\Jessica\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating database $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET TEMPORAL_HISTORY_RETENTION ON 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Creating Table [dbo].[Emprunt]...';


GO
CREATE TABLE [dbo].[Emprunt] (
    [Emprunt_Id]       INT              IDENTITY (1, 1) NOT NULL,
    [Date_Lent]        DATE             NOT NULL,
    [Date_Returned]    DATE             NULL,
    [GameCopy_Id]      UNIQUEIDENTIFIER NOT NULL,
    [Eval_By_Lender]   INT              NULL,
    [Eval_By_Borrower] INT              NULL,
    [Borrower_Id]      UNIQUEIDENTIFIER NOT NULL,
    [Lender_Id]        UNIQUEIDENTIFIER NOT NULL,
    PRIMARY KEY CLUSTERED ([Emprunt_Id] ASC)
);


GO
PRINT N'Creating Table [dbo].[Game_And_Tag]...';


GO
CREATE TABLE [dbo].[Game_And_Tag] (
    [Jeu_Id]   INT          NOT NULL,
    [Tag_Name] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Game_And_Tag] PRIMARY KEY CLUSTERED ([Jeu_Id] ASC, [Tag_Name] ASC)
);


GO
PRINT N'Creating Table [dbo].[GameCopy]...';


GO
CREATE TABLE [dbo].[GameCopy] (
    [Copy_Id]        UNIQUEIDENTIFIER NOT NULL,
    [Jeu_Id]         INT              NOT NULL,
    [UserOwner_Id]   UNIQUEIDENTIFIER NOT NULL,
    [Copy_Condition] VARCHAR (10)     NOT NULL,
    PRIMARY KEY CLUSTERED ([Copy_Id] ASC)
);


GO
PRINT N'Creating Table [dbo].[Jeu]...';


GO
CREATE TABLE [dbo].[Jeu] (
    [Jeu_Id]        INT            IDENTITY (1, 1) NOT NULL,
    [Title]         NVARCHAR (100) NOT NULL,
    [Description]   NVARCHAR (MAX) NOT NULL,
    [Min_Age]       INT            NOT NULL,
    [Max_Age]       INT            NOT NULL,
    [Min_Players]   INT            NOT NULL,
    [Max_Players]   INT            NOT NULL,
    [Duration_Mins] INT            NULL,
    [Date_Created]  DATE           NOT NULL,
    PRIMARY KEY CLUSTERED ([Jeu_Id] ASC),
    CONSTRAINT [UK_Title] UNIQUE NONCLUSTERED ([Title] ASC)
);


GO
PRINT N'Creating Table [dbo].[Tag]...';


GO
CREATE TABLE [dbo].[Tag] (
    [Tag_Name] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Tag_Name] ASC)
);


GO
PRINT N'Creating Table [dbo].[User]...';


GO
CREATE TABLE [dbo].[User] (
    [User_Id]          UNIQUEIDENTIFIER NOT NULL,
    [Email]            NVARCHAR (320)   NOT NULL,
    [Password]         VARBINARY (64)   NOT NULL,
    [Pseudo]           NVARCHAR (50)    NOT NULL,
    [Date_Created]     DATE             NOT NULL,
    [Date_Deactivated] DATE             NULL,
    [Salt]             UNIQUEIDENTIFIER NOT NULL,
    PRIMARY KEY CLUSTERED ([User_Id] ASC)
);


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[GameCopy]...';


GO
ALTER TABLE [dbo].[GameCopy]
    ADD DEFAULT NEWID() FOR [Copy_Id];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Jeu]...';


GO
ALTER TABLE [dbo].[Jeu]
    ADD DEFAULT GETDATE() FOR [Date_Created];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[User]...';


GO
ALTER TABLE [dbo].[User]
    ADD DEFAULT NEWID() FOR [User_Id];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[User]...';


GO
ALTER TABLE [dbo].[User]
    ADD DEFAULT GETDATE() FOR [Date_Created];


GO
PRINT N'Creating Foreign Key [dbo].[FK_GameCopy_Id]...';


GO
ALTER TABLE [dbo].[Emprunt]
    ADD CONSTRAINT [FK_GameCopy_Id] FOREIGN KEY ([GameCopy_Id]) REFERENCES [dbo].[GameCopy] ([Copy_Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Borrower_Id]...';


GO
ALTER TABLE [dbo].[Emprunt]
    ADD CONSTRAINT [FK_Borrower_Id] FOREIGN KEY ([Borrower_Id]) REFERENCES [dbo].[User] ([User_Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Lender_Id]...';


GO
ALTER TABLE [dbo].[Emprunt]
    ADD CONSTRAINT [FK_Lender_Id] FOREIGN KEY ([Lender_Id]) REFERENCES [dbo].[User] ([User_Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Tagged_Jeu_Id]...';


GO
ALTER TABLE [dbo].[Game_And_Tag]
    ADD CONSTRAINT [FK_Tagged_Jeu_Id] FOREIGN KEY ([Jeu_Id]) REFERENCES [dbo].[Jeu] ([Jeu_Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Tagged_Jeu_Tag]...';


GO
ALTER TABLE [dbo].[Game_And_Tag]
    ADD CONSTRAINT [FK_Tagged_Jeu_Tag] FOREIGN KEY ([Tag_Name]) REFERENCES [dbo].[Tag] ([Tag_Name]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Jeu_Id]...';


GO
ALTER TABLE [dbo].[GameCopy]
    ADD CONSTRAINT [FK_Jeu_Id] FOREIGN KEY ([Jeu_Id]) REFERENCES [dbo].[Jeu] ([Jeu_Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_UserOwner_Id]...';


GO
ALTER TABLE [dbo].[GameCopy]
    ADD CONSTRAINT [FK_UserOwner_Id] FOREIGN KEY ([UserOwner_Id]) REFERENCES [dbo].[User] ([User_Id]);


GO
PRINT N'Creating Check Constraint [dbo].[Eval_By_Lender]...';


GO
ALTER TABLE [dbo].[Emprunt]
    ADD CONSTRAINT [Eval_By_Lender] CHECK ([Eval_By_Lender] IS NULL OR ([Eval_By_Lender] > 0 AND [Eval_By_Lender] < 11));


GO
PRINT N'Creating Check Constraint [dbo].[Eval_By_Borrower]...';


GO
ALTER TABLE [dbo].[Emprunt]
    ADD CONSTRAINT [Eval_By_Borrower] CHECK ([Eval_By_Borrower] IS NULL OR ([Eval_By_Borrower] > 0 AND [Eval_By_Borrower] < 11));


GO
PRINT N'Creating Check Constraint [dbo].[Copy_Condition]...';


GO
ALTER TABLE [dbo].[GameCopy]
    ADD CONSTRAINT [Copy_Condition] CHECK ([Copy_Condition] IN ('damaged', 'incomplete', 'good'));


GO
PRINT N'Creating Check Constraint [dbo].[CK_Min_Age]...';


GO
ALTER TABLE [dbo].[Jeu]
    ADD CONSTRAINT [CK_Min_Age] CHECK ([Min_Age] < [Max_Age] AND [Min_Age] > 0);


GO
PRINT N'Creating Check Constraint [dbo].[CK_Max_Age]...';


GO
ALTER TABLE [dbo].[Jeu]
    ADD CONSTRAINT [CK_Max_Age] CHECK ([Max_Age] > [Min_Age] AND [Max_Age] < 130);


GO
PRINT N'Creating Check Constraint [dbo].[CK_Min_Players]...';


GO
ALTER TABLE [dbo].[Jeu]
    ADD CONSTRAINT [CK_Min_Players] CHECK ([Min_Players] <= [Max_Players] AND [Min_Players] > 0);


GO
PRINT N'Creating Check Constraint [dbo].[CK_Max_Players]...';


GO
ALTER TABLE [dbo].[Jeu]
    ADD CONSTRAINT [CK_Max_Players] CHECK ([Max_Players] >= [Min_Players]);


GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '2824b2c4-fbc8-47f0-a250-57369de17fc9')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('2824b2c4-fbc8-47f0-a250-57369de17fc9')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '85be69b5-390b-4aaf-aa76-9ef05fd0cb25')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('85be69b5-390b-4aaf-aa76-9ef05fd0cb25')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '0958682d-3927-491d-86a5-142243963e98')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('0958682d-3927-491d-86a5-142243963e98')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '50354231-374b-4407-a9a7-6926bcc1913b')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('50354231-374b-4407-a9a7-6926bcc1913b')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '3f1490b4-af40-4102-89ab-3caa45e0db7f')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('3f1490b4-af40-4102-89ab-3caa45e0db7f')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '81ba5819-5ac8-49ee-9b93-c0981d5e5a3a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('81ba5819-5ac8-49ee-9b93-c0981d5e5a3a')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'cf2483a3-5c50-43d2-89a4-138ff8934112')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('cf2483a3-5c50-43d2-89a4-138ff8934112')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '593b3d9a-930c-463f-bd2d-687febb8c268')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('593b3d9a-930c-463f-bd2d-687febb8c268')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '7d969954-3a17-422b-9e44-76d4d96c1a6a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('7d969954-3a17-422b-9e44-76d4d96c1a6a')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'fcd312b4-2d8b-491b-b0f0-bcfa636c6d60')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('fcd312b4-2d8b-491b-b0f0-bcfa636c6d60')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '5cdc230d-39c3-4b98-9601-4349cb0bf868')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('5cdc230d-39c3-4b98-9601-4349cb0bf868')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '35328d1f-85b0-44f4-89e2-c58477da25a0')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('35328d1f-85b0-44f4-89e2-c58477da25a0')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '8ab5745a-8674-4143-97ed-027693fbfcdf')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('8ab5745a-8674-4143-97ed-027693fbfcdf')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'a82e80d7-bb98-4c8c-aebb-5ee679c23bae')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('a82e80d7-bb98-4c8c-aebb-5ee679c23bae')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '95e4a9a3-56cd-4e0b-be3a-2281a5c4fe66')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('95e4a9a3-56cd-4e0b-be3a-2281a5c4fe66')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'f8ed8c11-1ed0-4c19-9393-c0a7d06ab52e')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('f8ed8c11-1ed0-4c19-9393-c0a7d06ab52e')

GO

GO
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
INSERT INTO [User] ([Email], [Password], [Pseudo], [Salt]) VALUES ('john.doe@hotmail.com', CONVERT(VARBINARY, 'Test1234='), 'PseudoJohn', CAST('e3f47b5a-2d6c-4f90-9b2e-1a8a4e6d7c3f' AS UNIQUEIDENTIFIER));
INSERT INTO [Jeu] ([Title], [Description], [Min_Age], [Max_Age], [Min_Players], [Max_Players], [Duration_Mins]) VALUES ('Solitaire', 'A game played solo against a deck of cards', 6, 120, 1, 1, 60);
INSERT INTO [Jeu] ([Title], [Description], [Min_Age], [Max_Age], [Min_Players], [Max_Players]) VALUES ('Battleship', 'The game where you try to sink the fleet of your opponent', 5, 129, 2, 2);
GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Update complete.';


GO
