SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:           <Author,,Name>
-- Create date: <Create Date,,>
-- Description:      <Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_USG_GetUsageLogToExport]
       @lastUsageLogID int,
       @chunkSize int
AS
BEGIN
       -- SET NOCOUNT ON added to prevent extra result sets from
       -- interfering with SELECT statements.
       SET NOCOUNT ON;

    -- Insert statements for procedure here
       SELECT TOP (@chunkSize) [ulogID]
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
      ,[InternalOrderID]
      ,[accountID]
      ,[branchID]
      ,[serviceProviderID]
  FROM [TLRM_USG_UsageLog]
  WHERE ulogID > @lastUsageLogID 
  order by ulogid 
END
GO
