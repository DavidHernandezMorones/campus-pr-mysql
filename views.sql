USE PerformanceReview;

CREATE VIEW `UsersAndRoles` AS
SELECT Users.Id,
       Users.Name,
       timestampdiff(YEAR, Users.FechaNacimiento, CURRENT_DATE) AS edad,
       COUNT(UserRole.IdUser)                            total_roles
FROM Users
         LEFT JOIN UserRole
                   ON Users.Id = UserRole.IdUser
GROUP BY Users.Id, Users.Name, edad;
