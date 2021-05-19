SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO











-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_USG_InsertUsageLog_TMP] 	
	@ulogStatusID int,
	@ulogStatusDate datetime,
	@ulogIP varchar(250),
	@ulogIMEI varchar(250),
	@ulogMACAddress	varchar(250),
	@ulogICCID varchar(250),
	@ulogMSISDN varchar(250),
	@ulogIMSI varchar(250),
	@reportEventID int,
	@ulogFirmwareVersion	varchar(250),
	@ulogMCC	varchar(250),
	@ulogMNC	varchar(250),
	@ulogApplianceID varchar(250),
	@ulogNetwork varchar(250),
	@nsmID int,
	@ctypeID int,
	@ulogSS	varchar(250),
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
	@uLogCreateDate datetime,
	@ulogQID bigint,
	@threadID int

AS
BEGIN
	SET @threadID = 1

	INSERT INTO TLRM_USG_UsageLog_TMP
							 (ulogStatusID, ulogStatusDate, ulogIP, ulogIMEI, ulogMACAddress, ulogICCID, ulogMSISDN, ulogIMSI, reportEventID, ulogFirmwareVersion, ulogMCC, ulogMNC, ulogApplianceID, ulogNetwork, nsmID, ctypeID, 
							 ulogSS, ulogBatLevel, ulogTotalDevices, batteryChrgID, ulogSSID, ulogMF30Ver, ulogMF60Ver, ulogCellid, quotaTypeID, ulogQuota, ulogTimeZone, ulogUsageDateTime, uLogCreateDate, ulogQID, threadID)
	VALUES        (@ulogStatusID,@ulogStatusDate,@ulogIP,@ulogIMEI,@ulogMACAddress,@ulogICCID,@ulogMSISDN,@ulogIMSI,@reportEventID,@ulogFirmwareVersion,@ulogMCC,@ulogMNC,@ulogApplianceID,@ulogNetwork,@nsmID,@ctypeID,@ulogSS,@ulogBatLevel,@ulogTotalDevices,@batteryChrgID,@ulogSSID,@ulogMF30Ver,@ulogMF60Ver,@ulogCellid,@quotaTypeID,@ulogQuota,@ulogTimeZone,@ulogUsageDateTime,@uLogCreateDate, @ulogQID, @threadID)

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
