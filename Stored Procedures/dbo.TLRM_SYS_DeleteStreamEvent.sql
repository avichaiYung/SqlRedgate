SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Yaniv
-- Create date: 29/03/2020
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_SYS_DeleteStreamEvent]
	@streamEventID bigint
AS
BEGIN
	DELETE FROM TLRM_SYS_StreamEvents
	WHERE		streamEventID = @streamEventID 

	IF(@@ROWCOUNT > 0)
		BEGIN
			SELECT 1
		END
	ELSE
		BEGIN
			SELECT 0
		END
END
GO
