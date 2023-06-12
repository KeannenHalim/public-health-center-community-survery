ALTER PROCEDURE spGetQuestion
	@idForm int,
	@isAlive bit
AS
	BEGIN TRANSACTION
		SELECT 
			idQuestion, question
		FROM 
			Questions
		WHERE 
			fkForm = @idForm AND isAlive = @isAlive
	COMMIT TRANSACTION

--EXEC spGetQuestion 1,1