CREATE TABLE [dbo].[TLRM_USG_NetworkSelectionModes]
(
[nsmID] [int] NOT NULL,
[nsmIsFixed] [bit] NULL,
[nsmName] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[nsmSort] [int] NULL
) ON [PRIMARY]
GO
