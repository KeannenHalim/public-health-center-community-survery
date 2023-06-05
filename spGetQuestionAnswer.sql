ALTER PROCEDURE spGetQuestionAnswer
	--timestampStart/finish = range waktu user mengisi form
	@timestampStart datetime,
	@timestampFinish datetime,
	@idForm int

AS
	DECLARE @tblHasil TABLE(
		--idQuestion int,
		--question varchar(256),
		idAnswer int,
		answer varchar(256)
	)

	DECLARE
		@idAnswerGroup int

	SELECT @idAnswerGroup = idAnswer
	FROM AnswerGroup
	WHERE AnswerGroup.fkForm = @idForm



EXEC spGetQuestionAnswer 