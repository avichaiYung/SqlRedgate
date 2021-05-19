SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*

TLRM_SYS_GetStreamEventsForProcess 1

*/

-- =============================================
-- Author:		Yaniv
-- Create date: 26/03/2020
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_SYS_GetStreamEventsForProcess]
	@threadID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SELECT        TOP (1000) streamEventID, streamEventVersion, threadID, networkEventTypeID, networkEventStatusID, streamEventData, subscriberID, sdID, customerID, streamEventName, streamEventPartitionKey, countryID, vplmnID, 
							 streamEventMCCMNC, streamEventAPN, streamEventIMSI, streamEventICCID, streamEventIMEI, streamEventAssignedIP, streamEventLocationInfo, deviceID, streamEventIMSIServiceProviderID, streamEventSVData, 
							 streamEventDateTime, streamEventCreateDate
	FROM            TLRM_SYS_StreamEvents
	WHERE				threadID = @threadID
END
GO
