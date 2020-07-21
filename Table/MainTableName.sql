USE [DatabaseName]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- ==========================
--        File: MainTableName
--     Created: 07/21/2020
--     Updated: 07/21/2020
--  Programmer: Cuates
--   Update By: Cuates
--     Purpose: Main table
-- ==========================
CREATE TABLE [dbo].[MainTableName](
  [mtnID] [bigint] identity (1, 1) not null,
  [created_date] [datetime2](7) not null,
  [status] [smallint] not null,
  [modified_date] [datetime2](7) null,
  [columnOneName] [int] not null,
  [columnTwoName] [nvarchar](255) not null,
  [userID] [int] not null,
 CONSTRAINT [PK_MainTableName] PRIMARY KEY CLUSTERED
(
  [mtnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[MainTableName] ADD  DEFAULT (getdate()) FOR [created_date]
GO

ALTER TABLE [dbo].[MainTableName] ADD  DEFAULT ((0)) FOR [status]
GO

ALTER TABLE [dbo].[MainTableName] ADD  DEFAULT (getdate()) FOR [modified_date]
GO

ALTER TABLE [dbo].[MainTableName] ADD  DEFAULT ((1)) FOR [userID]
GO