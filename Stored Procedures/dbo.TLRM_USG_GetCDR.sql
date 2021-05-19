SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




/*
TLRM_USG_GetCDR 100
*/

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_USG_GetCDR]
	@cdrID int,
	@cdrFileID int,
	@cdrIMSI varchar(250),
	@cdrAccountingRecordTypeID int,
	@PageSize int,
	@PageNumber int
AS
BEGIN
DECLARE
	@sqlStr nvarchar(MAX),
	@paramList nvarchar(MAX)

	SET @sqlStr = '	SELECT  cdrID, cdrAccountingRecordTypeID, cdrStatusID, cdrStatusDate, cdrFileID, sdID, cdrIMSI, cdrIMEI, cdrIP, cdrNetworkElement, cdrRecordOpeningTime, cdrStartTime, cdrEndTime, 
									cdrUsageUplink, cdrUsageDownlink, productID, countryID, countryName, cdrMCCMNC, cdrSGSNIP, cdrVersion, vplmnID, vplmnName, vplmnTADIGCode, 
									cdrData, atUsageKey, cdrCreatedate, TotalRows = COUNT(*) OVER()
					FROM            TLRM_USG_CDRs
					WHERE        (1 = 1) '

	IF @cdrID IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' AND cdrID = @cdrID'
		END					
		
	IF @cdrFileID IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' AND cdrFileID = @cdrFileID'
		END					
		
	IF @cdrIMSI IS NOT NULL AND @cdrIMSI != ''
		BEGIN
			SET @sqlStr = @sqlStr + ' AND cdrIMSI = @cdrIMSI'
		END					
		
	IF @cdrAccountingRecordTypeID IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' AND cdrAccountingRecordTypeID = @cdrAccountingRecordTypeID'
		END	
		

	SET @sqlStr = @sqlStr + ' ORDER BY cdrID DESC '

	IF @Pagesize IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' OFFSET     (@PageNumber-1) * @Pagesize ROWS
										FETCH NEXT @PageSize ROWS ONLY
										'
		END	

	SET @paramList = '
					@cdrID int,
					@cdrFileID int,
					@cdrIMSI varchar(250),
					@cdrAccountingRecordTypeID int,
					@PageSize int,
					@PageNumber int
					'

	--PRINT @sqlStr

	EXEC sp_executesql @sqlStr, @paramList, @cdrID, @cdrFileID, @cdrIMSI, @cdrAccountingRecordTypeID, @PageSize, @PageNumber
END











GO
