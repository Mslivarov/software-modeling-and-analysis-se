--Функция, която връща общото гледано време за даден профил

DELIMITER $$

CREATE FUNCTION GetTotalWatchTime (p_profile_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_minutes INT;

    SELECT SUM(duration_minutes)
    INTO total_minutes
    FROM WatchHistory
    WHERE profile_id = p_profile_id;

    RETURN IFNULL(total_minutes, 0);
END$$

DELIMITER ;
