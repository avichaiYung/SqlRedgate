SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



/*

	SELECT COUNT(*) FROM TLRM_USG_CDRs_TMP
	SELECT COUNT(*) FROM TLRM_USG_CDRs

DECLARE 
@x int = 1

WHILE @x < 100
	BEGIN
		EXEC [TLRM_USG_MoveTMPCDRs]

		SET @x = @x +1
	END

*/

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_USG_MoveTMPCDRs]
	@threadID int = NULL
AS
BEGIN

	SET NOCOUNT ON

	BEGIN TRY
		BEGIN TRANSACTION

		IF @threadID IS NULL
			BEGIN
				SET @threadID = (ABS(CHECKSUM(NewId())) % 50) + 1
			END 

		;WITH ULOG AS
		(
			SELECT        TOP (500) *
			FROM            TLRM_USG_CDRs_TMP WITH (NOLOCK, INDEX([NonClusteredIndex-20200730-185736]))
			WHERE cdrStatusID = 200 AND threadID = @threadID
		)
		DELETE FROM ULOG
		OUTPUT
		DELETED.cdrVersion, 
		DELETED.cdrUsageKey, 
		DELETED.cdrAccountingRecordTypeID, 
		DELETED.cdrStatusID, 
		DELETED.cdrStatusDate, 
		DELETED.cdrFileID, 
		DELETED.cdrNetworkElement, 		
		DELETED.cdrStartTime, 
		DELETED.cdrEndTime, 
		DELETED.cdrUsageUplink, 
		DELETED.cdrUsageDownlink, 
		DELETED.cdrUsageDate, 
		DELETED.cdrIMSI, 
		DELETED.cdrIMEI, 
		DELETED.cdrIP, 
		DELETED.cdrMCCMNC, 
		DELETED.cdrSGSNIP, 
		DELETED.cdrData, 
		DELETED.sdID, 
		DELETED.subscriberID, 
		DELETED.affiliateID, 
		DELETED.customerID, 
		DELETED.orderID, 
		DELETED.orderNumber, 
		DELETED.productID, 
		DELETED.internalOrderID, 
		DELETED.accountID, 
		DELETED.branchID, 
		DELETED.cdrIMSIServiceProviderID, 
		DELETED.cdrSIMID, 
		DELETED.cdrSIMSerial, 
		DELETED.cdrICCID, 
		DELETED.cdrSIMServiceProfileID, 
		DELETED.cdrSIMServiceProviderID, 
		DELETED.cdrUsageDeviceID, 
		DELETED.cdrUsageDeviceSerial, 
		DELETED.carrierID, 
		DELETED.vplmnID, 
		DELETED.vplmnName, 
		DELETED.vplmnTADIGCode, 
		DELETED.countryID, 
		DELETED.countryName, 
		DELETED.countryCode, 
		DELETED.threadID, 
		DELETED.cdrCreatedate,
		DELETED.cdrRecordOpeningTime
		INTO dbo.TLRM_USG_CDRs
	
		
		IF EXISTS(SELECT TOP 1 cdrID FROM TLRM_USG_CDRs_TMP WITH(NOLOCK) WHERE cdrStatusID = 200  AND threadID = @threadID)
			BEGIN
				SELECT CAST(1 AS bit)
			END
		ELSE
			BEGIN
				SELECT CAST(0 AS bit)
			END		
		
		COMMIT TRANSACTION

	END TRY
	BEGIN CATCH	

		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION

		SELECT CAST(1 AS bit)

	END CATCH;

	

	
END
GO
