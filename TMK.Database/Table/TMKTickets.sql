﻿IF object_id('TMKTickets','U') IS NULL EXEC('CREATE TABLE TMKTickets (nothing int)')
GO 

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='TMKTickets' AND COLUMN_NAME='PrimaryID') ALTER TABLE TMKTickets ADD [PrimaryID] INT IDENTITY(1,1) NOT NULL 
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='TMKTickets' AND COLUMN_NAME='ValidFrom') ALTER TABLE TMKTickets ADD [ValidFrom] DATETIME NOT NULL 
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='TMKTickets' AND COLUMN_NAME='ValidTo') ALTER TABLE TMKTickets ADD [ValidTo] DATETIME NULL 
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='TMKTickets' AND COLUMN_NAME='OwnerID') ALTER TABLE TMKTickets ADD [OwnerID] BIGINT NOT NULL 
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='TMKTickets' AND COLUMN_NAME='CreatedAt') ALTER TABLE TMKTickets ADD [CreatedAt] DATETIME NOT NULL DEFAULT(GETDATE())
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='TMKTickets' AND COLUMN_NAME='OrganizationID') ALTER TABLE TMKTickets ADD [OrganizationID] INT NOT NULL
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='TMKTickets' AND COLUMN_NAME='AreaID') ALTER TABLE TMKTickets ADD [AreaID] INT NOT NULL
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='TMKTickets' AND COLUMN_NAME='TargetID') ALTER TABLE TMKTickets ADD [TargetID] INT NOT NULL
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='TMKTickets' AND COLUMN_NAME='ErrorTypeID') ALTER TABLE TMKTickets ADD [ErrorTypeID] INT NOT NULL
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='TMKTickets' AND COLUMN_NAME='RequestedBy') ALTER TABLE TMKTickets ADD [RequestedBy] INT NOT NULL
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='TMKTickets' AND COLUMN_NAME='ErrorText') ALTER TABLE TMKTickets ADD [ErrorText] NVARCHAR(MAX) NULL
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='TMKTickets' AND COLUMN_NAME='IsOutOfOrder') ALTER TABLE TMKTickets ADD [IsOutOfOrder] BIT NULL
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='TMKTickets' AND COLUMN_NAME='IsToolChange') ALTER TABLE TMKTickets ADD [IsToolChange] BIT NULL
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='TMKTickets' AND COLUMN_NAME='ResolutionText') ALTER TABLE TMKTickets ADD [ResolutionText] NVARCHAR(MAX) NULL
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='TMKTickets' AND COLUMN_NAME='ActiveFrom') ALTER TABLE TMKTickets ADD [ActiveFrom] DATETIME NOT NULL DEFAULT(GETDATE())
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='TMKTickets' AND COLUMN_NAME='ActiveTo') ALTER TABLE TMKTickets ADD [ActiveTo] DATETIME NULL
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='TMKTickets' AND COLUMN_NAME='MaintenanceTime') ALTER TABLE TMKTickets ADD [MaintenanceTime] INT NULL
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='TMKTickets' AND COLUMN_NAME='DowntimeStart') ALTER TABLE TMKTickets ADD [DowntimeStart] DATETIME NULL 
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='TMKTickets' AND COLUMN_NAME='DowntimeEnd') ALTER TABLE TMKTickets ADD [DowntimeEnd] DATETIME NULL
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='TMKTickets' AND COLUMN_NAME='StatusID') ALTER TABLE TMKTickets ADD [StatusID] INT NULL
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='TMKTickets' AND COLUMN_NAME='FurtherAction') ALTER TABLE TMKTickets ADD [FurtherAction] NVARCHAR(MAX) NULL
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='TMKTickets' AND COLUMN_NAME='CategoryID') ALTER TABLE TMKTickets ADD [CategoryID] INT NULL
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='TMKTickets' AND COLUMN_NAME='IsTakenOver') ALTER TABLE TMKTickets ADD [IsTakenOver] BIT NOT NULL DEFAULT(0)
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='TMKTickets' AND COLUMN_NAME='ExternalID') ALTER TABLE TMKTickets ADD [ExternalID] NVARCHAR(MAX) NULL
GO
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='TMKTickets' AND COLUMN_NAME='nothing') ALTER TABLE TMKTickets DROP COLUMN nothing
IF NOT EXISTS (SELECT * FROM sys.key_constraints WHERE parent_object_id = OBJECT_ID('TMKTickets') AND name = 'PK_TMKTickets') ALTER TABLE TMKTickets ADD CONSTRAINT PK_TMKTickets PRIMARY KEY  CLUSTERED (PrimaryID ASC)
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID('TMKTickets') AND name = 'IX_TMKTickets_ValidTo') CREATE NONCLUSTERED INDEX [IX_TMKTickets_ValidTo] ON [TMKTickets] (ValidTo ASC)