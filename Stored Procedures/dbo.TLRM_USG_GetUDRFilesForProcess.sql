SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


/*

*/

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_USG_GetUDRFilesForProcess]
	@threadID int

AS
BEGIN

	SELECT TOP 500        udrFileID, udrFilePath, udrFileStatusID, udrFileStatusDate, udrFileSize, threadID, udrFileCreateDate
	FROM            TLRM_USG_UDRFiles
	WHERE udrFileIsDeleted = 0 AND udrFileStatusID = 100 AND threadID = @threadID
	ORDER BY udrFileID
		
END







GO
