CREATE PROCEDURE [dbo].[SP_Emprunt_Update]
	@emprunt_id INT,
	@date_returned DATE NULL,
	@eval_by_lender INT NULL,
	@eval_by_borrower INT NULL
	
AS
BEGIN
	UPDATE [Emprunt]
		SET	[Date_Returned] = @date_returned,
			[Eval_By_Lender] = @eval_by_lender,
			[Eval_By_Borrower] = @eval_by_borrower
		WHERE [Emprunt_Id] = @emprunt_id
END
