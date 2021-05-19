CREATE TABLE [dbo].[TLRM_USG_UsageLogStatuses]
(
[ulogStatusID] [int] NOT NULL IDENTITY(1, 1),
[ulogStatusIsFixed] [bit] NULL CONSTRAINT [DF_TLRM_USG_UsageLogStatuses_ulogStatusIsFixed] DEFAULT ((1)),
[ulogStatusName] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ulogStatusSort] [int] NULL CONSTRAINT [DF_TLRM_USG_UsageLogStatuses_ulogStatusSort] DEFAULT ((999))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TLRM_USG_UsageLogStatuses] ADD CONSTRAINT [PK_TLRM_USG_UsageLogStatuses] PRIMARY KEY CLUSTERED  ([ulogStatusID]) ON [PRIMARY]
GO
