CREATE TABLE [dbo].[TLRM_USG_CDRStatus]
(
[cdrStatusID] [int] NOT NULL,
[cdrStatusIsFixed] [bit] NULL CONSTRAINT [DF_Table_1_udrStatusIsFixed] DEFAULT ((1)),
[cdrStatusName] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cdrStatusSort] [int] NULL CONSTRAINT [DF_Table_1_udrStatusSort] DEFAULT ((999))
) ON [PRIMARY]
GO
