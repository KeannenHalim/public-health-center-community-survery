ALTER PROCEDURE spCreateForm
	@title varchar(256)
AS
	INSERT INTO Form (title, timeStamp, isAlive)
	SELECT
		@title,
		GETDATE(),
		1

	SELECT
		idForm
	FROM
		Form
	WHERE
		title = @title

--EXEC spCreateForm 'test form'
--SELECT * FROM Form
