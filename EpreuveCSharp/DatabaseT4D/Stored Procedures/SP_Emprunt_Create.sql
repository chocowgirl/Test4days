CREATE PROCEDURE [dbo].[SP_Emprunt_Create]
	@date_lent DATE NULL,
	@gamecopy_id UNIQUEIDENTIFIER,
	@borrower_id UNIQUEIDENTIFIER,
	@lender_id UNIQUEIDENTIFIER
AS
BEGIN 

    IF @date_lent IS NULL
    BEGIN
        SET @date_lent = CAST(GETDATE() AS DATE)
    END

	INSERT INTO [Emprunt] ([Date_Lent],[GameCopy_Id],[Borrower_Id],[Lender_Id])
	OUTPUT [inserted].[Emprunt_Id]
	VALUES (@date_lent, @gamecopy_id, @borrower_id, @lender_id)
END
