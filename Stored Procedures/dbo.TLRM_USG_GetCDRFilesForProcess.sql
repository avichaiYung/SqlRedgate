SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


/*
[TLRM_USG_GetCDRFilesForProcess] 1
*/

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_USG_GetCDRFilesForProcess]
	@threadID int

AS
BEGIN

	SELECT TOP 100        cdrFileID, cdrFilePath, cdrFileStatusID, cdrFileStatusDate, cdrFileSize, threadID, cdrFileCreateDate
	FROM            TLRM_USG_CDRFiles
	WHERE cdrFileIsDeleted = 0 AND cdrFileStatusID = 100 AND threadID = @threadID
	ORDER BY cdrFileID DESC
		
END







GO
