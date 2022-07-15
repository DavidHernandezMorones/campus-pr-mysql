SELECT id, Name, FechaNacimiento, CreateDate, Edad
FROM Users;

SELECT ProfileName
FROM Role;

SELECT Users.Id, Users.Name, Users.FechaNacimiento, Users.Edad, Users.CreateDate, Role.ProfileName
FROM Users
         INNER JOIN UserRole
                    ON Users.Id = UserRole.IdUser
         INNER JOIN Role
                    ON UserRole.IdRole = Role.Id;

SELECT Name, FechaNacimiento, Edad, CreateDate
FROM Users
         LEFT JOIN UserRole
                   ON Users.Id = UserRole.IdUser
WHERE UserRole.Id IS NULL;

SELECT SUM(Edad) TotalEdades
FROM Users;

SELECT COUNT(Id) Usuarios
FROM Users;

SELECT COUNT(Id) Roles
FROM Role;

SELECT COUNT(Id) UsuariosConRol
FROM UserRole;
