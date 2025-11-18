--Процедура, която добавя нов запис в WatchHistory, като проверява дали профилът съществува, заглавието съществува и дали продължителността е >0.

DELIMITER $$

CREATE PROCEDURE AddWatchHistory(
    IN p_profile_id INT,
    IN p_title_id INT,
    IN p_duration_minutes INT
)
BEGIN
    DECLARE new_watch_id INT;

    IF (SELECT COUNT(*) FROM Profiles WHERE profile_id = p_profile_id) = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Profile does not exist.';
    END IF;

    IF (SELECT COUNT(*) FROM Titles WHERE title_id = p_title_id) = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Title does not exist.';
    END IF;

    IF p_duration_minutes <= 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Duration must be greater than zero.';
    END IF;

    SELECT IFNULL(MAX(watch_id), 8000) + 1
    INTO new_watch_id
    FROM WatchHistory;

    INSERT INTO WatchHistory (watch_id, profile_id, title_id, watch_datetime, duration_minutes)
    VALUES (
        new_watch_id,
        p_profile_id,
        p_title_id,
        NOW(),
        p_duration_minutes
    );
END$$

DELIMITER ;
