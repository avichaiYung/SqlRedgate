SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO











-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_USG_CompleteUDR]
	@udrID bigint,
	@udrStatusID int,
	@udrStatusDate datetime
						  
AS
BEGIN

	UPDATE       TLRM_USG_UDRs_TMP
	SET                udrStatusID = @udrStatusID, udrStatusDate = @udrStatusDate
	WHERE        (udrID = @udrID)
	
	IF(@@ROWCOUNT > 0)
		BEGIN
			SELECT @udrID
		END
	ELSE
		BEGIN
			SELECT 0
		END


END










GO
