ALTER PROCEDURE spGetQuestionHistory
	@idQuestion INT,
	@timestampStart DATETIME,
	@timestampEnd DATETIME
AS
	IF (@timestampStart IS NULL AND @timestampEnd IS NULL)
	BEGIN
		SELECT
			[timeStamp],
			prevValue,
			username
		FROM
			LogChangeQuestions 
			INNER JOIN Users
				ON LogChangeQuestions.fkUser=Users.idUser
		WHERE
			fkQuestions=@idQuestion
		ORDER BY
			[timeStamp]
	END
	ELSE
	BEGIN
		SELECT
			[timeStamp],
			prevValue,
			username
		FROM
			LogChangeQuestions INNER JOIN Users
				ON LogChangeQuestions.fkUser=Users.idUser
		WHERE
			fkQuestions=@idQuestion
			AND [timeStamp]>=@timestampStart 
			AND [timeStamp]<=@timestampEnd
		ORDER BY
			[timeStamp]
	END

--SELECT * FROM Questions
--SELECT * FROM LogChangeQuestions
--EXEC spChangeQuestion 1 , '8;Penerima Bantuan Langsung Tunai (BLT)?,7;Jumlah gaji diterima per bulan'
--EXEC spChangeQuestion 1 , '8;Apakah keluarga Anda penerima Bantuan Langsung Tunai (BLT)?'

--EXEC spGetQuestionHistory 8, NULL, NULL
--EXEC spGetQuestionHistory 8, '2023-06-10 17:18:10.720', '2023-06-10 17:18:10.720'