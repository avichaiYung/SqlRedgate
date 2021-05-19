SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO









-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_SRV_SetSDDevice]
	@sdID int,
	@deviceID int,
	@deviceSerial varchar(250),
	@deviceTypeID int,
	@deviceSetID int,
	@deviceIDNumber varchar(250),
	@internalOrderID int
AS
BEGIN

	BEGIN TRY	
		
		BEGIN TRANSACTION				
			IF @deviceID IS NOT NULL AND @deviceID > 0
				BEGIN

					UPDATE       TLRM_SRV_ServiceDevices
					SET                deviceID = @deviceID, deviceSerial = @deviceSerial, deviceTypeID = @deviceTypeID, deviceSetID = @deviceSetID, deviceIDNumber = @deviceIDNumber
					WHERE        (sdID = @sdID)

					UPDATE TLRM_INV_Devices 
					SET orderProductID = @sdID
					WHERE deviceID = @deviceID OR deviceContainerDeviceID = @deviceID

					IF @internalOrderID IS NOT NULL
						BEGIN
							UPDATE TLRM_ORD_InternalOrders SET deviceID = @deviceID WHERE orderID = @internalOrderID
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
