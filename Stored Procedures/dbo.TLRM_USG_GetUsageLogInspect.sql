SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




--SELECT * FROM TLRM_USG_UsageLog

--EXEC TLRM_USG_GetUsageLogInspect 478


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_USG_GetUsageLogInspect]
	@ulogID bigint

AS
BEGIN
DECLARE
	@customerID int,
	@ulogDeviceID int

	SELECT @customerID = customerID, @ulogDeviceID = ulogDeviceID FROM TLRM_USG_UsageLog WHERE ulogID = @ulogID

	IF @customerID IS NOT NULL AND @ulogDeviceID IS NOT NULL
		BEGIN
			
			SELECT * FROM (
							SELECT TOP 41 * FROM TLRM_USG_UsageLog 
							WHERE ulogDeviceID = @ulogDeviceID AND customerID = @customerID AND ulogID <= @ulogID
							ORDER BY ulogID DESC
							) AS BeforeUsage
			UNION ALL
			SELECT * FROM (
							SELECT TOP 40 * FROM TLRM_USG_UsageLog 
							WHERE ulogDeviceID = @ulogDeviceID AND customerID = @customerID AND ulogID > @ulogID
							ORDER BY ulogID ASC
							) AS AfterUsage
			ORDER BY ulogID DESC
			

		END			
		
END











GO
