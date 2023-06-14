ALTER PROCEDURE spGetQuestion
	@idForm int,
	@isAlive bit
AS

	SELECT 
		idQuestion, question
	FROM 
		Questions
	WHERE 
		fkForm = @idForm AND isAlive = @isAlive


--EXEC spGetQuestion 1,1