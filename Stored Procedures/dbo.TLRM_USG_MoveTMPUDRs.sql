SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





/*

	SELECT COUNT(*) FROM TLRM_USG_UDRs_TMP
	SELECT COUNT(*) FROM TLRM_USG_UDRs
*/

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_USG_MoveTMPUDRs]	
	@threadID int = NULL
AS
BEGIN

	SET NOCOUNT ON

	BEGIN TRY
		BEGIN TRANSACTION

		IF @threadID IS NULL
			BEGIN
				SET @threadID = (ABS(CHECKSUM(NewId())) % 40) + 1
			END 

		;WITH ULOG AS
		(
			SELECT        TOP (500) *
			FROM            TLRM_USG_UDRs_TMP WITH (NOLOCK)
			WHERE udrStatusID = 200 AND threadID = @threadID
			ORDER BY udrID
		)
		DELETE FROM ULOG
		OUTPUT
			DELETED.udrStatusID,
			DELETED.udrStatusDate,
			DELETED.udrFileID,
			DELETED.orderProductID,
			DELETED.udrSubscriberID,
			DELETED.udrIP,
			DELETED.udrSVID,
			DELETED.udrNetworkElement,
			DELETED.udrServiceStartTime,
			DELETED.udrServiceEndTime,
			DELETED.applicationTypeID,
			DELETED.udrRxBytes,
			DELETED.udrTxBytes, 
			DELETED.productID,
			DELETED.cellularDeviceIMEI,
			DELETED.countryID,
			DELETED.udrVersion,
			DELETED.udrAttA,
			DELETED.udrAttB,
			DELETED.udrAttC,
			DELETED.atUsageKey,
			DELETED.udrCreatedate
		INTO dbo.TLRM_USG_UDRs
	
		IF EXISTS(SELECT TOP 1 udrID FROM TLRM_USG_UDRs_TMP WITH(NOLOCK) WHERE udrStatusID = 200  AND threadID = @threadID)
			BEGIN
				SELECT CAST(1 AS bit)
			END
		ELSE
			BEGIN
				SELECT CAST(0 AS bit)
			END	
		
		COMMIT TRANSACTION

	END TRY
	BEGIN CATCH	

		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION

		SELECT CAST(1 AS bit)

	END CATCH;

	

	
END
GO
