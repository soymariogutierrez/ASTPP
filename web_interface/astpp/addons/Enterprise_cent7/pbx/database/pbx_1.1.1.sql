-- start-event

CREATE TRIGGER `remove_domain` AFTER UPDATE ON `accounts`
 FOR EACH ROW BEGIN
	IF(NEW.deleted = '1')THEN
		DELETE FROM domains WHERE accountid = NEW.id;
    END IF;
END

-- end-event


