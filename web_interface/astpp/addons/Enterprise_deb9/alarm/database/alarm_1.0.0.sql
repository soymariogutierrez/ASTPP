-- SET GLOBAL `event_scheduler`="ON";

DROP TABLE IF EXISTS `alarms`;
CREATE TABLE `alarms` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `threshold` decimal(10,2) NOT NULL,
  `period` int(6) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `email` text NOT NULL,
  `trunk_cli_id` int(11) NOT NULL,
  `auto_assign` tinyint(1) NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `last_modified_date` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `last_triggered_date` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `execution_flag` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `alarm_report`
--
DROP TABLE IF EXISTS `alarm_report`;
CREATE TABLE `alarm_report` (
  `id` int(11) NOT NULL,
  `triggered_date` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `alarm_id` int(11) NOT NULL COMMENT 'alarm table id',
  `alarm_name` varchar(30) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1->ASR 2->ACD 3->CIC 4->CLI 5->Gateway',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1- unresolved,0->done',
  `email` text NOT NULL,
  `trunk_cli_id` int(11) NOT NULL,
  `triggered_value` decimal(10,2) NOT NULL,
  `threshold_value` decimal(10,2) NOT NULL,
  `period` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alarms`
--
ALTER TABLE `alarms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alarm_report`
--
ALTER TABLE `alarm_report`
  ADD PRIMARY KEY (`id`);
--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `alarms`
--
ALTER TABLE `alarms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `alarms` ADD `gateway_type` TINYINT(1) NOT NULL COMMENT ' 0->freeswitch,1->console' AFTER `trunk_cli_id`;
--
-- AUTO_INCREMENT for table `alarm_report`
--
ALTER TABLE `alarm_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `alarm_report` CHANGE `status` `status` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '1->Open,0->Close';

INSERT INTO `menu_modules` (`menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) 
VALUES ('Alarm Configuration', 'alarm', 'alarm/alarm_list/', 'Switch', '', 'Call Alarms', '101');

update userlevels set module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = -1;
update userlevels set module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = 2;

INSERT INTO `menu_modules` (`menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`)
 VALUES ('Report', 'alarmreport', 'alarmreport/alarmreport_list/', 'Switch', '', 'Call Alarms', '101.1');

update userlevels set module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = -1;
update userlevels set module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = 2;


INSERT INTO `roles_and_permission` (`login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(0, 0, 'switch','alarm','alarm','alarm_list', 'Alarm Configuration', '["main","list","search","create","delete"]', 0, '2019-01-25 09:01:03', '6.70000');
INSERT INTO `roles_and_permission` (`login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(0, 0, 'switch','alarmreport','alarmreport','alarmreport_list', 'Report', '["main","list","search","close"]', 0, '2019-01-25 09:01:03', '6.80000');


insert into cron_settings(`name`,`command`,`exec_interval`,`creation_date`,`last_modified_date`,`next_execution_date`,`status`,`file_path`) VALUES('Alarm_active_calls','minutes',1,CONVERT_TZ(NOW(), @@session.time_zone, '+0:00'),CONVERT_TZ(NOW(), @@session.time_zone, '+0:00'),CONVERT_TZ(NOW(), @@session.time_zone, '+0:00')+INTERVAL 60 SECOND,0,'wget --no-check-certificate -q -O- {BASE_URL}Alarm_active_calls/index/'),
('Alarm_gateway_console','minutes',1,CONVERT_TZ(NOW(), @@session.time_zone, '+0:00'),CONVERT_TZ(NOW(), @@session.time_zone, '+0:00'),CONVERT_TZ(NOW(), @@session.time_zone, '+0:00')+INTERVAL 60 SECOND,0,'wget --no-check-certificate -q -O- {BASE_URL}Alarm_gateway_console/index/'),
('Alarm_gateway_freeswitch','minutes',1,CONVERT_TZ(NOW(), @@session.time_zone, '+0:00'),CONVERT_TZ(NOW(), @@session.time_zone, '+0:00'),CONVERT_TZ(NOW(), @@session.time_zone, '+0:00')+INTERVAL 60 SECOND,0,'wget --no-check-certificate -q -O- {BASE_URL}Alarm_gateway_freeswitch/index/'),
('Alarmping_freeswitch','minutes',1,CONVERT_TZ(NOW(), @@session.time_zone, '+0:00'),CONVERT_TZ(NOW(), @@session.time_zone, '+0:00'),CONVERT_TZ(NOW(), @@session.time_zone, '+0:00')+INTERVAL 60 SECOND,0,'wget --no-check-certificate -q -O- {BASE_URL}Alarmping_freeswitch/index/');

INSERT INTO `default_templates` (`name`, `subject`, `description`, `sms_template`, `alert_template`, `template`, `last_modified_date`, `reseller_id`, `is_email_enable`, `is_sms_enable`, `is_alert_enable`, `status`) VALUES
('alarm_report', 'Alarm:#ALARM#', 'Send successfull mail after creating alaram', 'Your Alarm #ALARM_NAME# created successfully.', '<p>#ALARM_NAME# created successfully.</p>\n', '<p>Your alarm #ALARM_NAME# has been successfully created<br/></p>\n\n<p>Alarm Name: #ALARM_NAME#<br />\nAlarm Type: #ALARM_TYPE#<br />\nAlarm Threshold #ALARM_THRESHOLD#<br />\nAlarm Period: #ALARM_THRESHOLD#<br />\nTrunk: #TRUNK#<br />\nTriggered Value:#TRIGGERED_VALUE#</p>\n', '2019-05-27 08:07:54', 0, 0, 0, 0, 0);



