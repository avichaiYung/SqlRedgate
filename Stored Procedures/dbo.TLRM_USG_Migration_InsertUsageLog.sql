SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_USG_Migration_InsertUsageLog]
	@ulogID bigint,
    @ulogStatusID int,
    @ulogStatusDate datetime,
    @ulogIP varchar(250),
    @ulogIMEI varchar(250),
    @ulogMACAddress varchar(250),
    @ulogICCID varchar(250),
    @ulogMSISDN varchar(250),
    @ulogIMSI varchar(250),
    @reportEventID int,
    @ulogFirmwareVersion varchar(250),
    @ulogMCC varchar(250),
    @ulogMNC varchar(250),
    @ulogApplianceID varchar(250),
    @ulogNetwork varchar(250),
    @nsmID int,
    @ctypeID int,
    @ulogSS varchar(250),
    @ulogBatLevel int,
    @ulogTotalDevices int,
    @batteryChrgID int,
    @ulogSSID varchar(250),
    @ulogMF30Ver varchar(250),
    @ulogMF60Ver varchar(250),
    @ulogCellid int,
    @quotaTypeID int,
    @ulogQuota float,
    @ulogTimeZone int,
    @ulogUsageDateTime datetime,
    @customerID int,
    @orderID int,
    @orderNumber varchar(250),
    @orderProductID int,
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
    @usageKey varchar(250),
    @uLogCreateDate datetime,
    @ulogQID bigint,
    @InternalOrderID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[TLRM_USG_UsageLog]
           ([ulogID]
           ,[ulogStatusID]
           ,[ulogStatusDate]
           ,[ulogIP]
           ,[ulogIMEI]
           ,[ulogMACAddress]
           ,[ulogICCID]
           ,[ulogMSISDN]
           ,[ulogIMSI]
           ,[reportEventID]
           ,[ulogFirmwareVersion]
           ,[ulogMCC]
           ,[ulogMNC]
           ,[ulogApplianceID]
           ,[ulogNetwork]
           ,[nsmID]
           ,[ctypeID]
           ,[ulogSS]
           ,[ulogBatLevel]
           ,[ulogTotalDevices]
           ,[batteryChrgID]
           ,[ulogSSID]
           ,[ulogMF30Ver]
           ,[ulogMF60Ver]
           ,[ulogCellid]
           ,[quotaTypeID]
           ,[ulogQuota]
           ,[ulogTimeZone]
           ,[ulogUsageDateTime]
           ,[customerID]
           ,[orderID]
           ,[orderNumber]
           ,[orderProductID]
           ,[productID]
           ,[orderUsageTypeID]
           ,[ulogIsRoaming]
           ,[countryID]
           ,[carrierID]
           ,[ulogDeviceID]
           ,[ulogDeviceNumber]
           ,[ulogSIMDeviceID]
           ,[ulogSIMDeviceNumber]
           ,[usageWebbingSIM]
           ,[usageKey]
           ,[uLogCreateDate]
           ,[ulogQID]
           ,[InternalOrderID])
     VALUES
           (@ulogID,
			@ulogStatusID,
			@ulogStatusDate,
			@ulogIP,
			@ulogIMEI,
			@ulogMACAddress,
			@ulogICCID,
			@ulogMSISDN,
			@ulogIMSI,
			@reportEventID,
			@ulogFirmwareVersion,
			@ulogMCC,
			@ulogMNC,
			@ulogApplianceID,
			@ulogNetwork,
			@nsmID,
			@ctypeID,
			@ulogSS,
			@ulogBatLevel,
			@ulogTotalDevices,
			@batteryChrgID,
			@ulogSSID,
			@ulogMF30Ver,
			@ulogMF60Ver,
			@ulogCellid,
			@quotaTypeID,
			@ulogQuota,
			@ulogTimeZone,
			@ulogUsageDateTime,
			@customerID,
			@orderID,
			@orderNumber,
			@orderProductID,
			@productID,
			@orderUsageTypeID,
			@ulogIsRoaming,
			@countryID,
			@carrierID,
			@ulogDeviceID,
			@ulogDeviceNumber,
			@ulogSIMDeviceID,
			@ulogSIMDeviceNumber,
			@usageWebbingSIM,
			@usageKey,
			@uLogCreateDate,
			@ulogQID,
			@InternalOrderID)

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
