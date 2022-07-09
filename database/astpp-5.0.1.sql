-- -------------------20-May-2021

UPDATE `system` SET `value` = ' https://inextrix.com/' WHERE `group_title` = 'term_and_condition' AND `name` = 'url';

UPDATE `system` SET `value` = 'iNextrix Technologies Pvt Ltd' WHERE `group_title` = 'term_and_condition' AND `name` = 'text';

UPDATE `roles_and_permission` SET `permissions` = '[\"main\",\"list\",\"delete\",\"edit\",\"search\"]' WHERE `login_type` = 0 AND `module_url` = 'admin_list';

-- ------------------25-May-2021
DROP PROCEDURE IF EXISTS `master_pro`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `master_pro`()
    NO SQL
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE rpl_id INT;
DECLARE rpl_name VARCHAR(50);
DECLARE rpl_date DATETIME;
DECLARE cur1 CURSOR 
FOR 
SELECT id,name,last_execution_date FROM reports_process_list;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
OPEN cur1;
read_loop: LOOP
  FETCH cur1 into rpl_id, rpl_name, rpl_date;
  IF done THEN
    LEAVE read_loop;
  END IF;
    SET @t1 =CONCAT("CALL ",rpl_name,"('",rpl_date,"','",UTC_TIMESTAMP(),"')");
  PREPARE stmt3 FROM @t1;
  EXECUTE stmt3;
  
END LOOP;

CLOSE cur1;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS `get_cdr_records`; 
DELIMITER $$
CREATE PROCEDURE `get_cdr_records`(IN `last_execution_time` DATETIME, IN `end_date` DATETIME)
BEGIN
INSERT INTO `cdrs_day_by_summary` (`account_id`, `reseller_id`, `type`, `country_id`, `billseconds`, `mcd`, `total_calls`, `debit`, `cost`, `total_answered_call`, `total_fail_call`, `unique_date`, `calldate`) (SELECT `accountid`, `reseller_id`, `type`, `country_id`, SUM(`billseconds`) AS `billseconds`, MAX(`billseconds`) AS `mcd`, COUNT(*)
 AS `total_calls`, SUM(`debit`) AS `debit`, SUM(`cost`) AS `cost`, COUNT(CASE WHEN `billseconds` > 0 THEN 1 END) AS `total_answered_call`, COUNT(CASE WHEN `billseconds`=0 THEN 1 END) AS `total_fail_call`, DATE_FORMAT(`callstart`, "%Y%m%d") AS `unique_date`, DATE_FORMAT(`callstart`, "%Y-%m-%d") AS `calldate` FROM `cdrs_staging` WHERE `end_stamp`>=`last_execution_time` AND `end_stamp` < `end_date` GROUP BY `accountid`, `country_id`, `reseller_id`, `unique_date`) ON DUPLICATE KEY UPDATE `billseconds`=(`billseconds` + VALUES(`billseconds`)), `debit`=(`debit` + VALUES(`debit`)), `cost`=(`cost` + VALUES(`cost`)), `total_answered_call`=(`total_answered_call` + VALUES(`total_answered_call`)), `total_fail_call`=(`total_fail_call` + VALUES(`total_fail_call`)), `calldate`=`calldate`, `mcd`=GREATEST(VALUES(`mcd`), `mcd`), `total_calls`=(`total_calls` + VALUES(`total_calls`));
UPDATE `reports_process_list` SET `last_execution_date`=`end_date` WHERE `name`='get_cdr_records';
END$$
DELIMITER ;

DROP EVENT IF EXISTS staging_cdrs;

CREATE DEFINER=`root`@`localhost` EVENT `staging_cdrs` ON SCHEDULE EVERY 1 MINUTE STARTS NOW() ON COMPLETION NOT PRESERVE ENABLE DO CALL master_pro();

DROP EVENT IF EXISTS remove_cdrs_records;

CREATE DEFINER=`root`@`localhost` EVENT `remove_cdrs_records` ON SCHEDULE EVERY 1 HOUR STARTS NOW() ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM cdrs_staging where end_stamp <= (NOW()- INTERVAL 120 MINUTE);

