CREATE TABLE [dbo].[TLRM_USG_UsageExportConfig]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[ConfigName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ConfigValue] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TLRM_USG_UsageExportConfig] ADD CONSTRAINT [PK_TLRM_USG_UsageExportConfig] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
