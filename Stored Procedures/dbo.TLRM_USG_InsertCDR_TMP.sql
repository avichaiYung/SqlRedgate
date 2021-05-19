SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_USG_InsertCDR_TMP] 	
	@cdrVersion	varchar(250),
	@cdrUsageKey	varchar(250),
	@cdrAccountingRecordTypeID	int,
	@cdrStatusID	int,
	@cdrStatusDate	datetime,
	@cdrFileID	int,
	@cdrNetworkElement	varchar(250),
	@cdrRecordOpeningTime datetime = NULL, 
	@cdrStartTime	datetime,	
	@cdrEndTime	datetime,	
	@cdrUsageUplink	bigint,
	@cdrUsageDownlink	bigint,	
	@cdrUsageDate	datetime,	
	@cdrIMSI	varchar(250),	
	@cdrIMEI	varchar(250),	
	@cdrIP	varchar(250),	
	@cdrMCCMNC	varchar(250),	
	@cdrSGSNIP	varchar(250),	
	@cdrData	varchar(MAX),	
	@sdID	int,	
	@subscriberID	int,	
	@affiliateID	int,	
	@customerID	int,	
	@orderID	int,	
	@orderNumber	varchar(250),	
	@productID	int,
	@internalOrderID	int,	
	@accountID	int,	
	@branchID	int,	
	@cdrIMSIServiceProviderID	int,	
	@cdrSIMID	int,	
	@cdrSIMSerial	varchar(250),	
	@cdrICCID	varchar(250),	
	@cdrSIMServiceProfileID	int,	
	@cdrSIMServiceProviderID	int,	
	@cdrUsageDeviceID	int,	
	@cdrUsageDeviceSerial	varchar(250),		
	@carrierID	int,	
	@vplmnID	int,	
	@vplmnName	varchar(250),	
	@vplmnTADIGCode	varchar(250),	
	@countryID	int,	
	@countryName	varchar(250),	
	@countryCode	varchar(250),		
	@cdrCreatedate	datetime	


AS
BEGIN
DECLARE
	@threadID int 

	--SET @threadID = (ABS(CHECKSUM(NewId())) % 50) + 1
	SET @threadid = CAST(RIGHT(@cdrIMSI, 2) AS int) + 1
	
	IF @threadid > 50
		BEGIN

			SET @threadid = @threadid - 50

		END


	INSERT INTO TLRM_USG_CDRs_TMP
							 (cdrVersion, cdrUsageKey, cdrAccountingRecordTypeID, cdrStatusID, cdrStatusDate, cdrFileID, cdrNetworkElement, cdrRecordOpeningTime, cdrStartTime, cdrEndTime, cdrUsageUplink, cdrUsageDownlink, cdrUsageDate, cdrIMSI, cdrIMEI, cdrIP, 
							 cdrMCCMNC, cdrSGSNIP, cdrData, sdID, subscriberID, affiliateID, customerID, orderID, orderNumber, productID, internalOrderID, accountID, branchID, cdrIMSIServiceProviderID, cdrSIMID, cdrSIMSerial, cdrICCID, cdrSIMServiceProfileID, 
							 cdrSIMServiceProviderID, cdrUsageDeviceID, cdrUsageDeviceSerial, carrierID, vplmnID, vplmnName, vplmnTADIGCode, countryID, countryName, countryCode, threadID, cdrCreatedate)
	VALUES        (@cdrVersion, @cdrUsageKey, @cdrAccountingRecordTypeID, @cdrStatusID, @cdrStatusDate, @cdrFileID, @cdrNetworkElement, @cdrRecordOpeningTime, @cdrStartTime, @cdrEndTime, @cdrUsageUplink, @cdrUsageDownlink, @cdrUsageDate, @cdrIMSI, @cdrIMEI, @cdrIP, 
							 @cdrMCCMNC, @cdrSGSNIP, @cdrData, @sdID, @subscriberID, @affiliateID, @customerID, @orderID, @orderNumber, @productID, @internalOrderID, @accountID, @branchID, @cdrIMSIServiceProviderID, @cdrSIMID, @cdrSIMSerial, @cdrICCID, @cdrSIMServiceProfileID, 
							 @cdrSIMServiceProviderID, @cdrUsageDeviceID, @cdrUsageDeviceSerial, @carrierID, @vplmnID, @vplmnName, @vplmnTADIGCode, @countryID, @countryName, @countryCode, @threadID, @cdrCreatedate)

	IF(@@IDENTITY > 0)
		BEGIN
			SELECT CAST(@@IDENTITY AS bigint)
		END
	ELSE
		BEGIN
			SELECT 0
		END


END










GO
