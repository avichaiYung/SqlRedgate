SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



/*

TLRM_USG_GetUsageLogLog
	NULL,	--@ulogID bigint,
	NULL,	--@customerID int,
	NULL,	--@branchID int,
	NULL,	--@orderID int,
	NULL,	--@orderProductID int,
	NULL,	--@productID int,
	NULL,	--@ulogDeviceID int,
	NULL,	--@ulogSIMDeviceID int,
	NULL,	--@carrierID int,
	'1',	--@ulogStatusIDs varchar(250),
	'2/9/2005 8:00',	--@FromDate datetime,
	NULL,	--@ToDate datetime,
	100,	--@Pagesize int,
	1	--@PageNumber int

*/

	


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_USG_GetUsageLogLog]
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
	@sqlStrWHERE nvarchar(MAX),
	@paramList nvarchar(MAX),
	@RoamingWhereSTR nvarchar(250),
	@TotalRows int

	SET @sqlStrWHERE = ''

	IF @ulogID IS NOT NULL
		BEGIN
			SET @sqlStrWHERE = @sqlStrWHERE + ' AND ulogID = @ulogID '
		END

	IF @customerID IS NOT NULL
		BEGIN
			SET @sqlStrWHERE = @sqlStrWHERE + ' AND customerID = @customerID '
		END
		
	IF @branchID IS NOT NULL
		BEGIN
			SET @sqlStrWHERE = @sqlStrWHERE + ' AND branchID = @branchID '
		END

	IF @orderID IS NOT NULL
		BEGIN
			SET @sqlStrWHERE = @sqlStrWHERE + ' AND orderID = @orderID '
		END
		
	IF @orderProductID IS NOT NULL
		BEGIN
			SET @sqlStrWHERE = @sqlStrWHERE + ' AND orderProductID = @orderProductID '							
		END
		
	IF @productID IS NOT NULL
		BEGIN
			SET @sqlStrWHERE = @sqlStrWHERE + ' AND productID = @productID '							
		END		
		
	IF @ulogDeviceID IS NOT NULL
		BEGIN
			SET @sqlStrWHERE = @sqlStrWHERE + ' AND ulogDeviceID = @ulogDeviceID '
		END
		
	IF @ulogSIMDeviceID IS NOT NULL
		BEGIN
			SET @sqlStrWHERE = @sqlStrWHERE + ' AND ulogSIMDeviceID = @ulogSIMDeviceID '
		END
		
	IF @carrierID IS NOT NULL
		BEGIN
			SET @sqlStrWHERE = @sqlStrWHERE + ' AND carrierID = @carrierID '
		END	
		
	IF @ulogStatusIDs IS NOT NULL
		BEGIN
			SET @sqlStrWHERE = @sqlStrWHERE + ' AND ulogStatusID IN (' + @ulogStatusIDs + ') '
		END							
																					
	IF @FromDate IS NOT NULL
		BEGIN
			SET @sqlStrWHERE = @sqlStrWHERE + ' AND ulogUsageDateTime >= @FromDate '
		END		
		
	IF @ToDate IS NOT NULL
		BEGIN
			SET @sqlStrWHERE = @sqlStrWHERE + ' AND ulogUsageDateTime < @ToDate '
		END	

	SET @sqlStr = 'SELECT @TotalRows = COUNT(*) FROM TLRM_USG_UsageLog WHERE     (1 = 1) ' +  @sqlStrWHERE

	SET @sqlStr = @sqlStr + ';WITH ul AS (SELECT        ulogID, TotalRows = COUNT(*) OVER()
					FROM            TLRM_USG_UsageLog --WITH (INDEX([NonClusteredIndex-20140528-144419]))
					WHERE     (1 = 1) ' --(ulogStatusID = 1)

			

	SET @sqlStr = @sqlStr + @sqlStrWHERE

	IF @Pagesize IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' ORDER BY ulogID DESC
										OFFSET     (@PageNumber-1) * @Pagesize ROWS
										FETCH NEXT @PageSize ROWS ONLY
									'
		END

	SET @sqlStr = @sqlStr + ') 
						SELECT TLRM_USG_UsageLog.ulogID , TLRM_USG_UsageLog.ulogStatusID, TLRM_USG_UsageLog.ulogStatusDate, TLRM_USG_UsageLog.ulogIP, TLRM_USG_UsageLog.ulogIMEI, TLRM_USG_UsageLog.ulogMACAddress, TLRM_USG_UsageLog.ulogICCID, TLRM_USG_UsageLog.ulogMSISDN, TLRM_USG_UsageLog.ulogIMSI, TLRM_USG_UsageLog.reportEventID, TLRM_USG_UsageLog.ulogFirmwareVersion, TLRM_USG_UsageLog.ulogMCC, TLRM_USG_UsageLog.ulogMNC, TLRM_USG_UsageLog.ulogApplianceID, TLRM_USG_UsageLog.ulogNetwork, TLRM_USG_UsageLog.nsmID, 
                         TLRM_USG_UsageLog.ctypeID, TLRM_USG_UsageLog.ulogSS, TLRM_USG_UsageLog.ulogBatLevel, TLRM_USG_UsageLog.ulogTotalDevices, TLRM_USG_UsageLog.batteryChrgID, TLRM_USG_UsageLog.ulogSSID, TLRM_USG_UsageLog.ulogMF30Ver, TLRM_USG_UsageLog.ulogMF60Ver, TLRM_USG_UsageLog.ulogCellid, TLRM_USG_UsageLog.quotaTypeID, TLRM_USG_UsageLog.ulogQuota, TLRM_USG_UsageLog.ulogTimeZone, TLRM_USG_UsageLog.ulogUsageDateTime, TLRM_USG_UsageLog.customerID, TLRM_USG_UsageLog.orderID, 
                         TLRM_USG_UsageLog.orderNumber, TLRM_USG_UsageLog.orderProductID, TLRM_USG_UsageLog.productID, TLRM_USG_UsageLog.orderUsageTypeID, TLRM_USG_UsageLog.ulogIsRoaming, TLRM_USG_UsageLog.countryID, TLRM_USG_UsageLog.carrierID, TLRM_USG_UsageLog.ulogDeviceID, TLRM_USG_UsageLog.ulogDeviceNumber, TLRM_USG_UsageLog.ulogSIMDeviceID, TLRM_USG_UsageLog.ulogSIMDeviceNumber, TLRM_USG_UsageLog.usageWebbingSIM, TLRM_USG_UsageLog.usageKey, 
                         TLRM_USG_UsageLog.uLogCreateDate, TLRM_USG_UsageLog.ulogQID, TLRM_USG_UsageLog.InternalOrderID, TLRM_USG_UsageLog.accountID, TLRM_USG_UsageLog.branchID, @TotalRows AS TotalRows
						FROM 	ul INNER JOIN	TLRM_USG_UsageLog	 ON ul.ulogID = TLRM_USG_UsageLog.ulogID
						ORDER BY ulogID DESC	'

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
					@PageNumber int,
					@TotalRows int
					'

	--PRINT @sqlStr

	EXEC sp_executesql @sqlStr, @paramList, @customerID, @branchID, @orderID, @orderProductID, @productID, @ulogDeviceID, @ulogSIMDeviceID, @carrierID, @ulogStatusIDs, @FromDate, @ToDate, @PageSize, @PageNumber, @TotalRows

END




GO
