ALTER PROCEDURE spDeleteForm
	@idForm int

AS
	BEGIN TRANSACTION
		UPDATE
			Form
		SET
			isAlive = 0
		WHERE
			idForm = @idForm
	COMMIT TRANSACTION

-- EXEC spDeleteForm 1