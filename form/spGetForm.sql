ALTER PROCEDURE spGetForm (
	@title VARCHAR(128),
	@isAlive bit
)
AS
	IF @title IS NULL
	BEGIN
		SELECT
			idForm,
			Title
		FROM
			Form
		WHERE
			isAlive = @isAlive
	END
	ELSE
	BEGIN
		SELECT
			idForm,
			title
		FROM
			Form
		WHERE
			title LIKE CONCAT('%',@title,'%') AND isAlive = @isAlive
	END

--EXEC spGetForm NULL,1
--EXEC spGetForm 'akses' ,0
--SELECT * FROM Form