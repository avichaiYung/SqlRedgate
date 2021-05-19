SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


/*
TLRM_ORD_GetUDRFiles
	NULL,	--@udrFileID int,
	NULL,	--@udrFileStatusID int,
	NULL,	--@FromDate datetime,
	NULL,	--@ToDate datetime,
	100,	--@PageSize int,
	1	--@PageNumber int
*/

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_USG_GetUDRFiles]
	@udrFileID int,
	@udrFileStatusID int,
	@FromDate datetime,
	@ToDate datetime,
	@PageSize int,
	@PageNumber int

AS
BEGIN
DECLARE	
	@sqlStr nvarchar(MAX),
	@paramList nvarchar(MAX)

	SET @sqlStr = 'SELECT        udrFileID, udrFilePath, udrFileStatusID, udrFileStatusDate, udrFileSize, threadID, udrFileCreateDate, TotalRows = COUNT(*) OVER()
					FROM            TLRM_USG_UDRFiles
					WHERE udrFileIsDeleted = 0 '


	IF @udrFileID IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' AND (udrFileID = @udrFileID) '
		END	

	IF @udrFileStatusID IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' AND (udrFileStatusID = @udrFileStatusID) '
		END	

	IF @FromDate IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' AND udrFileCreateDate >= @FromDate '
		END		
		
	IF @ToDate IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' AND udrFileCreateDate < @ToDate '
		END				

	SET @sqlStr = @sqlStr + ' ORDER BY udrFileCreateDate DESC '

	IF @Pagesize IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' OFFSET     (@PageNumber-1) * @Pagesize ROWS
										FETCH NEXT @PageSize ROWS ONLY
										'
		END

	SET @paramList = '
					@udrFileID int,
					@udrFileStatusID int,
					@FromDate datetime,
					@ToDate datetime,
					@PageSize int,
					@PageNumber int
					'

	--PRINT @sqlStr
					
	EXEC sp_executesql @sqlStr, @paramList, @udrFileID, @udrFileStatusID, @FromDate, @ToDate, @PageSize, @PageNumber
	
END










GO
