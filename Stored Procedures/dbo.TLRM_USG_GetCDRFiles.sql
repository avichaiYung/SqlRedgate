SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


/*
TLRM_ORD_GetCDRFiles
	NULL,	--@cdrFileID int,
	NULL,	--@cdrFileStatusID int,
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
CREATE PROCEDURE [dbo].[TLRM_USG_GetCDRFiles]
	@cdrFileID int,
	@cdrFileStatusID int,
	@FromDate datetime,
	@ToDate datetime,
	@PageSize int,
	@PageNumber int

AS
BEGIN
DECLARE	
	@sqlStr nvarchar(MAX),
	@paramList nvarchar(MAX)

	SET @sqlStr = 'SELECT        cdrFileID, cdrFilePath, cdrFileStatusID, cdrFileStatusDate, cdrFileSize, threadID, cdrFileCreateDate, TotalRows = COUNT(*) OVER()
					FROM            TLRM_USG_CDRFiles
					WHERE cdrFileIsDeleted = 0 '


	IF @cdrFileID IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' AND (cdrFileID = @cdrFileID) '
		END	

	IF @cdrFileStatusID IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' AND (cdrFileStatusID = @cdrFileStatusID) '
		END	

	IF @FromDate IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' AND cdrFileCreateDate >= @FromDate '
		END		
		
	IF @ToDate IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' AND cdrFileCreateDate < @ToDate '
		END				

	SET @sqlStr = @sqlStr + ' ORDER BY cdrFileCreateDate DESC '

	IF @Pagesize IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' OFFSET     (@PageNumber-1) * @Pagesize ROWS
										FETCH NEXT @PageSize ROWS ONLY
										'
		END

	SET @paramList = '
					@cdrFileID int,
					@cdrFileStatusID int,
					@FromDate datetime,
					@ToDate datetime,
					@PageSize int,
					@PageNumber int
					'

	--PRINT @sqlStr
					
	EXEC sp_executesql @sqlStr, @paramList, @cdrFileID, @cdrFileStatusID, @FromDate, @ToDate, @PageSize, @PageNumber
	
END










GO
