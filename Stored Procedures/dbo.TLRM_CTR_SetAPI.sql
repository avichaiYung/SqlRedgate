SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_CTR_SetAPI] 
	@apiCTRMethod varchar(250),
    @apiCTRUsername varchar(250),
    @apiCTRIP varchar(250),
    @apiCTRStartDate datetime,
    @apiCTREndDate datetime,
    @apiCTRSuccess bit,
    @apiCTRResponseCode int,
    @apiCTRResponseDescription varchar(250)
AS
BEGIN

	INSERT INTO TLRM_CTR_API
								(apiCTRMethod, apiCTRUsername, apiCTRIP, apiCTRStartDate, apiCTREndDate, apiCTRSuccess, apiCTRResponseCode, apiCTRResponseDescription)
	VALUES        (@apiCTRMethod, @apiCTRUsername, @apiCTRIP, @apiCTRStartDate, @apiCTREndDate, @apiCTRSuccess, @apiCTRResponseCode, @apiCTRResponseDescription)	

	IF(@@ROWCOUNT > 0)
		BEGIN
			SELECT CAST(1 AS bit)
		END
	ELSE
		BEGIN
			SELECT CAST(0 AS bit)
		END


END
GO
