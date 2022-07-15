USE PerformanceReview;

DELIMITER #
CREATE TRIGGER TR_UsersUpdateEdad
    BEFORE INSERT -- Con After no se puede actualizar la misma tabla desde la que se esta ejecutando el trigger
    ON Users
    FOR EACH ROW
BEGIN
    SET @edadReal = TIMESTAMPDIFF(YEAR, New.FechaNacimiento, CURRENT_DATE);
    IF NEW.Edad <> @edadReal THEN
            SET New.Edad = @edadReal;
    end if;

    IF New.Edad > 120 AND new.Edad < 18 THEN
        SET NEW.Edad = 0;
    END IF;
END #
DELIMITER ;