ALTER PROCEDURE spDeleteRole
    @roleName VARCHAR(20)
AS
    BEGIN TRANSACTION
        DELETE FROM Role
        WHERE roleName = @roleName
    COMMIT TRANSACTION
