SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



/*



*/

	


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_USG_GetLastUsageLog]


AS
BEGIN
	SELECT        TOP (1) ulogID, uLogCreateDate
	FROM            TLRM_USG_UsageLog
	ORDER BY ulogID DESC
END




GO
