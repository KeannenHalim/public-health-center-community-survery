ALTER PROCEDURE spGetAnswerGroup
	@idForm INT,
	@timestampStart DATETIME,
    @timestampEnd DATETIME
AS
	DECLARE
		@currIdAnswerGroup INT

	DECLARE curAnswerGroup CURSOR
	FOR
		SELECT
			AnswerGroup.idAnswer
		FROM
			AnswerGroup
		WHERE
			fkForm=@idForm
			AND AnswerGroup.[timeStamp]>=@timestampStart
			AND AnswerGroup.[timeStamp]<=@timestampEnd

	OPEN curAnswerGroup

	FETCH NEXT FROM curAnswerGroup 
	INTO
		@currIdAnswerGroup

	WHILE @@FETCH_STATUS=0
	BEGIN
		EXEC spGetQuestionAnswer @idForm, @currIdAnswerGroup

		FETCH NEXT FROM curAnswerGroup
		INTO
			@currIdAnswerGroup
	END

	CLOSE curAnswerGroup
	DEALLOCATE curAnswerGroup

EXEC spGetAnswerGroup 1, '2023-06-06 12:36:28.590', '2023-06-06 12:37:28.590'

--SELECT * FROM AnswerGroup