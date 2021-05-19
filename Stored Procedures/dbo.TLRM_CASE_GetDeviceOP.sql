SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
TLRM_CASE_GetDeviceOP
171885, --@deviceID int,
431174		--@customerID int

SELECT deviceID FROM TLRM_INV_Devices WHERE deviceSKU = 'RZTE171885'

SELECT * FROM TLRM_ORD_OrderProductSTatuses

*/


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_CASE_GetDeviceOP]
	@deviceID int,
	@customerID int

AS
BEGIN

	SELECT        TLRM_SRV_ServiceDevices.sdID, TLRM_SRV_ServiceDevices.sdStatusID
	FROM            TLRM_SRV_ServiceDevices 
	WHERE TLRM_SRV_ServiceDevices.customerID = @customerID AND 
			TLRM_SRV_ServiceDevices.deviceID = @deviceID AND
			TLRM_SRV_ServiceDevices.sdStatusID IN (2,3,4,5)

		
END










GO
