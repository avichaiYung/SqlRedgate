SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/*
SELECT * FROM TLRM_USG_CDRs
SELECT * FROM TLRM_USG_CDRs_TMP WHERE cdrStatusID = 200

SELECT * FROM TLRM_USG_CDRs_TMP WHERE countryID > 0
*/

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_USG_CompleteCDR]
	@cdrID bigint ,
	@cdrUsageKey varchar(250),
	@cdrStatusID int,
	@cdrStatusDate datetime,
	@cdrUsageDate datetime,
	@sdID int,
	@subscriberID int,
	@affiliateID int,
	@customerID int,
	@orderID int,
	@orderNumber varchar(250),
	@productID int,
	@internalOrderID int,
	@accountID int,
	@branchID int,
	@cdrIMSIServiceProviderID int,
	@cdrSIMID int,
	@cdrSIMSerial varchar(250),
	@cdrICCID varchar(250),
	@cdrSIMServiceProfileID int,
	@cdrSIMServiceProviderID int,
	@cdrUsageDeviceID int,
	@cdrUsageDeviceSerial varchar(250),
	@carrierID int,
	@vplmnID int,
	@vplmnName varchar(250),
	@vplmnTADIGCode varchar(250),
	@countryID int,
	@countryName varchar(250),
	@countryCode varchar(250)
						  
AS
BEGIN

	UPDATE       TLRM_USG_CDRs_TMP
	SET                cdrUsageKey = @cdrUsageKey, cdrStatusID = @cdrStatusID,
	cdrStatusDate = @cdrStatusDate, cdrUsageDate = @cdrUsageDate, sdID = @sdID, subscriberID = @subscriberID, affiliateID = @affiliateID, 
							 customerID = @customerID, orderID = @orderID, orderNumber = @orderNumber, productID = @productID, internalOrderID = @internalOrderID, accountID = @accountID, branchID = @branchID, 
							 cdrIMSIServiceProviderID = @cdrIMSIServiceProviderID, cdrSIMID = @cdrSIMID, cdrSIMSerial = @cdrSIMSerial, cdrICCID = @cdrICCID, cdrSIMServiceProfileID = @cdrSIMServiceProfileID, 
							 cdrSIMServiceProviderID = @cdrSIMServiceProviderID, cdrUsageDeviceID = @cdrUsageDeviceID, cdrUsageDeviceSerial = @cdrUsageDeviceSerial, carrierID = @carrierID, vplmnID = @vplmnID, vplmnName = @vplmnName, 
							 vplmnTADIGCode = @vplmnTADIGCode, countryID = @countryID, countryName = @countryName, countryCode = @countryCode
	WHERE        (cdrID = @cdrID)
	
	IF(@@ROWCOUNT > 0)
		BEGIN
			SELECT CAST(1 AS bit)
		END
	ELSE
		BEGIN
			SELECT CAST(0 AS bit)
		END


END









GO
