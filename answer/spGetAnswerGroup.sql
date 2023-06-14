ALTER PROCEDURE spGetAnswerGroup
	@idForm INT,
	@timestampStart DATETIME,
    @timestampEnd DATETIME
AS
	SELECT
		AnswerGroup.idAnswer,
		AnswerGroup.[timeStamp]
	FROM
		AnswerGroup
	WHERE
		fkForm=@idForm
		AND AnswerGroup.[timeStamp]>=@timestampStart
		AND AnswerGroup.[timeStamp]<=@timestampEnd
	ORDER BY
		AnswerGroup.[timeStamp]


-- EXEC spGetAnswerGroup 1, '2023-06-04 12:36:28', '2023-06-09 12:37:28'

--SELECT * FROM AnswerGroup