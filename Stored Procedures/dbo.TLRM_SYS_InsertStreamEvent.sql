SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- =============================================
-- Author:		Yaniv
-- Create date: 25/03/2020
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_SYS_InsertStreamEvent]
@streamEventVersion	int = 0,
@networkEventTypeID	int = 0,
@networkEventStatusID int = 0,
@subscriberID int = 0, 
	@sdID int = 0,
@customerID int = 0,
	@streamEventSVData	varchar(MAX) = '',
	@streamEventName varchar(50), 
	@streamEventPartitionKey varchar(50),
	@streamEventData nvarchar(max),
	@countryID int = 0,
	@vplmnID int,

@streamEventMCCMNC	varchar(50) = '',
@streamEventAPN	varchar(50) = '',
	@streamEventIMSI varchar(50),
	@streamEventICCID varchar(50),
@streamEventIMEI varchar(50) = '',
@streamEventAssignedIP varchar(50) = '',
@streamEventLocationInfo varchar(500) = '',
	@deviceID int,
	@streamEventIMSIServiceProviderID int,
	@streamEventDateTime datetime,
		@streamEventCreateDate datetime


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @threadid int
	SET @threadid = ((ABS(CHECKSUM(NewId())) % 5) + 1) 


	INSERT INTO TLRM_SYS_StreamEvents
							 (threadID, streamEventVersion, networkEventTypeID, networkEventStatusID, subscriberID, sdID, customerID, streamEventSVData, streamEventName, streamEventPartitionKey, streamEventData, 
							 countryID, vplmnID, streamEventMCCMNC, streamEventAPN, streamEventIMSI, streamEventICCID, streamEventIMEI, streamEventAssignedIP, streamEventLocationInfo, deviceID, streamEventIMSIServiceProviderID, 
							 streamEventDateTime, streamEventCreateDate)
	VALUES        (@threadid,@streamEventVersion,@networkEventTypeID,@networkEventStatusID,@subscriberID,@sdID,@customerID,@streamEventSVData,@streamEventName,@streamEventPartitionKey,@streamEventData,@countryID,@vplmnID,@streamEventMCCMNC,@streamEventAPN,@streamEventIMSI,@streamEventICCID,@streamEventIMEI,@streamEventAssignedIP,@streamEventLocationInfo,@deviceID,@streamEventIMSIServiceProviderID,@streamEventDateTime,@streamEventCreateDate)

	IF(@@IDENTITY > 0)
		BEGIN
			SELECT CAST(@@IDENTITY AS int)
		END
	ELSE
		BEGIN
			SELECT 0
		END
END


GO
