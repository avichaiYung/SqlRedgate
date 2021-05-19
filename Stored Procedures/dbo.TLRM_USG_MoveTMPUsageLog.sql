SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




/*

	SELECT COUNT(*) FROM TLRM_USG_UsageLog_TMP
	SELECT COUNT(*) FROM TLRM_USG_UsageLog
*/

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_USG_MoveTMPUsageLog]	
AS
BEGIN

	SET NOCOUNT ON

	BEGIN TRY
		BEGIN TRANSACTION

		;WITH ULOG AS
		(
			SELECT        TOP (500) *
			FROM            TLRM_USG_UsageLog_TMP WITH(NOLOCK)
			WHERE ulogStatusID NOT IN (2, 4)
			ORDER BY ulogID
		)
		DELETE FROM ULOG
		OUTPUT 
			DELETED.ulogStatusID,
			DELETED.ulogStatusDate,
			DELETED.ulogIP,
			DELETED.ulogIMEI,
			DELETED.ulogMACAddress,
			DELETED.ulogICCID,
			DELETED.ulogMSISDN,
			DELETED.ulogIMSI,
			DELETED.reportEventID,
			DELETED.ulogFirmwareVersion,
			DELETED.ulogMCC,
			DELETED.ulogMNC,
			DELETED.ulogApplianceID,
			DELETED.ulogNetwork,
			DELETED.nsmID,
			DELETED.ctypeID,
			DELETED.ulogSS,
			DELETED.ulogBatLevel,
			DELETED.ulogTotalDevices,
			DELETED.batteryChrgID,
			DELETED.ulogSSID,
			DELETED.ulogMF30Ver,
			DELETED.ulogMF60Ver,
			DELETED.ulogCellid,
			DELETED.quotaTypeID,
			DELETED.ulogQuota,
			DELETED.ulogTimeZone,
			DELETED.ulogUsageDateTime,
			DELETED.customerID,
			DELETED.orderID,
			DELETED.orderNumber,
			DELETED.orderProductID,
			DELETED.productID,
			DELETED.orderUsageTypeID,
			DELETED.ulogIsRoaming,
			DELETED.countryID,
			DELETED.carrierID,
			DELETED.ulogDeviceID,
			DELETED.ulogDeviceNumber,
			DELETED.ulogSIMDeviceID,
			DELETED.ulogSIMDeviceNumber,
			DELETED.usageWebbingSIM,
			DELETED.usageKey,
			DELETED.uLogCreateDate,
			DELETED.ulogQID,
			DELETED.InternalOrderID,
			DELETED.accountID,
			DELETED.branchID,
			DELETED.serviceProviderID
		INTO dbo.TLRM_USG_UsageLog
	
			
		IF EXISTS(SELECT TOP 1 ulogID FROM TLRM_USG_UsageLog_TMP WHERE ulogStatusID NOT IN (2, 4))
			BEGIN
				SELECT CAST(1 AS bit) AS [Result], CAST(0 AS bit) AS [Completed]
			END
		ELSE
			BEGIN
				SELECT CAST(1 AS bit) AS [Result], CAST(1 AS bit) AS [Completed]
			END		
		
		COMMIT TRANSACTION

	END TRY
	BEGIN CATCH	

		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION

		SELECT CAST(0 AS bit) AS [Result], CAST(0 AS bit) AS [Completed]

	END CATCH;

	

	
END
GO
