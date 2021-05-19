SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Yaniv
-- Create date: 2020-12-13
-- Description:	Get x UDR and update their status to "SavingToS3" 
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_USG_GetUDRsForMove] 
AS
BEGIN

	SET NOCOUNT ON

	BEGIN TRY

		BEGIN TRANSACTION

		UPDATE TOP (500) TLRM_USG_UDRs
		SET udrStatusID=300 
		OUTPUT Inserted.*

		COMMIT TRANSACTION

	END TRY
	BEGIN CATCH	

		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION

	END CATCH;
END
GO
