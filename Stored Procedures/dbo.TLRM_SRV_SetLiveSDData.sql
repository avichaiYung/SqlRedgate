SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_SRV_SetLiveSDData]
	@sdID int,
	@countryID int,
	@vplmnID int,
	@lsdICCID varchar(250),
	@lsdIMSI varchar(250),
	@lsdIMEI varchar(250),
	@lsdIP varchar(250),
	@lsdLU datetime,
	@lsdLUReject datetime,
	@lsdLUPurge datetime,
	@lsdPDP datetime
AS
BEGIN

	UPDATE       TLRM_SRV_LiveSDData
	SET         countryID =  ISNULL(@countryID, countryID), vplmnID = ISNULL(@vplmnID, vplmnID), lsdICCID = ISNULL(@lsdICCID, lsdICCID), lsdIMSI = ISNULL(@lsdIMSI, lsdIMSI), 
				lsdIMEI = ISNULL(@lsdIMEI, lsdIMEI), lsdIP = ISNULL(@lsdIP, lsdIP), lsdLU = ISNULL(@lsdLU, lsdLU), lsdLUReject = ISNULL(@lsdLUReject, lsdLUReject), 
				lsdLUPurge = ISNULL(@lsdLUPurge, lsdLUPurge), lsdPDP = ISNULL(@lsdPDP, lsdPDP)
	WHERE     (sdID = @sdID)

	IF(@@ROWCOUNT > 0)
		BEGIN
			SELECT CAST(1 AS BIT)			
		END
	ELSE
		BEGIN
			INSERT INTO TLRM_SRV_LiveSDData
									 (sdID, countryID, vplmnID, lsdICCID, lsdIMSI, lsdIMEI, lsdIP, lsdLU, lsdLUReject, lsdLUPurge, lsdPDP)
			VALUES        (@sdID, @countryID, @vplmnID, @lsdICCID, @lsdIMSI, @lsdIMEI, @lsdIP, @lsdLU, @lsdLUReject, @lsdLUPurge, @lsdPDP)

			IF(@@ROWCOUNT > 0)
				BEGIN
					SELECT CAST(1 AS BIT)
				END
			ELSE
				BEGIN
					SELECT CAST(0 AS BIT)
				END
		END

	
END
GO
