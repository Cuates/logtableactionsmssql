USE [DatabaseName];
GO

-- Set ANSI_NULLS and QUOTED_IDENTIFIER
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
GO

-- ======================================
--       File: TriggerName
--    Created: 07/21/2020
--    Updated: 03/27/2025
-- Programmer: Cuates
--  Update By: AI Assistant
--    Purpose: Trigger to log all actions
-- ======================================
ALTER TRIGGER [dbo].[TriggerName]
ON [dbo].[MainTableName]
FOR INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Handle INSERT operations (record exists in 'inserted' but not in 'deleted')
    IF EXISTS (SELECT 1 FROM inserted) AND NOT EXISTS (SELECT 1 FROM deleted)
    BEGIN
        INSERT INTO [dbo].[LogTableName] 
            (mtnID, created_date, [status], modified_date, columnOneName, columnTwoName, userID, actionType)
        SELECT 
            mtnID,
            created_date,
            [status],
            modified_date,
            columnOneName,
            columnTwoName,
            userID,
            'Inserted'
        FROM inserted;
    END

    -- Handle UPDATE operations (record exists in both 'inserted' and 'deleted')
    IF EXISTS (SELECT 1 FROM inserted) AND EXISTS (SELECT 1 FROM deleted)
    BEGIN
        INSERT INTO [dbo].[LogTableName] 
            (mtnID, created_date, [status], modified_date, columnOneName, columnTwoName, userID, actionType)
        SELECT 
            mtnID,
            created_date,
            [status],
            modified_date,
            columnOneName,
            columnTwoName,
            userID,
            'Updated'
        FROM inserted;
    END

    -- Handle DELETE operations (record exists in 'deleted' but not in 'inserted')
    IF NOT EXISTS (SELECT 1 FROM inserted) AND EXISTS (SELECT 1 FROM deleted)
    BEGIN
        INSERT INTO [dbo].[LogTableName] 
            (mtnID, created_date, [status], modified_date, columnOneName, columnTwoName, userID, actionType)
        SELECT 
            mtnID,
            created_date,
            [status],
            modified_date,
            columnOneName,
            columnTwoName,
            userID,
            'Deleted'
        FROM deleted;
    END
END;
GO
