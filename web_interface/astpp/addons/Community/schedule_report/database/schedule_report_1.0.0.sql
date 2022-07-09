 INSERT INTO `menu_modules` ( `menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) 
VALUES ( 'Schedule Reports', 'schedule', 'schedule_report/schedule_report_list/', 'Reports', '', '0', '82.1');

update userlevels set module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = -1;
DROP TABLE IF EXISTS schedule_report;
CREATE TABLE `schedule_report` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `account_type` text NOT NULL,
  `description` text NOT NULL,
  `db_query` text NOT NULL,
  `recuring` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `emailid` text NOT NULL,
  `creation_date` datetime NOT NULL,
  `last_execution_date` datetime NOT NULL,
  `execute_on` datetime NOT NULL,
  `last_modified_date` datetime NOT NULL,
  `reseller_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `schedule_report`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `schedule_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

INSERT INTO `roles_and_permission` ( `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
( 0, 0, 'reports','schedule_report','schedule_report','schedule_report_list', 'Schedule Report', '["main","list","search","create","delete"]', 0, '2019-01-25 09:01:03', '9.50000');

INSERT INTO `default_templates` ( `name`, `subject`, `description`, `sms_template`, `alert_template`, `template`, `last_modified_date`, `reseller_id`, `is_email_enable`, `is_sms_enable`, `is_alert_enable`, `status`) VALUES ( 'schedule_report', 'Notification : #title# Schedule Report', 'to request specific schedule report', '', '', '<p>Hello Admin,</p>\n\n<p>Please find attachment of requested #title# schedule report.</p>\n\n<p> Execution Date : #EXECUTION_DATE#</p>\n', '1000-01-01 00:00:00.000000', '0', '0', '0', '0', '0');

INSERT INTO `cron_settings` (`name`, `command`, `exec_interval`, `creation_date`, `last_modified_date`, `last_execution_date`, `next_execution_date`, `status`, `file_path`) VALUES 
( 'Schedule Report', 'hours', '1', UTC_TIMESTAMP(), UTC_TIMESTAMP(),'0000-00-00 00:00:00','0000-00-00 00:00:00', '0', 'wget --no-check-certificate -q -O- {BASE_URL}scheduleReport/Schedule_Report');
