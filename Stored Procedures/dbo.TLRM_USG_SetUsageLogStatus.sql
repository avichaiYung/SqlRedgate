SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO












-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_USG_SetUsageLogStatus]
	@ulogID bigint,
	@ulogStatusID int,
	@ulogStatusDate datetime
						  
AS
BEGIN

	UPDATE    TLRM_USG_UsageLog
	SET              ulogStatusID = @ulogStatusID, ulogStatusDate = @ulogStatusDate
	WHERE     (ulogID = @ulogID)
	
	IF(@@ROWCOUNT > 0)
		BEGIN
			SELECT @ulogID
		END
	ELSE
		BEGIN
			SELECT 0
		END


END











GO
