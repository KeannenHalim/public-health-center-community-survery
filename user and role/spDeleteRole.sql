ALTER PROCEDURE spDeleteRole
    @roleName VARCHAR(20)
AS
    DELETE FROM Role
    WHERE roleName = @roleName
