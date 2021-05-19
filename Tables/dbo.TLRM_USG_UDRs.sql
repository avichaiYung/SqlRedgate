CREATE TABLE [dbo].[TLRM_USG_UDRs]
(
[udrID] [bigint] NOT NULL IDENTITY(2200000000, 1),
[udrStatusID] [int] NULL,
[udrStatusDate] [datetime] NULL,
[udrFileID] [int] NULL,
[orderProductID] [int] NULL,
[udrSubscriberID] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[udrIP] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[udrSVID] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[udrNetworkElement] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[udrServiceStartTime] [datetime] NULL,
[udrServiceEndTime] [datetime] NULL,
[applicationTypeID] [int] NULL,
[udrRxBytes] [bigint] NULL,
[udrTxBytes] [bigint] NULL,
[productID] [int] NULL,
[cellularDeviceIMEI] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[countryID] [int] NULL,
[udrVersion] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[udrAttA] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[udrAttB] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[udrAttC] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[atUsageKey] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[udrCreatedate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TLRM_USG_UDRs] ADD CONSTRAINT [PK_TLRM_USG_UDRs] PRIMARY KEY CLUSTERED  ([udrID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20201214-122329] ON [dbo].[TLRM_USG_UDRs] ([udrStatusID], [udrID]) WITH (FILLFACTOR=50, PAD_INDEX=ON) ON [PRIMARY]
GO
