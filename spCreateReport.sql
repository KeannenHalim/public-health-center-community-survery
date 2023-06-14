ALTER PROCEDURE spCreateReport
    @idForm INT,
    @filter NVARCHAR(1000),
    @agregat NVARCHAR(1000)
AS
    DECLARE 
        @columnNumeric NVARCHAR(256),
        @columnDate NVARCHAR(256),
        @columnText NVARCHAR(256),
        @guid1 NVARCHAR(2000),
        @queryText NVARCHAR(4000),
        @currCol VARCHAR(4)

    SET @columnNumeric = ''
    SET @columnDate = ''
    SET @columnText = ''

	BEGIN TRANSACTION

		SELECT @guid1=REPLACE(NEWID(),'-','')
		SELECT @filter=REPLACE(@filter,';',' AND ')
		--untuk menyimpan question yang sesuai dengan id form yang diinginkan
		CREATE table #tempQuestion(
			idQuestion INT,
			question VARCHAR(250),
			dataType char(1)
		)

		INSERT INTO #tempQuestion
		SELECT
			idQuestion,
			question,
			dataType
		FROM 
			Questions
		WHERE 
			fkForm = @idForm AND isAlive = 1

		--temp untuk answer item text
		create table #tempAnswerItemText(
			idAnswerGroup INT,
			idQuestion INT,
			answer VARCHAR(150)
		)

		--temp untuk answer item Numeric
		create table #tempAnswerItemNumeric(
			idAnswerGroup INT,
			idQuestion INT,
			answer INT
		)

		--temp untuk answer item Date
		create table #tempAnswerItemDate(
			idAnswerGroup INT,
			idQuestion INT,
			answer DATE
		)

		--untuk answer item text
		--pilih sesuai dengan form yang diinginkan
		INSERT INTO #tempAnswerItemText
		SELECT
			AnswerItemText.fkAnswerGroup as 'idAnswerGroup',
			AnswerItemText.fkQuestion as 'idQuestion',
			AnswerItemText.answer
		FROM 
			AnswerItemText INNER JOIN #tempQuestion ON
				AnswerItemText.fkQuestion = #tempQuestion.idQuestion
		WHERE
			AnswerItemText.isLatest = 1

		--cursor untuk id question nya ada apa saja
		DECLARE curItemText CURSOR 
		FOR 
		SELECT 
			DISTINCT
			idQuestion
		FROM 
			#tempAnswerItemText
		ORDER BY
			idQuestion

		--buat temp global table
		SET @queryText = 'create table ##tempText_'+@guid1+'
		(
			idAnswerGroup INT,'

		OPEN curItemText

		FETCH NEXT FROM curItemText INTO
			@currCol

		--ambil semua kolom distinct nya
		WHILE @@FETCH_STATUS=0
		BEGIN 
			SET @columnText += '['+@currCol+'],'
			SET @queryText += '['+@currCol+']'+' VARCHAR(150),'
			FETCH NEXT FROM curItemText INTO
				@currCol
		END

		CLOSE curItemText
		DEALLOCATE curItemText

		SET @queryText = LEFT(@queryText,LEN(@queryText)-1)

		SET @queryText += '
		)'

		EXEC sp_executesql @queryText

		--masukkan hasilnya pivot ke dalam global temp table
		IF(LEN(@columnText) != 0)
		BEGIN
			SET @columnText = LEFT(@columnText, LEN(@columnText)-1)
    
			SET @queryText = '
			INSERT INTO ##tempText_'+@guid1+'
			SELECT '+ 'idAnswerGroup,' +
				@columnText+
			' FROM 
				#tempAnswerItemText
			PIVOT
			(
				min(answer)
				FOR idQuestion in ('+@columnText+')
			)as p'
			EXEC sp_executesql @queryText
		END

		--untuk answer item Numeric
		--pilih sesuai dengan form yang diinginkan
		INSERT INTO #tempAnswerItemNumeric
		SELECT
			AnswerItemNumeric.fkAnswerGroup as 'idAnswerGroup',
			AnswerItemNumeric.fkQuestion as 'idQuestion',
			AnswerItemNumeric.answer
		FROM 
			AnswerItemNumeric INNER JOIN #tempQuestion ON
				AnswerItemNumeric.fkQuestion = #tempQuestion.idQuestion
		WHERE
			AnswerItemNumeric.isLatest = 1

		--cursor untuk id question nya ada apa saja
		DECLARE curItemText CURSOR 
		FOR 
		SELECT 
			DISTINCT
			idQuestion
		FROM 
			#tempAnswerItemNumeric
		ORDER BY
			idQuestion

		--buat temp global table
		SET @queryText = 'create table ##tempNumeric_'+@guid1+'
		(
			idAnswerGroup INT,'

		OPEN curItemText

		FETCH NEXT FROM curItemText INTO
			@currCol

		--ambil semua kolom distinct nya
		WHILE @@FETCH_STATUS=0
		BEGIN 
			SET @columnNumeric += '['+@currCol+'],'
			SET @queryText += '['+@currCol+']'+' INT,'
			FETCH NEXT FROM curItemText INTO
				@currCol
		END

		CLOSE curItemText
		DEALLOCATE curItemText

		SET @queryText = LEFT(@queryText,LEN(@queryText)-1)

		SET @queryText += '
		)'

		EXEC sp_executesql @queryText

		--masukkan hasilnya pivot ke dalam global temp table
		 IF(LEN(@columnNumeric) != 0)
		BEGIN
			SET @columnNumeric = LEFT(@columnNumeric, LEN(@columnNumeric)-1)
    
			SET @queryText = '
			INSERT INTO ##tempNumeric_'+@guid1+'
			SELECT '+ 'idAnswerGroup,' +
				@columnNumeric+
			' FROM 
				#tempAnswerItemNumeric
			PIVOT
			(
				min(answer)
				FOR idQuestion in ('+@columnNumeric+')
			)as p'
			EXEC sp_executesql @queryText
		END

		 --untuk answer item Date
		--pilih sesuai dengan form yang diinginkan
		INSERT INTO #tempAnswerItemDate
		SELECT
			AnswerItemDate.fkAnswerGroup as 'idAnswerGroup',
			AnswerItemDate.fkQuestion as 'idQuestion',
			AnswerItemDate.answer
		FROM 
			AnswerItemDate INNER JOIN #tempQuestion ON
				AnswerItemDate.fkQuestion = #tempQuestion.idQuestion
		WHERE
			AnswerItemDate.isLatest = 1

		--cursor untuk id question nya ada apa saja
		DECLARE curItemText CURSOR 
		FOR 
		SELECT 
			DISTINCT
			idQuestion
		FROM 
			#tempAnswerItemDate
		ORDER BY
			idQuestion

		--buat temp global table
		SET @queryText = 'create table ##tempDate_'+@guid1+'
		(
			idAnswerGroup INT,'
    
		OPEN curItemText

		FETCH NEXT FROM curItemText INTO
			@currCol

		--ambil semua kolom distinct nya
		WHILE @@FETCH_STATUS=0
		BEGIN 
			SET @columnDate += '['+@currCol+'],'
			SET @queryText += '['+@currCol+']'+' DATE,'
			FETCH NEXT FROM curItemText INTO
				@currCol
		END

		CLOSE curItemText
		DEALLOCATE curItemText

		SET @queryText = LEFT(@queryText,LEN(@queryText)-1)

		SET @queryText += '
		)'

		EXEC sp_executesql @queryText

		--masukkan hasilnya pivot ke dalam global temp table
		 IF(LEN(@columnDate) != 0)
		BEGIN
			SET @columnDate = LEFT(@columnDate, LEN(@columnDate)-1)

			SET @queryText = '
			INSERT INTO ##tempDate_'+@guid1+'
			SELECT '+ 'idAnswerGroup,' +
				@columnDate+
			' FROM 
				#tempAnswerItemDate
			PIVOT
			(
				min(answer)
				FOR idQuestion in ('+@columnDate+')
			)as p'
			EXEC sp_executesql @queryText
		END

		SET @queryText ='select '
		IF @agregat is not null
		BEGIN
			SET @queryText += @agregat
		END
		ELSE
		BEGIN
			SET @queryText+='*'
		END
		SET @queryText+=' from '+
						CONCAT('##tempText_',@guid1)+' full outer join '+
						CONCAT('##tempNumeric_',@guid1)+' ON '+CONCAT('##tempText_',@guid1)+
						'.idAnswerGroup = '+CONCAT('##tempNumeric_',@guid1)+'.idAnswerGroup'+
						' full outer join '+CONCAT('##tempDate_',@guid1)+' ON '+CONCAT('##tempNumeric_',@guid1)+'.idAnswerGroup = '+
						CONCAT('##tempDate_',@guid1)+'.idAnswerGroup'
    
		IF @filter is not NULL
		BEGIN
			SET @queryText = @queryText+ ' WHERE '+@filter
		END
		EXEC sp_executesql @queryText

		--untuk drop tablenya
		SET @queryText = 'drop table ##tempText_'+@guid1
		EXEC sp_executesql @queryText

		SET @queryText = 'drop table ##tempNumeric_'+@guid1
		EXEC sp_executesql @queryText

		SET @queryText = 'drop table ##tempDate_'+@guid1
		EXEC sp_executesql @queryText

	COMMIT TRANSACTION

--exec spCreateReport 1, null,null
-- exec spCreateReport 1, null, 'avg([7]) as [rata7], min([7]) as [min7]'
--untuk lihat hasilnya
    -- SET @queryText = 'select * from ##tempText_'+@guid1
    -- EXEC sp_executesql @queryText

    -- SET @queryText = 'select * from ##tempNumeric_'+@guid1
    -- EXEC sp_executesql @queryText

    -- SET @queryText = 'select * from ##tempDate_'+@guid1
    -- EXEC sp_executesql @queryText