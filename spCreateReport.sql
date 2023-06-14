ALTER PROCEDURE spCreateReport
    @idForm INT,
    @filter NVARCHAR(1000),
    @agregat NVARCHAR(1000)
AS
   exec spGenerateTablePivot @idForm,@filter,@agregat,1

-- exec spCreateReport 1, null, 'avg([7]) as [rata7], min([7]) as [min7]'