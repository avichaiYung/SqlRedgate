SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO











-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_USG_CompleteUsageLog]
	@ulogID bigint,
	@ulogStatusID int,
	@ulogStatusDate datetime,	
	@ulogUsageDateTime datetime,
	@customerID int,
	@orderID int,
	@orderNumber varchar(250),
	@orderProductID int,
	@InternalOrderID int,
	@accountID int,
	@branchID int,
	@productID int,
	@orderUsageTypeID int,
	@ulogIsRoaming bit,
	@countryID int, 
	@carrierID int,
	@ulogDeviceID int,
	@ulogDeviceNumber varchar(250),
	@ulogSIMDeviceID int,
	@ulogSIMDeviceNumber varchar(250),
	@usageWebbingSIM bit,
	@serviceProviderID int,
	@usageKey varchar(250)
						  
AS
BEGIN

	UPDATE    TLRM_USG_UsageLog_TMP
	SET              ulogStatusID = @ulogStatusID, ulogStatusDate = @ulogStatusDate, ulogUsageDateTime = @ulogUsageDateTime, customerID = @customerID, 
						  orderID = @orderID, orderNumber = @orderNumber, orderProductID = @orderProductID, InternalOrderID = @InternalOrderID, 
						  accountID = @accountID, branchID = @branchID, productID = @productID, 
						  orderUsageTypeID = @orderUsageTypeID, ulogIsRoaming = @ulogIsRoaming, countryID = @countryID, carrierID = @carrierID, 
						  ulogDeviceID = @ulogDeviceID, ulogDeviceNumber = @ulogDeviceNumber, ulogSIMDeviceID = @ulogSIMDeviceID, 
						  ulogSIMDeviceNumber = @ulogSIMDeviceNumber, usageWebbingSIM = @usageWebbingSIM, serviceProviderID = @serviceProviderID, usageKey = @usageKey
	WHERE     (ulogID = @ulogID)
	
	IF(@@ROWCOUNT > 0)
		BEGIN
			SELECT @ulogID
		END
	ELSE
		BEGIN
			SELECT 0
		END


END










GO
