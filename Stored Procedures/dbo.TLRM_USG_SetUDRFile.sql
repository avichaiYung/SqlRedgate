SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO









-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_USG_SetUDRFile] 
	@udrFileID int,
	@udrFilePath varchar(250),
	@udrFileStatusID int,
	@udrFileSize float,
	@threadID int,
	@udrFileStatusDate datetime,
	@udrFileCreateDate datetime

AS
BEGIN

	IF @udrFileID IS NOT NULL AND @udrFileID > 0
		BEGIN
			UPDATE       TLRM_USG_UDRFiles
			SET                udrFilePath = @udrFilePath, udrFileStatusID = @udrFileStatusID, udrFileStatusDate = @udrFileStatusDate, udrFileSize = @udrFileSize, threadID = @threadID
			WHERE     (udrFileID = @udrFileID)
		END
	ELSE
		BEGIN
			INSERT INTO TLRM_USG_UDRFiles
									 (udrFilePath, udrFileStatusID, udrFileStatusDate, udrFileSize, threadID, udrFileCreateDate)
			VALUES        (@udrFilePath, @udrFileStatusID, @udrFileStatusDate, @udrFileSize, @threadID, @udrFileCreateDate)

			SET @udrFileID = CAST(@@IDENTITY AS int)
		END			

	IF(@@ROWCOUNT > 0)
		BEGIN
			SELECT @udrFileID
		END
	ELSE
		BEGIN
			SELECT 0
		END


END









GO