-- ------------------26-May-2021
INSERT INTO `menu_modules` (`id`, `menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES(NULL, 'Product Summary Reports', 'user', 'user/user_summary_product/', 'Reports', '', '0', 89.6);

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL, 2, 0, 'reports','user',' ','user_summary_product', 'Product Summary Report', '["main","list","search","export"]', 0, '2019-01-25 09:01:03', '7.90000'); 

UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules WHERE module_url = 'user/user_summary_product/' ) ) WHERE userlevelid = 0;

-- ------------------09-Jun-2021
ALTER TABLE `invoice_conf` ADD `signature` varchar(100) NOT NULL;


-- -------------------------17-june-2021

ALTER TABLE `cdrs_day_by_summary` ADD `provider_id` INT NOT NULL AFTER `reseller_id`;

DROP PROCEDURE IF EXISTS `get_cdr_records`; 
DELIMITER $$
CREATE PROCEDURE `get_cdr_records`(IN `last_execution_time` DATETIME, IN `end_date` DATETIME)
BEGIN
INSERT INTO `cdrs_day_by_summary` (`account_id`, `reseller_id`,`provider_id`, `type`, `country_id`, `billseconds`, `mcd`, `total_calls`, `debit`, `cost`, `total_answered_call`, `total_fail_call`, `unique_date`, `calldate`) (SELECT `accountid`, `reseller_id`, `provider_id` ,`type`, `country_id`, SUM(`billseconds`) AS `billseconds`, MAX(`billseconds`) AS `mcd`, COUNT(*)
 AS `total_calls`, SUM(`debit`) AS `debit`, SUM(`cost`) AS `cost`, COUNT(CASE WHEN `billseconds` > 0 THEN 1 END) AS `total_answered_call`, COUNT(CASE WHEN `billseconds`=0 THEN 1 END) AS `total_fail_call`, DATE_FORMAT(`callstart`, "%Y%m%d") AS `unique_date`, DATE_FORMAT(`callstart`, "%Y-%m-%d") AS `calldate` FROM `cdrs_staging` WHERE `end_stamp`>=`last_execution_time` AND `end_stamp` < `end_date` GROUP BY `accountid`, `country_id`, `reseller_id`,`provider_id`, `unique_date`) ON DUPLICATE KEY UPDATE `billseconds`=(`billseconds` + VALUES(`billseconds`)), `debit`=(`debit` + VALUES(`debit`)), `cost`=(`cost` + VALUES(`cost`)), `total_answered_call`=(`total_answered_call` + VALUES(`total_answered_call`)), `total_fail_call`=(`total_fail_call` + VALUES(`total_fail_call`)), `calldate`=`calldate`, `mcd`=GREATEST(VALUES(`mcd`), `mcd`), `total_calls`=(`total_calls` + VALUES(`total_calls`));
UPDATE `reports_process_list` SET `last_execution_date`=`end_date` WHERE `name`='get_cdr_records';
END$$
DELIMITER ;

ALTER TABLE `accounts` ADD `modified_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
 
-- -------------------------08-july-2021
UPDATE `currency` SET `currency` = 'MZN' WHERE `currency` = 'MZM';

-- -------------------------19-july-2021
UPDATE `roles_and_permission` SET `permissions` = '[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\",\"import\",\"export\"]' WHERE module_name = "callbarring";

-- -------------------------30-july-2021
UPDATE `default_templates` SET `subject` = 'Your account password has been reset.' WHERE `name` ='reset_password';

ALTER TABLE `call_barring` ADD CONSTRAINT constraint_name UNIQUE (name);

-- -------------------------06-August-2021
INSERT INTO `default_templates` VALUES (NULL,'customer_refill_balance','You Received #AMOUNT# Amount to #SENDER_ACCOUNT_NUMBER# account','Balance transfer notification template','Dear #FIRST_NAME#, You Received #AMOUNT# Amount from your account to #SENDER_ACCOUNT_NUMBER#. Thanks, #COMPANY_NAME#','<p>You Received #AMOUNT# Amount from your account to #SENDER_ACCOUNT_NUMBER#</p>','<p>Dear #NAME#,</p>\r\n\r\n<p>You Received #AMOUNT# from your account to #SENDER_ACCOUNT_NUMBER#.</p>\r\n\r\n<p>If you have not raised a request then please contact us immediately.</p>\r\n\r\n<p>Thanks,<br />\r\n#COMPANY_NAME#</p>\r\n','2019-01-26 10:53:45',0,0,0,0,0);

-- -------------------------11-August-2021
DROP VIEW `packages_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`astppuser`@`localhost` SQL SECURITY DEFINER VIEW `packages_view`  AS  select `O`.`order_id` AS `id`,`P`.`id` AS `product_id`,`P`.`name` AS `package_name`,`O`.`free_minutes` AS `free_minutes`,`P`.`applicable_for` AS `applicable_for`,`O`.`accountid` AS `accountid`,`O`.`is_terminated` AS `is_terminated` from (`products` `P` join `order_items` `O`) where ((`P`.`id` = `O`.`product_id`) and (`P`.`product_category` = 1) and (`P`.`status` = 0) and ((`O`.`termination_date` >= utc_timestamp()) or (`O`.`termination_date` = '0000-00-00 00:00:00'))) ;

-- ------------------------ 01-11-2021
ALTER TABLE `cdrs_staging` ADD `update_status` INT NOT NULL DEFAULT '0';

DROP PROCEDURE IF EXISTS `master_pro`;
DELIMITER $$
CREATE DEFINER=`astppuser`@`localhost` PROCEDURE `master_pro`()
    NO SQL
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE rpl_id INT;
DECLARE rpl_name VARCHAR(50);
DECLARE rpl_date DATETIME;
DECLARE cur1 CURSOR 
FOR 
SELECT id,name,last_execution_date FROM reports_process_list;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
OPEN cur1;
read_loop: LOOP
  FETCH cur1 into rpl_id, rpl_name, rpl_date;
  IF done THEN
    LEAVE read_loop;
  END IF;
    SET @t1 =CONCAT("CALL ",rpl_name,"('",rpl_date,"','",DATE_ADD(UTC_TIMESTAMP(),INTERVAL -1 MINUTE),"')");
  PREPARE stmt3 FROM @t1;
  EXECUTE stmt3;
  
END LOOP;
CLOSE cur1;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS `get_cdr_records`; 
DELIMITER $$
CREATE DEFINER=`astppuser`@`localhost` PROCEDURE `get_cdr_records`(IN `last_execution_time` DATETIME, IN `end_date` DATETIME)
BEGIN
INSERT INTO `cdrs_day_by_summary` (`account_id`, `reseller_id`, `type`, `country_id`, `billseconds`, `mcd`, `total_calls`, `debit`, `cost`, `total_answered_call`, `total_fail_call`, `unique_date`, `calldate`) (SELECT `accountid`, `reseller_id`, `type`, `country_id`, SUM(`billseconds`) AS `billseconds`, MAX(`billseconds`) AS `mcd`, COUNT(*) AS `total_calls`, SUM(`debit`) AS `debit`, SUM(`cost`) AS `cost`, COUNT(CASE WHEN `billseconds` > 0 THEN 1 END) AS `total_answered_call`, COUNT(CASE WHEN `billseconds`=0 THEN 1 END) AS `total_fail_call`, DATE_FORMAT(`callstart`, "%Y%m%d") AS `unique_date`,CASE WHEN (DATE_FORMAT(callstart, '%i') > 30) THEN DATE_FORMAT(callstart, "%Y-%m-%d %H:30:00") ELSE DATE_FORMAT(callstart, "%Y-%m-%d %H:00:00") END as calldate FROM `cdrs_staging` WHERE `update_status` = 0 AND `end_stamp` <= `end_date` GROUP BY `accountid`, `country_id`, `reseller_id`, `calldate`) ON DUPLICATE KEY UPDATE `billseconds`=(`billseconds` + VALUES(`billseconds`)), `debit`=(`debit` + VALUES(`debit`)), `cost`=(`cost` + VALUES(`cost`)), `total_answered_call`=(`total_answered_call` + VALUES(`total_answered_call`)), `total_fail_call`=(`total_fail_call` + VALUES(`total_fail_call`)), `calldate`=`calldate`, `mcd`=GREATEST(VALUES(`mcd`), `mcd`), `total_calls`=(`total_calls` + VALUES(`total_calls`));

UPDATE `reports_process_list` SET `last_execution_date`=`end_date` WHERE `name`='get_cdr_records';
UPDATE `cdrs_staging` SET `update_status`=1 WHERE `end_stamp` <=`end_date`;
END$$
DELIMITER ;

DROP EVENT IF EXISTS staging_cdrs;
CREATE DEFINER=`astppuser`@`localhost` EVENT `staging_cdrs` ON SCHEDULE EVERY 1 MINUTE STARTS NOW() ON COMPLETION NOT PRESERVE ENABLE DO CALL master_pro();

DROP EVENT IF EXISTS remove_cdrs_records;
CREATE DEFINER=`astppuser`@`localhost` EVENT `remove_cdrs_records` ON SCHEDULE EVERY 1 HOUR STARTS NOW() ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM cdrs_staging where end_stamp <= (NOW()- INTERVAL 120 MINUTE) AND update_status = 1;

-- -------------------31-Jan-2022
UPDATE `default_templates` SET `subject` = 'You Received #AMOUNT# Amount from #SENDER_ACCOUNT_NUMBER# account', `sms_template` = 'Dear #FIRST_NAME#, You Received #AMOUNT# Amount from #SENDER_ACCOUNT_NUMBER#. Thanks, #COMPANY_NAME#', `alert_template` = '<p>You Received #AMOUNT# Amount from #SENDER_ACCOUNT_NUMBER#</p>' ,`template` = '<p>Dear #NAME#,</p> <p>You Received #AMOUNT# from #SENDER_ACCOUNT_NUMBER#.</p> <p>If you have not raised a request then please contact us immediately.</p> <p>Thanks,<br /> #COMPANY_NAME#</p> ' WHERE `name` ='customer_refill_balance';

-- ------------------------ 28-04-2022 ASTPPENT-2761 Riya Start
INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`, `sub_group`, `field_rules`) VALUES (NULL, 'datacoll', 'Datacoll Details', '2021-04-27', 'default_system_input', NULL, '2019-04-01 00:00:00.000000', '', '1', 'payment_methods', '', '');
-- ------------------------ 28-04-2022 ASTPPENT-2761 Riya end