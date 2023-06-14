ALTER PROCEDURE spGetAnswerAllUser
    @idForm INT,
    @filter NVARCHAR(1000)
AS
    exec spGenerateTablePivot @idForm,@filter,null,0

-- exec spGetAnswerAllUser 1,null