CREATE TABLE [dbo].[TLRM_CTR_API]
(
[apiCTRID] [int] NOT NULL IDENTITY(1, 1),
[apiCTRMethod] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[apiCTRUsername] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[apiCTRIP] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[apiCTRStartDate] [datetime] NULL,
[apiCTREndDate] [datetime] NULL,
[apiCTRSuccess] [bit] NULL,
[apiCTRResponseCode] [int] NULL,
[apiCTRResponseDescription] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TLRM_CTR_API] ADD CONSTRAINT [PK_TLRM_CTR_API] PRIMARY KEY CLUSTERED  ([apiCTRID]) ON [PRIMARY]
GO
