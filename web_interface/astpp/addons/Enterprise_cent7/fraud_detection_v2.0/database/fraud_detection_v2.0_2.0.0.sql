INSERT INTO `menu_modules` ( `menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES
 ( 'Fraud Detection', 'frauddetection', 'frauddetection/frauddetection_list/', 'Switch', '', 'Fraud Detection', '70.6');
update userlevels set module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = -1;
update userlevels set module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = 2;

CREATE TABLE `fraud_conf` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `filter_by` varchar(50) NOT NULL,
  `filter` Text NOT NULL,
  `time_period` int NOT NULL,
  `warning_threshold` int NOT NULL,
  `warning_action` varchar(50) NOT NULL,
  `block_threshold` int NOT NULL,
  `block_action` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 for active and 1 for inactive',
  `creation_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_execution_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `next_execution_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE `fraud_conf`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_unq` (`name`);
ALTER TABLE `fraud_conf`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

INSERT INTO `roles_and_permission` ( `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
( 0, 0, 'switch','frauddetection','fraud_detection','frauddetection_list', 'Fraud Detection', '["main","list","search","create","delete","edit"]', 0, '2019-01-25 09:01:03', '9.50000');

INSERT INTO `menu_modules` ( `menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES 
('Fraud Report', 'fraudreport', 'fraudreport/fraudreport_list/', 'Switch', '', 'Fraud Detection', '70.7');
update userlevels set module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = -1;
update userlevels set module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = 2;

CREATE TABLE `fraud_report` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `fraud_trigger` varchar(100) NOT NULL,
  `threshold_value` varchar(50) NOT NULL,
  `alarm_value` int NOT NULL,
  `filter_by` varchar(50) NOT NULL,
  `filter` Text NOT NULL,
  `action` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE `fraud_report`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `fraud_report`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

INSERT INTO `roles_and_permission` ( `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
( 0, 0, 'switch','fraudreport','0','fraudreport_list', 'Fraud Report', '["main","list","delete","search"]', 0, '2019-01-25 09:01:03', '9.50000');

INSERT INTO `cron_settings` (`name`, `command`, `exec_interval`, `creation_date`, `last_modified_date`, `last_execution_date`, `next_execution_date`, `status`, `file_path`) VALUES 
( 'Fraud Detection', 'minutes', '1', UTC_TIMESTAMP(), UTC_TIMESTAMP(),'0000-00-00 00:00:00','0000-00-00 00:00:00', '0', 'wget --no-check-certificate -q -O- {BASE_URL}fraudreporting/fraud_reporting');

INSERT INTO `default_templates` (`name`, `subject`, `description`, `sms_template`, `alert_template`, `template`, `last_modified_date`, `reseller_id`, `is_email_enable`, `is_sms_enable`, `is_alert_enable`, `status`) VALUES('fraud_report', 'Fraud detected #FRAUD_TRIGGER#: #FRAUD_RECORD_NAME#.', '', '', '', '<p>Hi<br />\n <br />\nThe system has detected possible fraud activity:<br />\n <br />\nInformation:<br />\n <br />\nThreshold Value: #THRESHOLD_VALUE#<br />\nAlarm Value: #CURRENT_VALUE#<br />\nFilter By: #FILTER_BY#<br />\nFilter: #FILTER#</p>\n', '2020-06-09 14:30:51', 0, 0, 0, 0, 0);

