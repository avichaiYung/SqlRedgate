SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




/*
SELECT COUNT(*), GETDATE() FROM TLRM_USG_UDRs_TMP WHERE udrStatusID = 100

DECLARE
	@StartDate datetime = '2020-03-04 08:59:44.940',
	@StartCount int = 86568060,
	@EndDate datetime,
	@EndCount int
 

SELECT @EndCount = COUNT(*), @EndDate = GETDATE() FROM TLRM_USG_UDRs_TMP WHERE udrStatusID = 100

SELECT (@EndCount - @StartCount) AS [Total processed], DATEDIFF(minute, @StartDate, @EndDate) AS [Total Minutes], (@EndCount - @StartCount) / DATEDIFF(second, @StartDate, @EndDate) AS [AVG/sec]

*/






-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_MONI_GetUsageHealth]



AS
BEGIN
	
	--Usage log last insert
	SELECT     TOP 1   uLogCreateDate
	FROM            TLRM_USG_UsageLog
	ORDER BY ulogID DESC

	--UDRS last insert
	SELECT     TOP 1   udrCreatedate
	FROM            TLRM_USG_UDRs
	ORDER BY udrID DESC
	
	--Usage log TMP
	SELECT uLog.ulogStatusID, TLRM_USG_UsageLogStatuses.ulogStatusName, uLog.Total 
	FROM (
			SELECT ulogStatusID, COUNT(*) AS Total FROM TLRM_USG_UsageLog_TMP GROUP BY ulogStatusID
			) AS uLog LEFT OUTER JOIN TLRM_USG_UsageLogStatuses ON uLog.ulogStatusID = TLRM_USG_UsageLogStatuses.ulogStatusID

	--UDRs TMP
	SELECT udrs.udrStatusID, TLRM_USG_UDRStatus.udrStatusName, udrs.Total
	FROM (
			SELECT udrStatusID, COUNT(*) AS Total FROM TLRM_USG_UDRs_TMP GROUP BY udrStatusID
			) AS udrs LEFT OUTER JOIN TLRM_USG_UDRStatus ON udrs.udrStatusID = TLRM_USG_UDRStatus.udrStatusID

	
END


GO
