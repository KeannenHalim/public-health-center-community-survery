ALTER PROCEDURE spChangeQuestion
	@idUser int,
	@Questions varchar(MAX)
AS
	DECLARE
		@oldQuestion varchar(250),
		@timestamp datetime,
		@idQuestion INT,
		@newQuestion VARCHAR(250)

	SELECT @timestamp = GETDATE()

	DECLARE curQuest CURSOR
	FOR
	SELECT
		[key],
		[value]
	FROM 
		parseKeyValue(@Questions)

	OPEN curQuest

	FETCH NEXT FROM curQuest INTO
		@idQuestion,
		@newQuestion
	
	WHILE @@FETCH_STATUS=0
	BEGIN
		SELECT
			@oldQuestion = question
		FROM
			Questions
		WHERE
			idQuestion = @idQuestion
			

		BEGIN TRANSACTION
		
		INSERT INTO LogChangeQuestions (prevValue, [timeStamp], fkUser, fkQuestions)
		VALUES (@oldQuestion, @timestamp, @idUser, @idQuestion)

		UPDATE Questions
		SET
			question = @newQuestion
		WHERE
			idQuestion = @idQuestion

		COMMIT TRANSACTION
		
		FETCH NEXT FROM curQuest INTO
		@idQuestion,
		@newQuestion
	END

	CLOSE curQuest
	DEALLOCATE curQuest


-- EXEC spChangeQuestion 1 , '2;Lahir tanggal,1;nama lengkap banget'

-- SELECT *
-- FROM Questions