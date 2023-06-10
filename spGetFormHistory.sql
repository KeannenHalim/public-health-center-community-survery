CREATE PROCEDURE spGetFormHistory
	@idForm INT,
	@timestampStart DATETIME,
	@timestampEnd DATETIME
AS
	IF (@timestampStart IS NULL AND @timestampEnd IS NULL)
	BEGIN
		SELECT
			[timeStamp],
			prevValue,
			username
		FROM
			LogChangeForm
			INNER JOIN Users
				ON LogChangeForm.fkUser=Users.idUser
		WHERE
			fkForm=@idForm
	END
	ELSE
	BEGIN
		SELECT
			[timeStamp],
			prevValue,
			username
		FROM
			LogChangeForm INNER JOIN Users
				ON LogChangeForm.fkUser=Users.idUser
		WHERE
			fkForm=@idForm
			AND [timeStamp]>=@timestampStart 
			AND [timeStamp]<=@timestampEnd
	END

--EXEC spGetFormHistory 1, NULL, NULL
--EXEC spGetFormHistory 1, '2023-06-10 17:35:27.307', '2023-06-10 17:35:27.307'