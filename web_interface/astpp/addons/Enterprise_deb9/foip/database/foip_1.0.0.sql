CREATE TABLE IF NOT EXISTS `auth_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` char(80) NOT NULL DEFAULT '',
  `accountid` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-Active,1-inactive',
  `context` varchar(20) NOT NULL DEFAULT '',
  `creation_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account` (`accountid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1 ;


INSERT INTO `menu_modules` (`id`, `menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES (NULL, 'Auth Email', 'authemail', 'authemail/authemail_detail/', 'Configuration', '', 'APFaxer', '80.8');
UPDATE `userlevels` SET `module_permissions` = concat( `module_permissions`, ',', (  SELECT max( `id` ) FROM `menu_modules` ) ) WHERE `userlevelid` = -1;
UPDATE `userlevels` SET `module_permissions` = concat( `module_permissions`, ',', (  SELECT max( `id` ) FROM `menu_modules` ) ) WHERE `userlevelid` = 1;

INSERT INTO `menu_modules` (`id`, `menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES (NULL, 'User Auth Email', 'user', 'authemail/user_authemail_list/', 'Services', '', 'APFaxer', 3.11);
UPDATE `userlevels` SET `module_permissions` = concat( `module_permissions`, ',', (  SELECT max( `id` ) FROM `menu_modules` ) ) WHERE `userlevelid` = 0;
UPDATE `userlevels` SET `module_permissions` = concat( `module_permissions`, ',', (  SELECT max( `id` ) FROM `menu_modules` ) ) WHERE `userlevelid` = 3;

INSERT INTO `menu_modules` (`id`, `menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES (NULL, 'Faxer', 'web2fax', 'web2fax/web2fax_list/', 'Configuration', '', 'APFaxer', 80.8);
UPDATE `userlevels` SET `module_permissions` = concat( `module_permissions`, ',', (  SELECT max( `id` ) FROM `menu_modules` ) ) WHERE `userlevelid` = -1;
UPDATE `userlevels` SET `module_permissions` = concat( `module_permissions`, ',', (  SELECT max( `id` ) FROM `menu_modules` ) ) WHERE `userlevelid` = 1;
INSERT INTO `menu_modules` (`id`, `menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES (NULL, 'Faxer', 'user', 'web2fax/web2fax_list/', 'Services', '', 'APFaxer', 3.12);
UPDATE `userlevels` SET `module_permissions` = concat( `module_permissions`, ',', (  SELECT max( `id` ) FROM `menu_modules` ) ) WHERE `userlevelid` = 0;
UPDATE `userlevels` SET `module_permissions` = concat( `module_permissions`, ',', (  SELECT max( `id` ) FROM `menu_modules` ) ) WHERE `userlevelid` = 3;

CREATE TABLE IF NOT EXISTS `tbl_fax`(
  `id` int(11) NOT NULL,
  `uniqueid` varchar(150) NOT NULL,
  `accountid` int(11) NOT NULL,
  `reseller_id` int(11) NOT NULL DEFAULT '0',
  `sender` varchar(25) NOT NULL,
  `reciever` varchar(25) NOT NULL,
  `server` char(2) NOT NULL DEFAULT 'A',
  `fax_title` varchar(100) NOT NULL,
  `pricelist_id` int(11) NOT NULL,
  `outbound_rate` varchar(5000) NOT NULL,
  `origination_rate` varchar(5000) NOT NULL,
  `callstart` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_sent` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=pending, 1=success, 2=processing, 3=error, 4=fail',
  `status` char(25) NOT NULL DEFAULT 'PENDING',
  `file_name` varchar(50) NOT NULL,
  `status_message` varchar(250) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `number` varchar(50) NOT NULL,
  `type` tinyint(11) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fax_status` tinyint(11) NOT NULL COMMENT '0=send,1=receive',
  `sip_device` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


ALTER TABLE `tbl_fax` ADD PRIMARY KEY ( `id` ) ;
ALTER TABLE `tbl_fax` CHANGE `id` `id` INT( 11 ) NOT NULL AUTO_INCREMENT ;
ALTER TABLE `tbl_fax` ADD `fax_sent` TINYINT( 3 ) NOT NULL DEFAULT '0';
ALTER TABLE `tbl_fax` ADD `fax_email` VARCHAR( 50 ) NULL DEFAULT NULL ;

INSERT INTO `default_templates` (`id`, `name`, `subject`, `template`, `last_modified_date`, `reseller_id`) VALUES ('', 'fax_receive_mail', '[ Faxer ] You have a Fax From #SEND_NUMBER# ', '<p>Hello #NAME#</p>\n<p>Here is fax information</p>\n<p>Send Date: #SEND_DATE#</p>\n<p>Send Number: #SEND_NUMBER#</p>\n<p>Receive Number: #RECEIVE_NUMBER#</p>', '2017-07-12 05:52:13', 0);

INSERT INTO `default_templates` (`id`, `name`, `subject`, `template`, `last_modified_date`, `reseller_id`) VALUES ('', 'outbound_fax_mail', '[ Faxer ] Fax #STATUS# ', '<p>Hello #NAME#</p>\n<p>Here is fax information</p>\n<p>Send Date: #SEND_DATE#</p>\n<p>Send Number: #SEND_NUMBER#</p>\n<p>Receive Number: #RECEIVE_NUMBER#</p>\n<p>Send Pages: #FAX_PAGE#</p>\n<p>Fax time: #FAX_TIME#</p>\n<p>Fax sending #FAX_STATUS#</p>', '2017-09-11 11:47:05', 0);

ALTER TABLE `cdrs` CHANGE `calltype` `calltype` ENUM( 'STANDARD', 'DID', 'FREE', 'CALLINGCARD','LOCAL', 'FAX' ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'STANDARD';

ALTER TABLE `reseller_cdrs` CHANGE `calltype` `calltype` ENUM( 'STANDARD', 'DID', 'FREE', 'CALLINGCARD','LOCAL', 'FAX' ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'STANDARD';

INSERT INTO `system` (`id` ,`name` ,`display_name` ,`value` ,`field_type` ,`comment`  ,`reseller_id` ,`group_title`)
VALUES (NULL , 'send_fax_retries', 'Fax send Retries', '3', 'default_system_input', 'Set fax retry value', '0', 'fax');

INSERT INTO `system` (`id` ,`name` ,`display_name` ,`value` ,`field_type` ,`comment` ,`reseller_id`  ,
`group_title`)
VALUES (NULL , 'imap_email_id', 'Fax Email Id', 'youremail@gmail.com', 'default_system_input', 'Set Fax Email id here', '0','fax'), (NULL , 'imap_password', 'Fax Email Password','Password', 'default_system_input', 'Set Fax email addess password' , '0', 'fax'), (NULL , 'imap_host', 'Fax Email Host', 'Host', 'default_system_input', 'Set Fax Host here' , '0','fax');

INSERT INTO `system` (`id` ,`name` ,`display_name` ,`value` ,`field_type` ,`comment` ,`reseller_id` ,`group_title`)
VALUES (NULL , 'freeswitch_host', 'Fax Server', '127.0.0.1', 'default_system_input', 'Set here your Fax server with '','' separated Ex-127.0.0.1,127.0.0.2' , '0', 'fax');



INSERT INTO `did_call_types` (`id`, `call_type_code`, `call_type`) VALUES
(NULL, '6', 'FOIP');


INSERT INTO `cron_settings`(id,name,command,exec_interval,creation_date,last_modified_date,last_execution_date,next_execution_date,status,file_path) VALUES (null,'Send Fax','minutes',1,UTC_TIMESTAMP(),UTC_TIMESTAMP(),'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'wget --no-check-certificate -q -O- {BASE_URL}faxsend/index'),(null,'Fax2mail','minutes',1,UTC_TIMESTAMP(),UTC_TIMESTAMP(),'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'wget --no-check-certificate -q -O- {BASE_URL}sendFax/index');

