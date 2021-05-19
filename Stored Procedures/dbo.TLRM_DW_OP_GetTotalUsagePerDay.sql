SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


/*

SELECT        usageID, usageKey, usageDate, usageYear, usageMonth, usageDay, customerID, orderID, orderNumber, orderProductID, InternalOrderID, productID, carrierID, countryID, usageDateCountry, orderUsageTypeID, 
                         usageDeviceID, usageDeviceNumber, usageIMEI, usageSIMDeviceID, usageSIMDeviceNumber, serviceProfileID, usageIMSI, usageICCID, homeSIMID, quotaTypeID, usageQuota, usageIsRoaming, 
                         usageWebbingSIM, usageUpdateDate, usageCreateDate
FROM            TLRM_USG_Usage

*/

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_DW_OP_GetTotalUsagePerDay]
	@orderProductID int,
	@InternalOrderID int,
	@FromDate datetime,
	@ToDate datetime,
	@PageSize int,
	@PageNumber int

AS
BEGIN


	
DECLARE	
	@sqlStr nvarchar(MAX),
	@paramList nvarchar(MAX)

	SET @sqlStr = '	SELECT TLRM_USG_Usage.usageDate, ISNULL(SUM(CASE WHEN usageWebbingSIM = 1 THEN 0 ELSE usageQuota END), 0) AS TotalWebbingUsage, 
			ISNULL(SUM(CASE WHEN usageWebbingSIM = 0 THEN usageQuota ELSE 0 END), 0) AS TotalHSUsage, 
			ISNULL(SUM(TLRM_USG_Usage.usageQuota), 0) AS TotalUsage,
			COUNT(DISTINCT CASE WHEN TLRM_USG_Usage.usageWebbingSIM = 1 THEN TLRM_USG_Usage.usageDate END) AS TotalWebbingUsageDays, 
			COUNT(DISTINCT CASE WHEN TLRM_USG_Usage.usageWebbingSIM = 1 THEN TLRM_USG_Usage.usageDate END) AS TotalHSUsageDays, 
			COUNT(DISTINCT TLRM_USG_Usage.usageDate) AS TotalUsageDays,
			TotalRows = COUNT(*) OVER()
			FROM TLRM_USG_Usage 
			WHERE TLRM_USG_Usage.orderProductID = @orderProductID'
	
	IF @InternalOrderID IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' AND TLRM_USG_Usage.InternalOrderID = @InternalOrderID'
		END	
		
	IF @FromDate IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' AND TLRM_USG_Usage.usageDate >= @FromDate'
		END
		
	IF @ToDate IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' AND TLRM_USG_Usage.usageDate < @ToDate'
		END	
		
	SET @sqlStr = @sqlStr + ' GROUP BY TLRM_USG_Usage.usageDate '

	SET @sqlStr = @sqlStr + ' ORDER BY TLRM_USG_Usage.usageDate DESC'
	
	IF @Pagesize IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' OFFSET     (@PageNumber-1) * @Pagesize ROWS
										FETCH NEXT @PageSize ROWS ONLY
										'
		END						

	SET @paramList = '
					@orderProductID int,
					@InternalOrderID int,
					@FromDate datetime,
					@ToDate datetime,
					@PageSize int,
					@PageNumber int
					'

	--PRINT @sqlStr

	EXEC sp_executesql @sqlStr, @paramList, @orderProductID, @InternalOrderID, @FromDate, @ToDate, @PageSize, @PageNumber

END









GO
