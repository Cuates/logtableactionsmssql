USE [DatabaseName];
GO

-- Set ANSI NULLS and QUOTED_IDENTIFIER
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-- ==========================
--        File: MainTableName
--     Created: 07/21/2020
--     Updated: 03/27/2025
--  Programmer: Cuates
--   Update By: AI Assistant
--     Purpose: Main table
-- ==========================

CREATE TABLE [dbo].[MainTableName] (
    [mtnID] BIGINT IDENTITY(1, 1) NOT NULL,
    [created_date] DATETIME2(7) NOT NULL DEFAULT (SYSDATETIME()),
    [status] SMALLINT NOT NULL DEFAULT (0),
    [modified_date] DATETIME2(7) NULL DEFAULT (SYSDATETIME()),
    [columnOneName] INT NOT NULL,
    [columnTwoName] NVARCHAR(255) NOT NULL,
    [userID] INT NOT NULL DEFAULT (1),
    CONSTRAINT [PK_MainTableName] PRIMARY KEY CLUSTERED (
        [mtnID] ASC
    ) WITH (
        PAD_INDEX = OFF, 
        STATISTICS_NORECOMPUTE = OFF, 
        IGNORE_DUP_KEY = OFF, 
        ALLOW_ROW_LOCKS = ON, 
        ALLOW_PAGE_LOCKS = ON, 
        FILLFACTOR = 90
    ) ON [PRIMARY]
) ON [PRIMARY];
GO
