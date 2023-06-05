ALTER PROCEDURE spGetForm (
	@title VARCHAR(256)
)
AS
	IF @title IS NULL
	BEGIN
		SELECT
			idForm,
			Title
		FROM
			Form
	END
	ELSE
	BEGIN
		SELECT
			idForm,
			title
		FROM
			Form
		WHERE
			title LIKE '%@title%'
	END

--EXEC spGetForm NULL
--SELECT * FROM Form