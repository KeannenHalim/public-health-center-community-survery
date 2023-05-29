ALTER PROCEDURE spChangeQuestion
	@idUser int,
	@idQuestion int,
	@newQuestion varchar(256)
AS
	DECLARE
		@oldQuestion varchar(256)

	SELECT
		@oldQuestion = question
	FROM
		Questions
	WHERE
		idQuestion = @idQuestion

	BEGIN TRANSACTION
		
		INSERT INTO LogChangeQuestions (prevValue, [timeStamp], fkUser, fkQuestions)
		VALUES (@oldQuestion, GETDATE(), @idUser, @idQuestion)


		UPDATE Questions
		SET
			question = @newQuestion
		WHERE
			idQuestion = @idQuestion

	COMMIT TRANSACTION