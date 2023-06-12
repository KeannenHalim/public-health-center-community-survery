ALTER PROCEDURE spDeleteForm
	@idForm int

AS
	UPDATE
		Form
	SET
		isAlive = 0
	WHERE
		idForm = @idForm

EXEC spDeleteForm 1