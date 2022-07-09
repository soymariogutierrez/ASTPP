INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`, `sub_group`, `field_rules`) VALUES
(NULL, 'term_condition_url', 'Term and Condition URL', 'https://www.inextrix.com', 'default_system_input', 'set url for term and condition of number porting', '2019-04-01 10:32:33', 0, 0, 'Porting', '', '');


CREATE TABLE `request_number_porting` (
`id` int(11) NOT NULL,
`company_name` varchar(50) NOT NULL,
`company_address` varchar(300) NOT NULL,
`number_type` varchar(50) NOT NULL,
`number` varchar(50) NOT NULL,
`account_number` varchar(50) NOT NULL,
`reseller_id` int(11) NOT NULL,
`country_id` int(11) NOT NULL,
`provider` varchar(50) NOT NULL,
`provider_name` varchar(50) NOT NULL,
`port_date` date NOT NULL,
`file_name` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
`email` varchar(50) NOT NULL,
`creation` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
`status` int(11) NOT NULL,
`action` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
`note` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
`term_and_condition` varchar(50) NOT NULL,
`provider_id` int(11) NOT NULL,
`starthour1_0` varchar(50) NOT NULL,
`starthour2_0` varchar(50) NOT NULL,
`endhour1_0` varchar(50) NOT NULL,
`endhour2_0` varchar(50) NOT NULL,
`accountid` int(11) NOT NULL,
`request_port_time` varchar(50) NOT NULL,
`start_number` varchar(50) NOT NULL,
`end_number` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE `request_number_porting`
ADD PRIMARY KEY (`id`);

ALTER TABLE `request_number_porting`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


INSERT INTO `menu_modules` (`id`,`menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES
(NULL,'Number Porting', 'porting', 'porting/porting_status_list/', 'Porting', 'Numberporting.png', '0', 51.1);
update userlevels set module_permissions = concat( module_permissions, ',', ( SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = 0;
update userlevels set module_permissions = concat( module_permissions, ',', ( SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = -1;
update userlevels set module_permissions = concat( module_permissions, ',', ( SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = 1;


INSERT INTO `roles_and_permission` ( `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(0, 0, 'porting', 'porting', '', 'porting_status_list', 'Request a Number Port ', '[\"main\",\"list\",\"create\",\"delete\",\"edit\",\"search\"]', 0, '2019-01-25 09:01:05', '5.12000'),
(1, 0, 'porting', 'porting', '', 'porting_status_list', 'Request a Number Port',  '[\"main\",\"list\",\"create\",\"search\",\"edit\",\"delete\"]', 0, '2019-01-25 09:01:06', '5.12000');

INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`, `sub_group`, `field_rules`) VALUES (NULL, 'porting_admin_email_address', 'Admin Notification Email', 'admin@gmail.com', 'default_system_input', 'Set porting notification email address', '2019-04-01 00:00:00.000000', '0', '0', 'Porting', '', '');

INSERT INTO `default_templates` (`id`, `name`, `subject`, `description`, `sms_template`, `alert_template`, `template`, `last_modified_date`, `reseller_id`, `is_email_enable`, `is_sms_enable`, `is_alert_enable`, `status`) VALUES (NULL, 'porting_request', 'Your porting request has been #STATUS#.', 'Porting request notification template', 'Dear #NAME#,\r\nYour porting request has been #STATUS#.', '<p>Your porting request has been #STATUS#.</p>\r\n', '<p>Dear #NAME#,</p>\r\n\r\n<p>Your porting request has been #STATUS#.</p>\r\n\r\n<p>For more info, please visit on our website #COMPANY_WEBSITE# or contact to our support department at #COMPANY_EMAIL#.</p>\r\n\r\n<p>Thanks,<br />\r\n#COMPANY_NAME#</p>\r\n', '1000-01-01 00:00:00.000000', '0', '0', '0', '0', '0');

UPDATE `menu_modules` SET `menu_title` = 'Services', `priority` = '60.5' WHERE `module_name` = 'porting';

UPDATE `roles_and_permission` SET `menu_name` = 'services' WHERE `module_name` = 'porting';	

UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules WHERE module_url = 'porting/porting_status_list/' ) ) WHERE userlevelid = 2;

ALTER TABLE `request_number_porting` CHANGE `note` `note` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL;

INSERT INTO `roles_and_permission` ( `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(2, 0, 'services', 'porting', '', 'porting_status_list', 'Request a Number Port', '[\"main\",\"list\",\"create\",\"search\",\"edit\"]', 0, '2019-01-25 09:01:06', '5.12000');

UPDATE `roles_and_permission` SET `display_name` = 'Number Portability' WHERE `menu_name` = 'services' AND `module_name` = 'porting';

UPDATE `menu_modules` SET `menu_label` = 'Number Portability' WHERE `module_name` ='porting' AND   `menu_title` = 'Services';