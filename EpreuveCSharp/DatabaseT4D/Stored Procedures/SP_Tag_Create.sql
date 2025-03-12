CREATE PROCEDURE [dbo].[SP_Tag_Create]
	@tag_name VARCHAR(50)
AS
BEGIN
	INSERT INTO [Tag] ([Tag_Name])
		OUTPUT [inserted].[Tag_Name]
		VALUES
			(@tag_name);
END
