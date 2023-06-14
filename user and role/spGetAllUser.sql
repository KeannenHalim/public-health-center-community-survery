ALTER PROCEDURE spGetAllUser
AS
    SELECT
        idUser,
        username,
        roleName
    FROM 
        Users INNER JOIN Role ON
            Users.fkRole = Role.idRole

-- exec spGetAllUser