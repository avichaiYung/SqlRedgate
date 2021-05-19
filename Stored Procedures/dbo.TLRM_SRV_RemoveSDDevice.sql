SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO









-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_SRV_RemoveSDDevice]
	@sdID int,
	@deviceID int,
	@internalOrderID int
AS
BEGIN

	BEGIN TRY	
		
		BEGIN TRANSACTION	
					
			IF @deviceID IS NOT NULL AND @deviceID > 0
				BEGIN
					UPDATE       TLRM_SRV_ServiceDevices
					SET                deviceID = 0, deviceSerial = '', deviceTypeID = 0, deviceSetID = 0, deviceIDNumber = ''
					WHERE        (sdID = @sdID)

					UPDATE TLRM_INV_Devices 
					SET orderProductID = 0
					WHERE deviceID = @deviceID OR deviceContainerDeviceID = @deviceID

					IF @internalOrderID IS NOT NULL
						BEGIN
							UPDATE TLRM_ORD_InternalOrders SET deviceID = 0 WHERE orderID = @internalOrderID
						END

					SELECT CAST(1 AS bit)
				END						
			ELSE
				BEGIN
					SELECT CAST(0 AS bit) 
				END			
							
		COMMIT TRAN -- Transaction Success!

	END TRY
	BEGIN CATCH

		IF @@TRANCOUNT > 0
			BEGIN
				ROLLBACK TRAN --RollBack in case of Error
			END

		SELECT CAST(0 AS bit)  

	END CATCH

END









GO
