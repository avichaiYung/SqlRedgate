SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


/*

TLRM_DW_GetInternalOrders_Usage
	@InternalOrderID int

*/

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_DW_OP_GetTotalUsage]
	@orderProductID int,
	@InternalOrderID int

AS
BEGIN


	
DECLARE	
	@sqlStr nvarchar(MAX),
	@paramList nvarchar(MAX)

	SET @sqlStr = '	SELECT ISNULL(SUM(CASE WHEN usageWebbingSIM = 1 THEN 0 ELSE usageQuota END), 0) AS TotalWebbingUsage, 
			ISNULL(SUM(CASE WHEN usageWebbingSIM = 0 THEN usageQuota ELSE 0 END), 0) AS TotalHSUsage, 
			ISNULL(SUM(TLRM_USG_Usage.usageQuota), 0) AS TotalUsage,
			COUNT(DISTINCT CASE WHEN TLRM_USG_Usage.usageWebbingSIM = 1 THEN TLRM_USG_Usage.usageDate END) AS TotalWebbingUsageDays, 
			COUNT(DISTINCT CASE WHEN TLRM_USG_Usage.usageWebbingSIM = 1 THEN TLRM_USG_Usage.usageDate END) AS TotalHSUsageDays, 
			COUNT(DISTINCT TLRM_USG_Usage.usageDate) AS TotalUsageDays
			FROM TLRM_USG_Usage 
			WHERE TLRM_USG_Usage.orderProductID = @orderProductID'
	
	IF @InternalOrderID IS NOT NULL
		BEGIN
			SET @sqlStr = @sqlStr + ' AND TLRM_USG_Usage.InternalOrderID = @InternalOrderID'
		END		

	SET @paramList = '
					@orderProductID int,
					@InternalOrderID int
					'

	--PRINT @sqlStr

	EXEC sp_executesql @sqlStr, @paramList, @orderProductID, @InternalOrderID

END









GO
