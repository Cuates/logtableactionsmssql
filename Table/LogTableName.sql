USE [DatabaseName]
GO

-- Set ANSI NULLS and QUOTED_IDENTIFIER
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-- =========================
--        File: LogTableName
--     Created: 07/21/2020
--     Updated: 03/27/2025
--  Programmer: Cuates
--   Update By: AI Assistant
--     Purpose: Log table
-- =========================

CREATE TABLE [dbo].[LogTableName] (
    [ltnID] [bigint] IDENTITY(1,1) NOT NULL,
    [mtnID] [bigint] NOT NULL,
    [created_date] [datetime2](7) NOT NULL CONSTRAINT [DF_LogTableName_created_date] DEFAULT (GETDATE()),
    [status] [smallint] NOT NULL CONSTRAINT [DF_LogTableName_status] DEFAULT (0),
    [modified_date] [datetime2](7) NULL CONSTRAINT [DF_LogTableName_modified_date] DEFAULT (GETDATE()),
    [columnOneName] [int] NOT NULL,
    [columnTwoName] [nvarchar](255) NOT NULL,
    [userID] [int] NOT NULL CONSTRAINT [DF_LogTableName_userID] DEFAULT (1),
    [actionType] [nvarchar](255) NOT NULL,
    CONSTRAINT [PK_LogTableName] PRIMARY KEY CLUSTERED 
    (
        [ltnID] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
