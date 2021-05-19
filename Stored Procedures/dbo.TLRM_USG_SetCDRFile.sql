SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO









-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_USG_SetCDRFile] 
	@cdrFileID int,
	@cdrFilePath varchar(250),
	@cdrFileStatusID int,
	@cdrFileSize float,
	@threadID int,
	@cdrFileStatusDate datetime,
	@cdrFileCreateDate datetime

AS
BEGIN

	IF @cdrFileID IS NOT NULL AND @cdrFileID > 0
		BEGIN
			UPDATE       TLRM_USG_CDRFiles
			SET                cdrFilePath = @cdrFilePath, cdrFileStatusID = @cdrFileStatusID, cdrFileStatusDate = @cdrFileStatusDate, cdrFileSize = @cdrFileSize, threadID = @threadID
			WHERE     (cdrFileID = @cdrFileID)
		END
	ELSE
		BEGIN
			INSERT INTO TLRM_USG_CDRFiles
									 (cdrFilePath, cdrFileStatusID, cdrFileStatusDate, cdrFileSize, threadID, cdrFileCreateDate)
			VALUES        (@cdrFilePath, @cdrFileStatusID, @cdrFileStatusDate, @cdrFileSize, @threadID, @cdrFileCreateDate)

			SET @cdrFileID = CAST(@@IDENTITY AS int)
		END			

	IF(@@ROWCOUNT > 0)
		BEGIN
			SELECT @cdrFileID
		END
	ELSE
		BEGIN
			SELECT 0
		END


END









GO
