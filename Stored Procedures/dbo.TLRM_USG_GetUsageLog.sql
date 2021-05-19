SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



--TLRM_INV_GetStocks
--NULL, --@stockID int,
--NULL, --@stockStatusID int,
--NULL, --@deviceTypeID int,
--NULL, --@stockTargetID int,
--NULL --@searchText nvarchar(510)

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_USG_GetUsageLog]
	@ulogID bigint

AS
BEGIN

	SELECT        ulogID, ulogStatusID, ulogStatusDate, ulogIP, ulogIMEI, ulogMACAddress, ulogICCID, ulogMSISDN, ulogIMSI, reportEventID, ulogFirmwareVersion, ulogMCC, ulogMNC, ulogApplianceID, ulogNetwork, nsmID, 
							 ctypeID, ulogSS, ulogBatLevel, ulogTotalDevices, batteryChrgID, ulogSSID, ulogMF30Ver, ulogMF60Ver, ulogCellid, quotaTypeID, ulogQuota, ulogTimeZone, ulogUsageDateTime, customerID, orderID, 
							 orderNumber, orderProductID, productID, orderUsageTypeID, ulogIsRoaming, countryID, carrierID, ulogDeviceID, ulogDeviceNumber, ulogSIMDeviceID, ulogSIMDeviceNumber, usageWebbingSIM, usageKey, 
							 uLogCreateDate, ulogQID, InternalOrderID, accountID, branchID
	FROM            TLRM_USG_UsageLog
	WHERE     (ulogID = @ulogID)
			
END










GO
