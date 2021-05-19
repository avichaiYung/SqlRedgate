SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		Yaniv
-- Create date: 03/01/2018
-- Description:	get configs for export usage to Dynamodb job
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_USG_GetUsageExportConfig]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT	[Id], [ConfigName], [ConfigValue]
	FROM	[dbo].[TLRM_USG_UsageExportConfig]
END
GO
