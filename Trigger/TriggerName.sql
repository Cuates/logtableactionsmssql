use [DatabaseName]
go

-- Set ansi nulls
set ansi_nulls on
go

-- Set quoted identifier
set quoted_identifier on
go

-- ======================================
--       File: TriggerName
--    Created: 07/21/2020
--    Updated: 07/29/2020
-- Programmer: Cuates
--  Update By: Cuates
--    Purpose: Trigger to log all actions
-- ======================================
alter trigger [dbo].[TriggerName] on [dbo].[MainTableName]
for insert,update,delete
as
begin
  -- Set nocount on added to prevent extra result sets from interfering with select statements
  set nocount on

  -- Check if record was inserted but not delete
  if exists
  (
    -- Select record
    select
    mtnID
    from inserted
  ) and
  not exists
  (
    -- Select record
    select
    mtnID
    from deleted
  )
    begin
      -- Insert select
      insert into LogTableName (mtnID, created_date, [status], modified_date, columnOneName, columnTwoName, userID, actionType)
      select
      mtnID,
      created_date,
      [status],
      modified_date,
      columnOneName,
      columnTwoName,
      userID,
      'Inserted'
      from inserted
    end

  -- Check if record was deleted and inserted
  if exists
  (
    -- Select record
    select
    mtnID
    from inserted
  ) and
  exists
  (
    -- Select record
    select
    mtnID
    from deleted
  )
    begin
      -- Insert select
      insert into LogTableName (mtnID, created_date, [status], modified_date, columnOneName, columnTwoName, batch_number, userID, actionType)
      select
      mtnID,
      created_date,
      [status],
      modified_date,
      columnOneName,
      columnTwoName,
      userID,
      'Updated'
      from inserted
    end

  -- Check if record was deleted but not inserted
  if not exists
  (
    -- Select record
    select
    mtnID
    from inserted
  ) and
  exists
  (
    -- Select record
    select
    mtnID
    from deleted
  )
    begin
      -- Insert select
      insert into LogTableName (mtnID, created_date, [status], modified_date, columnOneName, columnTwoName, userID, actionType)
      select
      mtnID,
      created_date,
      [status],
      modified_date,
      columnOneName,
      columnTwoName,
      userID,
      'Deleted'
      from deleted
    end
end