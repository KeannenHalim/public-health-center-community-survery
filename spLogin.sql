ALTER PROCEDURE spLogin
    @username varchar(128),
    @password varchar(128)
AS
    DECLARE
        @idUser int,
        @idRole int,
        @roleName varchar(32)

    SELECT
        @idUser = idUser,
        @idRole = fkRole
    FROM 
        Users
    WHERE
        username = @username AND password = @password

    SELECT
        @roleName = roleName
    FROM 
        Role
    WHERE
        idRole = @idRole

    SELECT
        @idUser as 'idUser',
        @roleName as 'role'

-- exec spLogin 'admin','admin'
