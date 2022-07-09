INSERT INTO `menu_modules` (`menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES
('Ported Number List', 'portednumber', 'portednumber/portednumber_list/', 'Services', 'OutboundRoutes.png', '0', 82.7);
update userlevels set module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = -1;

/* ftp_track */

DROP TABLE IF EXISTS ftp_track;
CREATE TABLE `ftp_track` (
  `id` int(11) NOT NULL,
  `Last_GNP_file_found_on` varchar(40) NOT NULL COMMENT 'Last file found on this Date',
  `Last_MNP_file_found_on` varchar(40) NOT NULL COMMENT 'Last file found on this Date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `ftp_track`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `ftp_track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

INSERT INTO `ftp_track` (`id`, `Last_GNP_file_found_on`, `Last_MNP_file_found_on`) VALUES
(1, DATE_FORMAT(NOW(),'%Y%m%d'),DATE_FORMAT(NOW(),'%Y%m%d'));

/* ftp_track complete*/


/* numbering_plan */

DROP TABLE IF EXISTS numbering_plan;


CREATE TABLE `numbering_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prefix` int(15) NOT NULL,
  `participant_id` varchar(50) NOT NULL,
  `number_from` varchar(40) NOT NULL DEFAULT '0',
  `number_to` varchar(40) NOT NULL DEFAULT '0',
  `total_allocated_num` int(20) NOT NULL DEFAULT '0',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `participant_id` (`participant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `numbering_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

/* numbering_plan completed*/

/* ported_number */

DROP TABLE IF EXISTS ported_number;

CREATE TABLE `ported_number` (
  `id` int(11) NOT NULL,
  `dnfrom` varchar(25) NOT NULL DEFAULT '0',
  `dnto` varchar(25) NOT NULL DEFAULT '0',
  `rnoroute` varchar(30) NOT NULL,
  `action` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `ported_number`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `ported_number`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

/* ported_number completed*/

/* routing_labels */

DROP TABLE IF EXISTS routing_labels;

CREATE TABLE `routing_labels` (
  `id` int(11) NOT NULL,
  `routing_label` varchar(25) NOT NULL,
  `gnp_no` varchar(255) NOT NULL,
  `participant_id` varchar(50) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


INSERT INTO `routing_labels` VALUES (1,'D000','Telkom','TELKOM','2014-01-23 13:30:54'),(2,'D001','ECN Telecommunications','ECN','2014-01-23 13:30:54'),(3,'D002','Vox Telecom','VOX','2014-01-23 13:30:54'),(4,'D003','Switch Telecom (Pty) Ltd','SWITCH','2014-01-23 13:30:54'),(5,'D007','Neotel','NEOTEL','2014-01-23 13:30:54'),(6,'D072','EOH Network Solutions ','EOHGNP','2014-01-23 13:30:54'),(7,'D850','Internet Solutions (Pty) Ltd','INTERSOL','2014-01-23 13:30:54'),(8,'D851','Broadband Innovation (Pty) Ltd','BROADBAN','2014-01-23 13:30:54'),(9,'D855','45 Degrees Telecommunications (Pty) Ltd','45DGTGNP ','2014-01-23 13:30:54'),(10,'D856','Wireless Business Solutions [WBS]','WBS','2014-01-23 13:30:54'),(11,'D860','Frogfoot Networks (Pty) Ltd','FROGGNP ','2014-01-23 13:30:54'),(12,'D861','MWEB Connect (Pty) Ltd','MWEBCON','2014-01-23 13:30:54'),(13,'D863','Multisource Telecoms (Pty) Ltd','MULTISOU','2014-01-23 13:30:54'),(14,'D864','Vodacom (Pty) Ltd','VODAGNP','2014-01-23 13:30:54'),(15,'D865','Skyconnect Internet CC','SKYCON','2014-01-23 13:30:54'),(16,'D866','TelFree Communications (Pty) Ltd ','TELFREE','2014-01-23 13:30:54'),(17,'D867','Skycall Networks (Pty) Ltd','SKYCALL','2014-01-23 13:30:54'),(18,'D871','Dow Networks (Pty) Ltd','DOWNETSA','2014-01-23 13:30:54'),(19,'D875','MTN Business Solutions (Pty) Ltd','MTNBSGNP','2014-01-23 13:30:54'),(20,'D876','Saicom Voice Services Pty Ltd','SVSGNP','2014-01-23 13:30:54'),(21,'D877','Virtual Card Acquiring (Pty) Ltd ','VCAGNP','2014-01-23 13:30:54'),(22,'D878','BT Communications Services South Africa (Pty) Ltd ','BTSAGNP','2014-01-23 13:30:54'),(23,'D882','Business Connections ','BCXGNP','2014-01-23 13:30:54'),(24,'D883','Hymax Talking Solutions (Pty) Ltd ','HTSGNP','2014-01-23 13:30:54'),(25,'D884','Rose Courtz Trading CC trading as BitCo','BITCOGNP ','2014-01-23 13:30:54'),(26,'D885','OHREN Telecom CC','OTELGNP','2014-01-23 13:30:54'),(27,'D891','MIA Telecoms (Pty) Ltd ','MIAGNP','2014-01-23 13:30:54'),(28,'D896','Platformity CC','PLATFORM','2014-01-23 13:30:54'),(29,'D004','Telkom Mobile SA Ltd ','TELKMOBL','2014-01-23 13:30:54'),(30,'D082','Vodacom (Pty) Ltd','VODACOM','2014-01-23 13:30:54'),(31,'D083','MTN (Pty) Ltd','MTN','2014-01-23 13:30:54'),(32,'D084','CellC (Pty) Ltd','CELLC','2014-01-23 13:30:54'),(33,'D004','Telkom Mobile SA Ltd','TELKMOBL','2017-05-25 12:25:25'),(34,'D082','Vodacom (Pty) Ltd','VODACOM','2017-05-25 12:25:33'),(35,'D083','MTN (Pty) Ltd','MTN','2017-05-25 12:25:38'),(36,'D084','CellC (Pty) Ltd','CELLC','2017-05-25 12:25:42'),(37,'D916','T-Systems (Pty) Ltd','TSYSTGNP','2017-05-25 12:25:47');


ALTER TABLE `routing_labels`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `routing_labels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

/* routing_labels completed */

/* for insert Ported Number in left pannel */

INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title` , `sub_group`) VALUES (NULL, 'host', 'Host', '0', 'default_system_input', 'set Host', '0000-00-00 00:00:00', '0', '0', 'ported_number','FTP Details');

INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title` , `sub_group`) VALUES (NULL, 'user', 'User', '0', 'default_system_input', 'set Database User', '0000-00-00 00:00:00', '0', '0', 'ported_number','FTP Details');

INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title` , `sub_group`) VALUES (NULL, 'password', 'Password', '0', 'default_system_input', 'set Database Password', '0000-00-00 00:00:00', '0', '0', 'ported_number','FTP Details');


INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL, 0, 0, 'services','portednumber','','portednumber_list', 'Ported Number List', '["main","list","search"]', 0, '2019-01-25 09:01:03', '5.50000');


INSERT INTO `cron_settings` (`id`, `name`, `command`, `exec_interval`, `creation_date`, `last_modified_date`, `last_execution_date`, `next_execution_date`, `status`, `file_path`) VALUES 
(NULL, 'GNP Number', 'hours', '1', UTC_TIMESTAMP(), UTC_TIMESTAMP(),'0000-00-00 00:00:00','0000-00-00 00:00:00', '0', 'wget -O - -q {BASE_URL}Xml_GNP_parser');

INSERT INTO `cron_settings` (`id`, `name`, `command`, `exec_interval`, `creation_date`, `last_modified_date`, `last_execution_date`, `next_execution_date`, `status`, `file_path`) VALUES 
(NULL, 'MNP Number', 'hours', '1', UTC_TIMESTAMP(), UTC_TIMESTAMP(),'0000-00-00 00:00:00','0000-00-00 00:00:00', '0', 'wget -O - -q {BASE_URL}xml_MNP_parser');


INSERT INTO `default_templates` (`id`, `name`, `subject`, `description`, `sms_template`, `alert_template`, `template`, `last_modified_date`, `reseller_id`, `is_email_enable`, `is_sms_enable`, `is_alert_enable`, `status`) VALUES (NULL, 'ported_number', 'Hi #user# Please find attached log file', 'to request log report of ported numbers', '', '', 'Hello,Please find requested log report for portednumbers', '1000-01-01 00:00:00.000000', '0', '0', '0', '0', '0');

INSERT INTO `default_templates` (`id`, `name`, `subject`, `description`, `sms_template`, `alert_template`, `template`, `last_modified_date`, `reseller_id`, `is_email_enable`, `is_sms_enable`, `is_alert_enable`, `status`) VALUES (NULL, 'ported_number_ftp_connect', 'Hi #user# Please Check for this mention date we are unable to connect FTP server to get daily files', 'to get notifications if FTP server is not getting connected', '', '', 'Hello,Please find requested log report for portednumbers', '1000-01-01 00:00:00.000000', '0', '0', '0', '0', '0');

INSERT INTO `default_templates` (`id`, `name`, `subject`, `description`, `sms_template`, `alert_template`, `template`, `last_modified_date`, `reseller_id`, `is_email_enable`, `is_sms_enable`, `is_alert_enable`, `status`) VALUES (NULL, 'ported_number_no_file', 'Hi #user# No file found on FTP server #date#', 'to request log report of ported numbers', '', '', 'Hello,Please find requested log report for portednumbers', '1000-01-01 00:00:00.000000', '0', '0', '0', '0', '0');
