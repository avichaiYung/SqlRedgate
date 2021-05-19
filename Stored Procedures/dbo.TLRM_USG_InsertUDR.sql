SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO











-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_USG_InsertUDR] 	
	@udrStatusID int, 
	@udrStatusDate datetime, 
	@udrFileID int, 
	@orderProductID int, 
	@udrSubscriberID varchar(250), 
	@udrIP varchar(250), 
	@udrSVID varchar(250), 
	@udrNetworkElement varchar(250), 
	@udrServiceStartTime datetime, 
	@udrServiceEndTime datetime, 
	@applicationTypeID int, 
	@udrRxBytes bigint, 
	@udrTxBytes bigint, 
	@productID int, 
	@cellularDeviceIMEI varchar(250), 
	@countryID int, 
	@udrVersion varchar(250),  
	@udrAttA varchar(250), 
	@udrAttB varchar(250),  
	@udrAttC varchar(250), 
	@atUsageKey varchar(250), 
	@udrCreatedate datetime

AS
BEGIN

	INSERT INTO TLRM_USG_UDRs
							 (udrStatusID, udrStatusDate, udrFileID, orderProductID, udrSubscriberID, udrIP, udrSVID, udrNetworkElement, udrServiceStartTime, udrServiceEndTime, applicationTypeID, udrRxBytes, udrTxBytes, productID, 
							 cellularDeviceIMEI, countryID, udrVersion, udrAttA, udrAttB, udrAttC, atUsageKey, udrCreatedate)
	VALUES        (@udrStatusID, @udrStatusDate, @udrFileID, @orderProductID, @udrSubscriberID, @udrIP, @udrSVID, @udrNetworkElement, @udrServiceStartTime, @udrServiceEndTime, @applicationTypeID, @udrRxBytes, @udrTxBytes, @productID, 
							 @cellularDeviceIMEI, @countryID, @udrVersion, @udrAttA, @udrAttB, @udrAttC, @atUsageKey, @udrCreatedate)

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
