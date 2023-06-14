ALTER PROCEDURE spGetQuestionAnswer
	@idAnswerGroup INT,
	@isLatest BIT
AS
	CREATE TABLE #tblQuestions (
		idQuestion INT,
		dataType CHAR,
		question VARCHAR(256)
	)

	CREATE TABLE #tblAnswers (
		fkQuestion INT,
		answer VARCHAR(256),
		[timeStamp] DATETIME
	)

	DECLARE
		@idForm INT

	SELECT
		@idForm = fkForm
	FROM 
		AnswerGroup
	WHERE
		idAnswer = @idAnswerGroup

	INSERT INTO #tblQuestions
		SELECT
			idQuestion,
			dataType,
			question
		FROM
			Questions
		WHERE
			fkForm=@idForm AND isAlive = 1

	INSERT INTO #tblAnswers
		SELECT
			fkQuestion,
			answer,
			[timestamp]
		FROM
			AnswerItemText
		WHERE
			fkAnswerGroup=@idAnswerGroup AND isLatest = @isLatest

	INSERT INTO #tblAnswers
		SELECT
			fkQuestion,
			answer,
			[timestamp]
		FROM
			AnswerItemDate
		WHERE
			fkAnswerGroup=@idAnswerGroup AND isLatest = @isLatest

	INSERT INTO #tblAnswers
		SELECT
			fkQuestion,
			answer,
			[timestamp]
		FROM
			AnswerItemNumeric
		WHERE
			fkAnswerGroup=@idAnswerGroup AND isLatest = @isLatest

	IF @isLatest = 1
	BEGIN
		SELECT
			idQuestion,
			dataType,
			question,
			answer
		FROM
			#tblQuestions LEFT JOIN #tblAnswers
				ON #tblQuestions.idQuestion=#tblAnswers.fkQuestion
	END
	ELSE
	BEGIN
		SELECT
			idQuestion,
			dataType,
			question,
			answer,
			[timeStamp]
		FROM
			#tblQuestions LEFT JOIN #tblAnswers
				ON #tblQuestions.idQuestion=#tblAnswers.fkQuestion
		ORDER BY
			[timeStamp]
	END

-- EXEC spGetQuestionAnswer 1,0