ALTER PROCEDURE spGetQuestion
	@idForm int

AS

	BEGIN TRANSACTION
		SELECT 
			idQuestion, question
		FROM 
			Questions
		WHERE 
			fkForm = @idForm

	COMMIT TRANSACTION

--EXEC PROCEDURE spGetQuestion 1