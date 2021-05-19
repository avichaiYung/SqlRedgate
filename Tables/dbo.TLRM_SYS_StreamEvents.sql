CREATE TABLE [dbo].[TLRM_SYS_StreamEvents]
(
[streamEventID] [bigint] NOT NULL IDENTITY(1, 1),
[streamEventVersion] [int] NULL CONSTRAINT [DF_TLRM_SYS_StreamEvents_streamEventVersion] DEFAULT ((0)),
[threadID] [int] NULL,
[networkEventTypeID] [int] NULL,
[networkEventStatusID] [int] NULL,
[streamEventData] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[subscriberID] [int] NULL,
[sdID] [int] NULL CONSTRAINT [DF_TLRM_SYS_StreamEvents_sdID] DEFAULT ((0)),
[customerID] [int] NULL,
[streamEventName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[streamEventPartitionKey] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[countryID] [int] NULL,
[vplmnID] [int] NULL,
[streamEventMCCMNC] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[streamEventAPN] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[streamEventIMSI] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[streamEventICCID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[streamEventIMEI] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[streamEventAssignedIP] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[streamEventLocationInfo] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[deviceID] [int] NULL,
[streamEventIMSIServiceProviderID] [int] NULL,
[streamEventSVData] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[streamEventDateTime] [datetime] NULL,
[streamEventCreateDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TLRM_SYS_StreamEvents] ADD CONSTRAINT [PK_TLRM_SYS_StreamEvents] PRIMARY KEY CLUSTERED  ([streamEventID]) ON [PRIMARY]
GO
