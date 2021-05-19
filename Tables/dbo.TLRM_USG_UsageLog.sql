CREATE TABLE [dbo].[TLRM_USG_UsageLog]
(
[ulogID] [bigint] NOT NULL IDENTITY(1, 1),
[ulogStatusID] [int] NULL,
[ulogStatusDate] [datetime] NULL,
[ulogIP] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ulogIMEI] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ulogMACAddress] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ulogICCID] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ulogMSISDN] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ulogIMSI] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[reportEventID] [int] NULL,
[ulogFirmwareVersion] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ulogMCC] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ulogMNC] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ulogApplianceID] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ulogNetwork] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[nsmID] [int] NULL,
[ctypeID] [int] NULL,
[ulogSS] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ulogBatLevel] [int] NULL,
[ulogTotalDevices] [int] NULL,
[batteryChrgID] [int] NULL,
[ulogSSID] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ulogMF30Ver] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ulogMF60Ver] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ulogCellid] [int] NULL,
[quotaTypeID] [int] NULL,
[ulogQuota] [float] NULL,
[ulogTimeZone] [int] NULL,
[ulogUsageDateTime] [datetime] NULL,
[customerID] [int] NULL,
[orderID] [int] NULL,
[orderNumber] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[orderProductID] [int] NULL,
[productID] [int] NULL,
[orderUsageTypeID] [int] NULL,
[ulogIsRoaming] [bit] NULL,
[countryID] [int] NULL,
[carrierID] [int] NULL,
[ulogDeviceID] [int] NULL,
[ulogDeviceNumber] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ulogSIMDeviceID] [int] NULL,
[ulogSIMDeviceNumber] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[usageWebbingSIM] [bit] NULL,
[usageKey] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[uLogCreateDate] [datetime] NULL,
[ulogQID] [bigint] NULL,
[InternalOrderID] [int] NULL,
[accountID] [int] NULL,
[branchID] [int] NULL,
[serviceProviderID] [int] NULL CONSTRAINT [DF_TLRM_USG_UsageLog_serviceProviderID] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TLRM_USG_UsageLog] ADD CONSTRAINT [PK_TLRM_USG_UsageLog] PRIMARY KEY CLUSTERED  ([ulogID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20140702-154721] ON [dbo].[TLRM_USG_UsageLog] ([carrierID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_TLRM_USG_UsageLog_NonClusteredIndex_CustomerID] ON [dbo].[TLRM_USG_UsageLog] ([customerID], [orderID], [orderProductID], [productID], [carrierID], [ulogDeviceID], [ulogSIMDeviceID], [ulogStatusID], [ulogUsageDateTime]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20141215-103847] ON [dbo].[TLRM_USG_UsageLog] ([orderProductID], [orderID], [customerID], [ulogStatusID], [ulogUsageDateTime]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20140530-004110] ON [dbo].[TLRM_USG_UsageLog] ([ulogDeviceID], [customerID], [branchID], [ulogStatusID], [ulogUsageDateTime]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20140530-004115] ON [dbo].[TLRM_USG_UsageLog] ([ulogDeviceID], [customerID], [ulogStatusID], [ulogUsageDateTime]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20140530-004120] ON [dbo].[TLRM_USG_UsageLog] ([ulogSIMDeviceID], [customerID], [branchID], [ulogStatusID], [ulogUsageDateTime]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20140530-004109] ON [dbo].[TLRM_USG_UsageLog] ([ulogSIMDeviceID], [customerID], [ulogStatusID], [ulogUsageDateTime]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20140528-144418] ON [dbo].[TLRM_USG_UsageLog] ([ulogStatusID], [ulogID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20140528-144419] ON [dbo].[TLRM_USG_UsageLog] ([ulogStatusID], [ulogUsageDateTime]) INCLUDE ([ulogID]) ON [PRIMARY]
GO
