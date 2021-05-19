SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


/*
TLRM_USG_GetCDRsForComplete 1

SELECT threadID, cdrStatusID, COUNT(*)
FROM TLRM_USG_CDRs_TMP
GROUP BY threadID, cdrStatusID

SELECT COUNT(*), GETDATE() FROM TLRM_USG_CDRs_TMP

1439133	2020-04-12 10:09:38.820

DECLARE 
	@startDate datetime = '2020-04-12 10:35:10.973',
	@startCount int = 1451382,
	@endDate datetime,
	@endCount int

SELECT @endCount = COUNT(*), @endDate = GETDATE() FROM TLRM_USG_CDRs_TMP

SELECT @endCount, @endDate, (@startCount - @endCount), DATEDIFF(second, @startDate, @endDate) , (@startCount - @endCount) / DATEDIFF(second, @startDate, @endDate) 

TLRM_USG_GetCDRsForComplete 1
*/

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_USG_GetCDRsForComplete]
	@threadID int
AS
BEGIN

	SELECT * 
	FROM TLRM_USG_CDRs_TMP WITH (NOLOCK)
	WHERE cdrID IN
	(
		SELECT        TOP (500) cdrID
		FROM            TLRM_USG_CDRs_TMP WITH (NOLOCK) --WITH (INDEX([NonClusteredIndex-20160812-142358]))
		WHERE cdrStatusID = 100 AND threadID = @threadID
		--ORDER BY cdrIMSI
	) 
	ORDER BY sdID


END







GO
