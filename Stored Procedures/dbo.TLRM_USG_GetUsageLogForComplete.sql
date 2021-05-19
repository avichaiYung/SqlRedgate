SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


/*
	[TLRM_USG_GetUsageLogForComplete] 1
*/

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_USG_GetUsageLogForComplete]
	@threadID int

AS
BEGIN

	SELECT        TOP (500) ulogID, ulogStatusID, ulogStatusDate, ulogIP, ulogIMEI, ulogMACAddress, ulogICCID, ulogMSISDN, ulogIMSI, reportEventID, ulogFirmwareVersion, ulogMCC, ulogMNC, ulogApplianceID, ulogNetwork, 
							 nsmID, ctypeID, ulogSS, ulogBatLevel, ulogTotalDevices, batteryChrgID, ulogSSID, ulogMF30Ver, ulogMF60Ver, ulogCellid, quotaTypeID, ulogQuota, ulogTimeZone, ulogUsageDateTime, customerID, orderID, 
							 orderNumber, orderProductID, productID, orderUsageTypeID, ulogIsRoaming, countryID, carrierID, ulogDeviceID, ulogDeviceNumber, ulogSIMDeviceID, ulogSIMDeviceNumber, usageWebbingSIM, usageKey, 
							 uLogCreateDate, ulogQID, InternalOrderID
	FROM            TLRM_USG_UsageLog_TMP WITH (NOLOCK, INDEX([NonClusteredIndex-20150512-204334]))
	WHERE     (threadID = @threadID) AND (ulogStatusID IN (2,4))
	--WHERE     (ulogStatusID IN (2,4,7))
	--WHERE     (ulogStatusID IN (2))

		
END







GO
