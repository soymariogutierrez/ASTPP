-- Create temp sip device table
DROP TABLE IF EXISTS temp_sip_devices_fs_86;

CREATE TABLE temp_sip_devices_fs_86 (
    id INT AUTO_INCREMENT,
    sip_device_id INT NOT NULL UNIQUE,
    action_id INT,
    action_date DATETIME,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS temp_sip_devices_fs_87;

CREATE TABLE temp_sip_devices_fs_87 (
    id INT AUTO_INCREMENT,
    sip_device_id INT NOT NULL UNIQUE,  
    action_id INT,
    action_date DATETIME,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS temp_sip_devices_fs_88;

CREATE TABLE temp_sip_devices_fs_88 (
    id INT AUTO_INCREMENT,
    sip_device_id INT NOT NULL UNIQUE,  
    action_id INT,
    action_date DATETIME,
    PRIMARY KEY (id)
);

-- Upon creation of sip device, update temp fs sip device table
drop trigger after_insert_sip_device;

DELIMITER $$

CREATE TRIGGER after_insert_sip_device
AFTER INSERT
ON sip_devices FOR EACH ROW BEGIN
    IF NEW.id IS NOT NULL THEN
        INSERT INTO temp_sip_devices_fs_86(sip_device_id,action_id,action_date) VALUES(new.id,1,NOW()); 
        INSERT INTO temp_sip_devices_fs_87(sip_device_id,action_id,action_date) VALUES(new.id,1,NOW());
        INSERT INTO temp_sip_devices_fs_88(sip_device_id,action_id,action_date) VALUES(new.id,1,NOW());
    END IF;
END$$

DELIMITER ;

-- Upon edit of sip device, update temp fs sip device table
drop trigger after_update_sip_device;

DELIMITER $$
CREATE TRIGGER after_update_sip_device
AFTER UPDATE
ON sip_devices FOR EACH ROW
BEGIN
	INSERT INTO temp_sip_devices_fs_86 (sip_device_id,action_id,action_date) VALUES (old.id,2,NOW()) ON DUPLICATE KEY UPDATE action_id = 2;
	INSERT INTO temp_sip_devices_fs_87 (sip_device_id,action_id,action_date) VALUES (old.id,2,NOW()) ON DUPLICATE KEY UPDATE action_id = 2;
	INSERT INTO temp_sip_devices_fs_88 (sip_device_id,action_id,action_date) VALUES (old.id,2,NOW()) ON DUPLICATE KEY UPDATE action_id = 2;
END$$

DELIMITER ;

-- Upon deletation of sip device, update temp fs sip device table
drop trigger after_delete_sip_device;

DELIMITER $$

CREATE TRIGGER after_delete_sip_device
AFTER DELETE
ON sip_devices FOR EACH ROW
BEGIN
	INSERT INTO temp_sip_devices_fs_86 (sip_device_id,action_id,action_date) VALUES (old.id,3,NOW()) ON DUPLICATE KEY UPDATE action_id = 3;
	INSERT INTO temp_sip_devices_fs_87 (sip_device_id,action_id,action_date) VALUES (old.id,3,NOW()) ON DUPLICATE KEY UPDATE action_id = 3;
	INSERT INTO temp_sip_devices_fs_88 (sip_device_id,action_id,action_date) VALUES (old.id,3,NOW()) ON DUPLICATE KEY UPDATE action_id = 3;
END$$    

DELIMITER ;


-- If account status change the update temp fs sip device tables
drop trigger after_update_accounts;

DELIMITER $$

CREATE TRIGGER after_update_accounts
AFTER UPDATE
ON accounts FOR EACH ROW
BEGIN
    IF NEW.status <> OLD.status THEN 
        INSERT INTO temp_sip_devices_fs_86 (sip_device_id,action_id,action_date) SELECT id,2,NOW() FROM sip_devices WHERE accountid=old.id;
        INSERT INTO temp_sip_devices_fs_87 (sip_device_id,action_id,action_date) SELECT id,2,NOW() FROM sip_devices WHERE accountid=old.id;
        INSERT INTO temp_sip_devices_fs_88 (sip_device_id,action_id,action_date) SELECT id,2,NOW() FROM sip_devices WHERE accountid=old.id;
    END IF;
END$$

DELIMITER ;
