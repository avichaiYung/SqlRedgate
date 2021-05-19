CREATE TABLE [dbo].[TLRM_USG_UDRStatusCopy]
(
[udrStatusID] [int] NOT NULL,
[udrStatusIsFixed] [bit] NULL CONSTRAINT [DF_Table_1_udrFileStatusIsFixed] DEFAULT ((1)),
[udrStatusName] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[udrStatusSort] [int] NULL CONSTRAINT [DF_Table_1_udrFileStatusSort] DEFAULT ((999)),
[first] [nchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TLRM_USG_UDRStatusCopy] ADD CONSTRAINT [PK_TLRM_USG_UDRStatusCopy] PRIMARY KEY CLUSTERED  ([udrStatusID]) ON [PRIMARY]
GO
