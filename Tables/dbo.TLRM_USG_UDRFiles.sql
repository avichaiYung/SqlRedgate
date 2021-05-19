CREATE TABLE [dbo].[TLRM_USG_UDRFiles]
(
[udrFileID] [int] NOT NULL IDENTITY(100, 1),
[udrFilePath] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[udrFileStatusID] [int] NULL,
[udrFileStatusDate] [datetime] NULL,
[udrFileSize] [float] NULL,
[threadID] [int] NULL CONSTRAINT [DF_TLRM_USG_UDRFiles_threadID] DEFAULT ((1)),
[udrFileCreateDate] [datetime] NULL,
[udrFileIsDeleted] [bit] NULL CONSTRAINT [DF_TLRM_USG_UDRFiles_udrFileIsDeleted_1] DEFAULT ((0)),
[udrFileDeletedDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TLRM_USG_UDRFiles] ADD CONSTRAINT [PK_TLRM_USG_UDRFiles] PRIMARY KEY CLUSTERED  ([udrFileID]) ON [PRIMARY]
GO
