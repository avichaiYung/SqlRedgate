SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Yaniv
-- Create date: 2020-12-06
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_USG_DeleteSavedUDRs] 
AS
BEGIN

	SET NOCOUNT ON

	BEGIN TRY
		BEGIN TRANSACTION

		--;WITH USG_UDRs AS
		--(
		--	SELECT  TOP (500) *
		--	FROM	TLRM_USG_UDRs WITH (NOLOCK)
		--	WHERE	udrStatusID = 300 
		--)
		--DELETE FROM USG_UDRs

		IF(@@ROWCOUNT > 0)
			BEGIN
				IF EXISTS(SELECT TOP 1 udrID FROM TLRM_USG_UDRs WITH(NOLOCK))
					BEGIN
						SELECT CAST(1 AS bit) AS [Result], CAST(1 AS bit) AS [moreFiles]
					END
				ELSE
					BEGIN
						SELECT CAST(1 AS bit) AS [Result], CAST(0 AS bit) AS [moreFiles]
					END
			END
		ELSE
			BEGIN
				SELECT CAST(1 AS bit) AS [Result], CAST(0 AS bit) AS [moreFiles]
			END

		
		COMMIT TRANSACTION

	END TRY
	BEGIN CATCH	

		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION

		SELECT CAST(0 AS bit) AS [Result], CAST(1 AS bit) AS [moreFiles]

	END CATCH;

END
GO
