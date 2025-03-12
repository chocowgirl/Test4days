CREATE PROCEDURE [dbo].[SP_GameCopy_Disown]
    @copy_id UNIQUEIDENTIFIER,
    @user_owner_id UNIQUEIDENTIFIER
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [GameCopy]
    SET [Is_Owned] = 0
    WHERE [Copy_Id] = @copy_id AND [UserOwner_Id] = @user_owner_id;

    IF @@ROWCOUNT = 0
        PRINT 'No records updated. Either the Copy_Id does not exist or it does not belong to the specified user.';
    ELSE
        PRINT 'GameCopy ownership status updated successfully.';
END
