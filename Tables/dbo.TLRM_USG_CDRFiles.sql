CREATE TABLE [dbo].[TLRM_USG_CDRFiles]
(
[cdrFileID] [int] NOT NULL IDENTITY(100, 1),
[cdrFilePath] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cdrFileStatusID] [int] NULL,
[cdrFileStatusDate] [datetime] NULL,
[cdrFileSize] [float] NULL CONSTRAINT [DF_TLRM_USG_CDRFiles_cdrFileSize] DEFAULT ((0)),
[threadID] [int] NULL CONSTRAINT [DF_TLRM_USG_CDRFiles_threadID] DEFAULT ((1)),
[cdrFileCreateDate] [datetime] NULL,
[cdrFileIsDeleted] [bit] NULL CONSTRAINT [DF_TLRM_USG_CDRFiles_cdrFileIsDeleted] DEFAULT ((0)),
[cdrFileDeletedDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TLRM_USG_CDRFiles] ADD CONSTRAINT [PK_TLRM_USG_CDRFiles] PRIMARY KEY CLUSTERED  ([cdrFileID]) ON [PRIMARY]
GO
