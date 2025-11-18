--Автоматично се променя end_date на стария план при промяна на плана.

DELIMITER $$

CREATE TRIGGER tr_UpdateSubscriptionPlan
BEFORE UPDATE ON Subscriptions
FOR EACH ROW
BEGIN
    IF NEW.plan_name <> OLD.plan_name THEN
        SET NEW.end_date = NOW();
    END IF;
END$$

DELIMITER ;
