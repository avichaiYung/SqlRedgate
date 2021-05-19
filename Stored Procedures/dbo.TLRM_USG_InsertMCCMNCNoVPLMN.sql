SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:	Yaniv
-- Create date: 27/12/2018
-- Description:	Insert MCCMNC that has no VPLMN. Used in export data to DDB
-- =============================================
CREATE PROCEDURE [dbo].[TLRM_USG_InsertMCCMNCNoVPLMN] 	 
	@MCCMNC varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF NOT EXISTS (SELECT 1 FROM [dbo].[TLRM_USG_MCCMNCNoVPLMN] 
					WHERE [MCCMNC] = @MCCMNC)
	BEGIN
		INSERT INTO [dbo].[TLRM_USG_MCCMNCNoVPLMN]
			([MCCMNC])
		VALUES
			(@MCCMNC)
	END
    
END
GO
