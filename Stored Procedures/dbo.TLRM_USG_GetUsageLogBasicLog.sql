SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


/*

TLRM_USG_GetUsageLogBasicLog
	NULL,	--@ulogID bigint,
	NULL,	--@customerID int,
	NULL,	--@branchID int,
	NULL,	--@orderID int,
	NULL,	--@orderProductID int,
	NULL,	--@productID int,
	NULL,	--@ulogDeviceID int,
	NULL,	--@ulogSIMDeviceID int,
	NULL,	--@carrierID int,
	'1,2',	--@ulogStatusIDs varchar(250),
	'9/21/2016 00:00',	--@FromDate datetime,
	'1/1/2017',	--@ToDate datetime,
	50,	--@Pagesize int,
	1	--@PageNumber int

*/




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_USG_GetUsageLogBasicLog]
	@ulogID bigint,
	@customerID int,
	@branchID int,
	@orderID int,
	@orderProductID int,
	@productID int,
	@ulogDeviceID int,
	@ulogSIMDeviceID int,
	@carrierID int,
	@ulogStatusIDs varchar(250),
	@FromDate datetime,
	@ToDate datetime,
	@PageSize int,
	@PageNumber int


AS
BEGIN
DECLARE	
	@sqlStr nvarchar(MAX),
	@paramList nvarchar(MAX),
	@RoamingWhereSTR nvarchar(250)

	SET @sqlStr = 'SELECT        ulogID, ulogStatusDate, ulogIP, ulogICCID, 
                         ctypeID, ulogSS, ulogBatLevel, ulogTotalDevices, batteryChrgID, ulogSSID, quotaTypeID, ulogQuota, ulogUsageDateTime,  
                         orderProductID, countryID, carrierID,  
                         TotalRows = COUNT(*) OVER()
					FROM            TLRM_USG_UsageLog
					WHERE     (1 = 1)' --(ulogStatusID = 1)

	IF @ulogID IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' AND ulogID = @ulogID '
		END

	IF @customerID IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' AND customerID = @customerID '
		END

	IF @branchID IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' AND branchID = @branchID '
		END

	IF @orderID IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' AND orderID = @orderID '
		END
		
	IF @orderProductID IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' AND orderProductID = @orderProductID '							
		END
		
	IF @productID IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' AND productID = @productID '							
		END		
		
	IF @ulogDeviceID IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' AND ulogDeviceID = @ulogDeviceID '
		END
		
	IF @ulogSIMDeviceID IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' AND ulogSIMDeviceID = @ulogSIMDeviceID '
		END
		
	IF @carrierID IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' AND carrierID = @carrierID '
		END	
		
	IF @ulogStatusIDs IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' AND ulogStatusID IN (' + @ulogStatusIDs + ') '
		END							
																					
	IF @FromDate IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' AND ulogUsageDateTime >= @FromDate '
		END		
		
	IF @ToDate IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' AND ulogUsageDateTime < @ToDate '
		END				

	SET @sqlStr = @sqlStr + ' ORDER BY ulogID DESC '

	IF @Pagesize IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' OFFSET     (@PageNumber-1) * @Pagesize ROWS
										FETCH NEXT @PageSize ROWS ONLY
										'
		END

	SET @paramList = '
					@customerID int,
					@branchID int,
					@orderID int,
					@orderProductID int,
					@productID int,
					@ulogDeviceID int,
					@ulogSIMDeviceID int,
					@carrierID int,
					@ulogStatusIDs varchar(250),
					@FromDate datetime,
					@ToDate datetime,					
					@PageSize int,
					@PageNumber int
					'

	--PRINT @sqlStr

	EXEC sp_executesql @sqlStr, @paramList, @customerID, @branchID, @orderID, @orderProductID, @productID, @ulogDeviceID, @ulogSIMDeviceID, @carrierID, @ulogStatusIDs, @FromDate, @ToDate, @PageSize, @PageNumber

END


GO
