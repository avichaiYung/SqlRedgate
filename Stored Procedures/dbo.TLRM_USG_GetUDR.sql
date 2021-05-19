SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





/*
TLRM_USG_GetUDR 100
*/

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_USG_GetUDR]
	@udrID int

AS
BEGIN

	SELECT        udrID, udrStatusID, udrStatusDate, udrFileID, orderProductID, udrSubscriberID, udrIP, udrSVID, udrNetworkElement, udrServiceStartTime, udrServiceEndTime, applicationTypeID, udrRxBytes, udrTxBytes, 
							 productID, cellularDeviceIMEI, countryID, udrVersion, udrAttA, udrAttB, udrAttC, atUsageKey, udrCreatedate
	FROM            TLRM_USG_UDRs
	WHERE        (udrID = @udrID)
			
END












GO
