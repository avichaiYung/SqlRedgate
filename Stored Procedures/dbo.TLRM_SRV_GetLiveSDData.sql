SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_SRV_GetLiveSDData]
	@sdID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT sdID, TLRM_SRV_LiveSDData.countryID, TLRM_GLB_Countries.countryName, TLRM_GLB_Countries.countryCode, TLRM_SRV_LiveSDData.vplmnID, TLRM_HLR_VPLMNs.vplmnTADIGCode, TLRM_HLR_VPLMNs.vplmnName, TLRM_HLR_VPLMNs.vplmnMCCMNC, 
			lsdICCID, lsdIMSI, lsdIMEI, lsdIP, lsdLU, lsdLUReject, lsdLUPurge, lsdPDP
	FROM TLRM_SRV_LiveSDData LEFT OUTER JOIN
		TLRM_GLB_Countries ON TLRM_SRV_LiveSDData.countryID = TLRM_GLB_Countries.countryID LEFT OUTER JOIN
		TLRM_HLR_VPLMNs ON TLRM_SRV_LiveSDData.vplmnID = TLRM_HLR_VPLMNs.vplmnID
	WHERE sdID = @sdID
END
GO
