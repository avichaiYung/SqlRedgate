SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

--DECLARE
--	@threadID int = 5
 
--	SELECT * 
--	FROM TLRM_USG_UDRs_TMP
--	WHERE udrID IN
--	(
--	SELECT        TOP (3000) udrID
--	FROM            TLRM_USG_UDRs_TMP WITH (INDEX([NonClusteredIndex-20160812-142358]))
--	WHERE udrStatusID = 100 AND threadID = @threadID
--	ORDER BY orderProductID, udrID DESC
--	) 
--	ORDER BY orderProductID

/*
	TLRM_USG_GetUDRsForComplete 4
*/

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_USG_GetUDRsForComplete]
	@threadID int


AS
BEGIN

	SELECT * 
	FROM TLRM_USG_UDRs_TMP WITH (NOLOCK)
	WHERE udrID IN
	(
	SELECT        TOP (500) udrID
	FROM            TLRM_USG_UDRs_TMP WITH (NOLOCK) --WITH (INDEX([NonClusteredIndex-20160812-142358]))
	WHERE udrStatusID = 100 AND threadID = @threadID
	) 
	ORDER BY orderProductID


--;WITH UDRs AS (
--	SELECT * 
--	FROM TLRM_USG_UDRs_TMP
--	WHERE udrID IN
--	(
--	SELECT        TOP (10000) udrID
--	FROM            TLRM_USG_UDRs_TMP WITH (INDEX([NonClusteredIndex-20160812-142358]))
--	WHERE udrStatusID = 100 AND threadID = 3
--	ORDER BY orderProductID
--	) 

--)
--	SELECT        orderProductID, udrIP, MIN(udrServiceStartTime), MONTH(udrServiceStartTime), YEAR(udrServiceStartTime), MAX(udrServiceEndTime), applicationTypeID, SUM(udrRxBytes), SUM(udrTxBytes), productID, 
--							 cellularDeviceIMEI, countryID, udrVersion, udrAttA, udrAttB, udrAttC, atUsageKey
--	FROM UDRs
--	GROUP BY orderProductID, udrIP, MONTH(udrServiceStartTime), YEAR(udrServiceStartTime), applicationTypeID, productID, 
--							 cellularDeviceIMEI, countryID, udrVersion, udrAttA, udrAttB, udrAttC, atUsageKey
	


END







GO
