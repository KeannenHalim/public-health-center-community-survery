ALTER PROCEDURE spLogin
    @username varchar(30),
    @password varchar(30)
AS
    DECLARE
        @idUser int,
        @idRole int,
        @roleName varchar(20)

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

-- exec spLogin 'admin','password'
