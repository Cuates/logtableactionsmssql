USE [DatabaseName]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =========================
--        File: LogTableName
--     Created: 07/21/2020
--     Updated: 07/21/2020
--  Programmer: Cuates
--   Update By: Cuates
--     Purpose: Log table
-- =========================
CREATE TABLE [dbo].[LogTableName](
  [ltnID] [bigint] identity (1, 1) not null,
  [mtnID] [bigint] not null,
  [created_date] [datetime2](7) not null,
  [status] [smallint] not null,
  [modified_date] [datetime2](7) null,
  [columnOneName] [int] not null,
  [columnTwoName] [nvarchar](255) not null,
  [userID] [int] not null,
  [actionType] [nvarchar](255) not null,
 CONSTRAINT [PK_LogTableName] PRIMARY KEY CLUSTERED
(
  [ltnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[LogTableName] ADD  DEFAULT (getdate()) FOR [created_date]
GO

ALTER TABLE [dbo].[LogTableName] ADD  DEFAULT ((0)) FOR [status]
GO

ALTER TABLE [dbo].[LogTableName] ADD  DEFAULT (getdate()) FOR [modified_date]
GO

ALTER TABLE [dbo].[LogTableName] ADD  DEFAULT ((1)) FOR [userID]
GO