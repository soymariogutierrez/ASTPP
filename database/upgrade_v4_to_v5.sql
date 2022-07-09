
-- -----------------04-June-2020

UPDATE `roles_and_permission` SET `permissions` = '[\"main\",\"list\",\"delete\",\"edit\",\"forward\",\"search\",\"purchase\",\"buy_did\",\"available_did\",\"batch_update\"]' WHERE login_type = 1 and module_name='did' and module_url='did_list';
-- ----------------03-July-2020
UPDATE `roles_and_permission` SET `permissions` = '[\"main\",\"list\",\"export\",\"search\",\"delete\",\"default_language\"]' WHERE `login_type` = '0' and `module_url` = 'languages_list';
UPDATE `roles_and_permission` SET `permissions` = '[\"main\",\"list\",\"edit\"]', `display_name`='Company Profile' WHERE `login_type` = '1' and `module_url` = 'invoice_conf_list';
UPDATE `roles_and_permission` SET `permissions` = '["main","list","edit"]', `display_name`='Company Profile' WHERE `login_type` = '0' and `module_url` = 'invoice_conf_list';
UPDATE `roles_and_permission` SET `permissions` = '[\"main\",\"list\",\"create\",\"import\",\"delete\"]' WHERE `login_type` = '0' and `module_url` = 'database_restore';

UPDATE `roles_and_permission` SET `permissions` = '["main","list","new","edit","search"]' WHERE `login_type` = '1' and `module_url` = 'orders_list';
UPDATE `roles_and_permission` SET `permissions` = '["main","list","new","edit","search"]' WHERE `login_type` = '0' and `module_url` = 'orders_list';
UPDATE `roles_and_permission` SET `permissions` = '["main","list","assign"]' WHERE `module_url` = 'did_purchase_list';
-- ----------------05-Aug-2020
update `menu_modules` set `menu_label` = 'My order' where `module_url` = 'user/user_products_list/' and `module_name` = 'user';

-- ---------------24-Aug-2020
UPDATE `menu_modules` SET `menu_label` = 'Provider Summary' WHERE `module_url` = 'summary/provider/';

-- ----------------31-July-2020
ALTER TABLE `trunks` ADD `localization_id` INT NOT NULL;

-- -----------------18-aug-2020

UPDATE `menu_modules` SET `menu_title` = 'Reports',`priority` = '89.20' where `module_url` = "freeswitch/livecall_report/";
UPDATE `roles_and_permission` SET `menu_name` = 'reports',`priority` = '7.70000' WHERE `module_url` = 'livecall_report' and `module_name` ='freeswitch';
UPDATE `userlevels` SET `module_permissions` = concat( `module_permissions`, ',', (  SELECT max( `id` ) FROM `menu_modules` where `module_url` = "freeswitch/livecall_report/" ) ) WHERE `userlevelid` = 1;
INSERT INTO `roles_and_permission` (`login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES ('1', '0', 'reports', 'freeswitch', '', 'livecall_report', 'Live Calls', '[\"main\",\"list\"]', '0', '2019-01-25 09:01:05', '7.71');

-- ----------------29-sep-2020

ALTER TABLE `routes` ADD `effective_date` DATETIME NOT NULL;
ALTER TABLE `routes` DROP INDEX `code_rg_accid_key`, ADD UNIQUE `code_rg_accid_key` (`pattern`, `pricelist_id`, `accountid`, `effective_date`) USING BTREE;
ALTER TABLE `outbound_routes` ADD `effective_date` DATETIME NOT NULL;
ALTER TABLE `outbound_routes` DROP INDEX `pattern2`, ADD UNIQUE `pattern2` (`pattern`, `trunk_id`, `effective_date`) USING BTREE;
INSERT INTO `cron_settings` (`name`, `command`, `exec_interval`, `creation_date`, `last_modified_date`, `last_execution_date`, `next_execution_date`, `status`, `file_path`) VALUES 
( 'Rates Update', 'days', '1', UTC_TIMESTAMP(), UTC_TIMESTAMP(),'0000-00-00 00:00:00','0000-00-00 00:00:00', '0', 'wget --no-check-certificate -q -O- {BASE_URL}Rates_update/index');

-- ---------------20-oct-2020
DELETE from `system` S1 where S1.name="folder_path" AND NOT EXISTS 
(SELECT * FROM (select DISTINCT id from `system` where name="folder_path" group by name) as abc where abc.id=S1.id);

INSERT INTO `system` (`id` ,`name` ,`display_name` ,`value` ,`field_type` ,`comment` ,`reseller_id` ,`group_title`) SELECT * FROM (SELECT NULL , 'folder_path', 'Folder Path', '/var/www/html/astpp/', 'default_system_input', 'Set default ASTPP folder path' , '0', 'global') AS tmp WHERE NOT EXISTS ( SELECT name FROM `system` WHERE name = 'folder_path' );

-- ----------------03-Jul-2020
INSERT INTO `system` ( `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`, `sub_group`, `field_rules`) VALUES
( 'status', 'Status', '1', 'set_status', 'Set enable to activate CDR archive feature', '2019-11-08 19:07:34', 0, 0, 'term_and_condition', '', '');

INSERT INTO `system` ( `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`, `sub_group`, `field_rules`) VALUES
( 'url', 'Url', '1', 'default_system_input', 'Set enable to activate CDR archive feature', '2019-11-08 19:07:34', 0, 0, 'term_and_condition', '', '');

INSERT INTO `system` ( `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`, `sub_group`, `field_rules`) VALUES
( 'text', 'Text', '1', 'textarea', 'Set enable to activate CDR archive feature', '2019-11-08 19:07:34', 0, 0, 'term_and_condition', '', '');

-- ----------------06-NOV-20
INSERT INTO `default_templates` (`name`, `subject`, `description`, `sms_template`, `alert_template`, `template`, `last_modified_date`, `reseller_id`, `is_email_enable`, `is_sms_enable`, `is_alert_enable`, `status`) VALUES
('account_postcharge', 'Your account postcharge with #REFILLBALANCE#', 'Account postcharge notification template', 'Dear #FIRST_NAME#, Your account has been postcharge with #REFILLBALANCE#. Your new balance is #BALANCE#. Thanks, #COMPANY_NAME#', '<p>Your account has been postcharge with #REFILLBALANCE#. Your new balance is #BALANCE#.</p>\n', '<p>Dear #NAME#,</p>\n\n<p>Your account has been postcharge with #REFILLBALANCE#.</p>\n\n<p>Your account new balance is #BALANCE#.</p>\n\n<p>For more info, please visit on our website #COMPANY_WEBSITE# or contact to our support department at #COMPANY_EMAIL#.</p>\n\n<p>Thanks,<br />\n#COMPANY_NAME#</p>\n', '2019-01-26 10:53:45', 0, 0, 0, 0, 0);



-- ----------------11-NOV-20
update menu_modules set menu_label='Notification History',menu_title='Reports' where module_name='email' AND module_url='email/email_history_list/';

ALTER TABLE `mail_details` ADD `emailstatus` TINYINT(1) NOT NULL DEFAULT '0' COMMENT '0 : Send 1: Not send' AFTER `status`;

ALTER TABLE `mail_details` ADD `smsstatus` TINYINT(1) NOT NULL DEFAULT '0' COMMENT '0 : Send 1: Not send' AFTER `emailstatus`;

ALTER TABLE `mail_details` ADD `alertstatus` TINYINT(1) NOT NULL DEFAULT '0' COMMENT '0 : Send 1: Not send' AFTER `smsstatus`;

INSERT INTO `cron_settings`(id,name,command,exec_interval,creation_date,last_modified_date,last_execution_date,next_execution_date,status,file_path) VALUES (null,'Sms Broadcast','minutes',1,UTC_TIMESTAMP(),UTC_TIMESTAMP(),'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'wget --no-check-certificate -O - -q {BASE_URL}broadcastemail/broadcast_sms/');

INSERT INTO `cron_settings`(id,name,command,exec_interval,creation_date,last_modified_date,last_execution_date,next_execution_date,status,file_path) VALUES (null,'Push Broadcast','minutes',1,UTC_TIMESTAMP(),UTC_TIMESTAMP(),'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'wget --no-check-certificate -O - -q {BASE_URL}broadcastemail/broadcast_pushnotification/');

-- ----------------11-Nov-2020

ALTER TABLE `invoice_conf` ADD `smtp_port` int(11), ADD `smtp_host` varchar(255), ADD `smtp_user` varchar(255), ADD `smtp_pass` varchar(255), ADD `smtp_status` tinyint(1);
-- DELETE FROM `system` WHERE name='smtp_port';
-- DELETE FROM `system` WHERE name='smtp_host';
-- DELETE FROM `system` WHERE name='smtp_pass';
-- DELETE FROM `system` WHERE name='smtp_user';


-- ----------------26-Nov-2020
ALTER TABLE `invoice_conf` CHANGE `smtp_status` `smtp_status` TINYINT(1) NULL DEFAULT '1';

-- ----------------27-Nov-2020 added by manish query to give permission to reseller and customer to see Notification History under Report menu.
update userlevels set module_permissions = concat( module_permissions, ',', (  SELECT id FROM menu_modules where module_url = 'email/email_history_list/' and module_name = 'email') ) WHERE userlevelid = 0;

update menu_modules set menu_label='Notification History' where module_name='email' AND module_url='email/email_history_list/';

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL, 1, 0, 'reports', 'email', '', 'email_history_list', 'Notification History', '[\"main\",\"list\",\"search\"]', 0, '2019-01-25 09:01:03', '7.70001');


update userlevels set module_permissions = concat( module_permissions, ',', (  SELECT id FROM menu_modules where module_url = 'email/email_history_list/' and module_name = 'email') ) WHERE userlevelid = 1;

-- ----------------18-Dec-2020
ALTER TABLE `dids` ADD `description` VARCHAR(500) NOT NULL;



-- ----------------22-Dec-2020

ALTER TABLE `dids` ADD  `release_date` DATETIME NULL DEFAULT '0000-00-00 00:00:00';

ALTER TABLE `dids` ADD  `onhold_date` DATETIME NULL DEFAULT '0000-00-00 00:00:00';

ALTER TABLE `dids` ADD `is_package` TINYINT NOT NULL DEFAULT '0';

ALTER TABLE `dids` ADD `order_id` INT NOT NULL;

INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`, `sub_group`, `field_rules`)  VALUES (NULL, 'reservation_days', 'DID Reservation Days', '10', 'default_system_input','Set your default did reservation days', '2020-12-16 07:28:32', '0', '0', 'Packages', 'DID', '');

INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`, `sub_group`, `field_rules`) VALUES (NULL, 'did_reserve', 'DID Reservation', '0', 'enable_disable_option','Set DID Reservation for enable/disable', '2019-04-01 00:00:00.000000', '0', '0', 'Packages', 'DID', '');

-- ----------------23-Dec-2020

UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('email/email_history_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 0;

update menu_modules set module_url='notification/notification_list/', module_name='notification' where menu_label='Notification History';

INSERT INTO `menu_modules` (`menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES ('Notification History', 'user', 'user/user_notification_list/', 'Reports', '', '0', 82.1);

update userlevels set module_permissions = concat( module_permissions, ',', ( SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = 0;

update roles_and_permission set module_name = 'notification' , module_url='notification_list' where display_name ='Notification History' and login_type = 1 and menu_name='reports';

INSERT INTO `cron_settings`(id,name,command,exec_interval,creation_date,last_modified_date,last_execution_date,next_execution_date,status,file_path) VALUES (null,'DID on hold to active','minutes',1,UTC_TIMESTAMP(),UTC_TIMESTAMP(),'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'wget --no-check-certificate -O - -q {BASE_URL}didhold/dids_onhold/');

INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`, `sub_group`, `field_rules`) VALUES (NULL, 'rate_type_subscription', 'Rate Type', '', 'rate_type_subscription', 'Set default rate group for creating pacakge', '2020-12-16 07:28:32', '0', '0', 'Packages', 'Subscription', '');

INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`, `sub_group`, `field_rules`) VALUES (NULL, 'rate_type_did', 'Rate Type', '', 'rate_type_did', 'Set default rate group for creating did', '2019-04-01 00:00:00', '0', '0', 'Packages', 'DID', '');

ALTER TABLE `dids` ADD `rate_type` INT NOT NULL DEFAULT '0' COMMENT '0 for full price, 1 for max days, 2 from max minute, 3 for 1 or 2 both of one max';

ALTER TABLE `products` ADD `rate_type` INT NOT NULL DEFAULT '0' COMMENT '0 for full price, 1 for max days, 2 from max minute, 3 for 1 or 2 both of one max';


INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0, 'billing','user',' ','user_invoices_list', 'Invoices', '["main","list","search"]', 0, '2019-01-25 09:01:03', '1.00000'); 

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0, 'billing','user',' ','user_charges_history', 'Charges History', '["main","list","search"]', 0, '2019-01-25 09:01:03', '1.10000'); 

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0, 'billing','user',' ','user_refill_report', 'Refill Report', '["main","list","search"]', 0, '2019-01-25 09:01:03', '1.20000'); 

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0, 'inbound','user',' ','user_didlist', 'DIDs', '["main","list","search","batch_update","purchase"]', 0, '2019-01-25 09:01:03', '2.00000'); 

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0, 'inbound','did_purchase',' ','did_purchase_list', 'Bulk DID Assign', '["main","list","assign"]', 0, '2019-01-25 09:01:03', '2.10000');

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0, 'services','user',' ','user_products_list', 'Products', '["main","list","search"]', 0, '2019-01-25 09:01:03', '3.00000');

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0, 'services','user',' ','user_available_products', 'Order New', '["main","list"]', 0, '2019-01-25 09:01:03', '3.10000');

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0, 'services','user',' ','user_fund_transfer', 'Send Credit', '["main","list"]', 0, '2019-01-25 09:01:03', '3.20000');

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0, 'services','user',' ','user_refill_coupon_list', ' Refill Coupon', '["main","list"]', 0, '2019-01-25 09:01:03', '3.30000');

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0, 'services','products',' ','products_topuplist', ' TopUp', '["main","list"]', 0, '2019-01-25 09:01:03', '3.40000');

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0, 'calling_card','accessnumber',' ','accessnumber_list', ' Access Numbers', '["main","list","search","export"]', 0, '2019-01-25 09:01:03', '4.00000');

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0, 'calling_card','user',' ','user_animap_list', '  Pinless CLI', '["main","list","create","delete"]', 0, '2019-01-25 09:01:03', '4.10000');

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0, 'calling_card','user',' ','user_pin_add', '  Pin', '["main","list"]', 0, '2019-01-25 09:01:03', '4.20000');

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0, 'reports','user',' ','user_cdrs_report', '  CDRs', '["main","list","search","export"]', 0, '2019-01-25 09:01:03', '5.00000');



INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0,'reports','user','','user_notification_list', 'Notification History','["main","list","search"]', 0, '2019-01-25 09:01:03', '5.10000');

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0, 'rates','user',' ','user_rates_list', '  Rates', '["main","list","search","export"]', 0, '2019-01-25 09:01:03', '6.00000');

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0, 'my_account','user',' ','user_myprofile', '  Profile', '["main","list"]', 0, '2019-01-25 09:01:03', '7.00000');



INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0, 'my_account','user',' ','user_sipdevices', '  SIP Devices', '["main","list","create","edit","delete","search"]', 0, '2019-01-25 09:01:03', '7.10000');

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0, 'my_account','user',' ','user_ipmap', 'IP Settings', '["main","list","search","create","delete"]', 0, '2019-01-25 09:01:03', '7.20000');

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0, 'my_account','user',' ','user_speeddial', 'Speed Dial', '["main","list","edit","delete"]', 0, '2019-01-25 09:01:03', '7.30000');

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0, 'my_account','user',' ','user_alert_threshold', 'Alert Threshold', '["main","list"]', 0, '2019-01-25 09:01:03', '7.40000');

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0, 'my_account','user',' ','user_change_password', 'Change Password', '["main","list"]', 0, '2019-01-25 09:01:03', '7.50000');

INSERT INTO `permissions` (`id`, `name`, `reseller_id`, `description`, `login_type`, `permissions`, `edit_permissions`, `creation_date`, `modification_date`) VALUES
(NULL, 'Customer_permission', 0, 'Customer Permissions', 2, '{\"user\":{\"user_invoices_list\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\"},\"user_charges_history\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\"},\"user_refill_report\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\"},\"user_didlist\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\",\"batch_update\":\"0\",\"purchase\":\"0\",\"release\":\"0\"},\"user_products_list\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\"},\"user_available_products\":{\"main\":\"0\",\"list\":\"0\"},\"user_fund_transfer\":{\"main\":\"0\",\"list\":\"0\"},\"user_refill_coupon_list\":{\"main\":\"0\",\"list\":\"0\"},\"user_animap_list\":{\"main\":\"0\",\"list\":\"0\",\"create\":\"0\",\"delete\":\"0\"},\"user_pin_add\":{\"main\":\"0\",\"list\":\"0\"},\"user_cdrs_report\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\",\"export\":\"0\"},\"user_rates_list\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\",\"export\":\"0\"},\"user_myprofile\":{\"main\":\"0\",\"list\":\"0\"},\"user_sipdevices\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\",\"create\":\"0\",\"delete\":\"0\",\"edit\":\"0\"},\"user_speeddial\":{\"main\":\"0\",\"list\":\"0\",\"edit\":\"0\",\"delete\":\"0\"},\"user_alert_threshold\":{\"main\":\"0\",\"list\":\"0\"},\"user_change_password\":{\"main\":\"0\",\"list\":\"0\"}},\"did_purchase\":{\"did_purchase_list\":{\"main\":\"0\",\"list\":\"0\",\"assign\":\"0\"}},\"products\":{\"products_topuplist\":{\"main\":\"0\",\"list\":\"0\"}},\"accessnumber\":{\"accessnumber_list\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\",\"export\":\"0\"}},\"email\":{\"email_history_list\":{\"main\":\"0\",\"list\":\"0\",\"search\":\"0\"}}}', '', '2020-12-23 04:37:24', '2020-12-28 09:06:47');

UPDATE accounts SET permission_id = (SELECT id FROM permissions WHERE `login_type` = 2) WHERE type = 0;

INSERT INTO `menu_modules` (`menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES
('Timezone', 'systems', 'systems/timezone_list/', 'Configuration', '', '0', 90.7);

update userlevels set module_permissions = concat( module_permissions, ',', ( SELECT max(
id ) FROM menu_modules ) ) WHERE userlevelid = -1;
update userlevels set module_permissions = concat( module_permissions, ',', ( SELECT max(
id ) FROM menu_modules ) ) WHERE userlevelid = 2;

INSERT INTO `cron_settings`(id,name,command,exec_interval,creation_date,last_modified_date,last_execution_date,next_execution_date,status,file_path) VALUES (null,'Timezone Update','hour',1,UTC_TIMESTAMP(),UTC_TIMESTAMP(),'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'wget --no-check-certificate -O - -q {BASE_URL}timezone_change/timezone_update/');

-- ----------------------01-01-2021

DROP TABLE IF EXISTS `timezone`;


UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules WHERE module_url = 'permissions/permissions_list/' ) ) WHERE userlevelid = 1;

-- --------------------------04-01-2021

UPDATE `translations` SET module_name='Edit SIP Device' where module_name='Edit SIP device';


-- -----------------11-01-2021
ALTER TABLE `reseller_cdrs` ADD `trunk_id` INT NOT NULL;

CREATE TABLE `timezone` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gmttime` varchar(255) DEFAULT NULL,
  `gmtoffset` bigint NOT NULL DEFAULT '0',
  `timezone_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `timezone_digit` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `timezone` (`id`, `gmttime`, `gmtoffset`, `timezone_name`, `timezone_digit`) VALUES
(NULL, 'GMT+01:00', 3600, 'Europe/Andorra', '1'),
(NULL, 'GMT+04:00', 14400, 'Asia/Dubai', '4'),
(NULL, 'GMT+04:30', 16200, 'Asia/Kabul', '4'),
(NULL, 'GMT-04:00', -14400, 'America/Antigua', '-4'),
(NULL, 'GMT-04:00', -14400, 'America/Anguilla', '-4'),
(NULL, 'GMT+01:00', 3600, 'Europe/Tirane', '1'),
(NULL, 'GMT+04:00', 14400, 'Asia/Yerevan', '4'),
(NULL, 'GMT+01:00', 3600, 'Africa/Luanda', '1'),
(NULL, 'GMT+11:00', 39600, 'Antarctica/Casey', '11'),
(NULL, 'GMT+07:00', 25200, 'Antarctica/Davis', '7'),
(NULL, 'GMT+10:00', 36000, 'Antarctica/DumontDUrville', '10'),
(NULL, 'GMT+05:00', 18000, 'Antarctica/Mawson', '5'),
(NULL, 'GMT+13:00', 46800, 'Antarctica/McMurdo', '13'),
(NULL, 'GMT-03:00', -10800, 'Antarctica/Palmer', '-3'),
(NULL, 'GMT-03:00', -10800, 'Antarctica/Rothera', '-3'),
(NULL, 'GMT+03:00', 10800, 'Antarctica/Syowa', '3'),
(NULL, 'GMT+00:00', 0, 'Antarctica/Troll', '0'),
(NULL, 'GMT+06:00', 21600, 'Antarctica/Vostok', '6'),
(NULL, 'GMT-03:00', -10800, 'America/Argentina/Buenos_Aires', '-3'),
(NULL, 'GMT-03:00', -10800, 'America/Argentina/Catamarca', '-3'),
(NULL, 'GMT-03:00', -10800, 'America/Argentina/Cordoba', '-3'),
(NULL, 'GMT-03:00', -10800, 'America/Argentina/Jujuy', '-3'),
(NULL, 'GMT-03:00', -10800, 'America/Argentina/La_Rioja', '-3'),
(NULL, 'GMT-03:00', -10800, 'America/Argentina/Mendoza', '-3'),
(NULL, 'GMT-03:00', -10800, 'America/Argentina/Rio_Gallegos', '-3'),
(NULL, 'GMT-03:00', -10800, 'America/Argentina/Salta', '-3'),
(NULL, 'GMT-03:00', -10800, 'America/Argentina/San_Juan', '-3'),
(NULL, 'GMT-03:00', -10800, 'America/Argentina/San_Luis', '-3'),
(NULL, 'GMT-03:00', -10800, 'America/Argentina/Tucuman', '-3'),
(NULL, 'GMT-03:00', -10800, 'America/Argentina/Ushuaia', '-3'),
(NULL, 'GMT-11:00', -39600, 'Pacific/Pago_Pago', '-11'),
(NULL, 'GMT+01:00', 3600, 'Europe/Vienna', '1'),
(NULL, 'GMT+11:00', 39600, 'Antarctica/Macquarie', '11'),
(NULL, 'GMT+10:30', 37800, 'Australia/Adelaide', '10'),
(NULL, 'GMT+10:00', 36000, 'Australia/Brisbane', '10'),
(NULL, 'GMT+10:30', 37800, 'Australia/Broken_Hill', '10'),
(NULL, 'GMT+11:00', 39600, 'Australia/Currie', '11'),
(NULL, 'GMT+09:30', 34200, 'Australia/Darwin', '9'),
(NULL, 'GMT+08:45', 31500, 'Australia/Eucla', '8'),
(NULL, 'GMT+11:00', 39600, 'Australia/Hobart', '11'),
(NULL, 'GMT+10:00', 36000, 'Australia/Lindeman', '10'),
(NULL, 'GMT+11:00', 39600, 'Australia/Lord_Howe', '11'),
(NULL, 'GMT+11:00', 39600, 'Australia/Melbourne', '11'),
(NULL, 'GMT+08:00', 28800, 'Australia/Perth', '8'),
(NULL, 'GMT+11:00', 39600, 'Australia/Sydney', '11'),
(NULL, 'GMT-04:00', -14400, 'America/Aruba', '-4'),
(NULL, 'GMT+02:00', 7200, 'Europe/Mariehamn', '2'),
(NULL, 'GMT+04:00', 14400, 'Asia/Baku', '4'),
(NULL, 'GMT+01:00', 3600, 'Europe/Sarajevo', '1'),
(NULL, 'GMT-04:00', -14400, 'America/Barbados', '-4'),
(NULL, 'GMT+06:00', 21600, 'Asia/Dhaka', '6'),
(NULL, 'GMT+01:00', 3600, 'Europe/Brussels', '1'),
(NULL, 'GMT+00:00', 0, 'Africa/Ouagadougou', '0'),
(NULL, 'GMT+02:00', 7200, 'Europe/Sofia', '2'),
(NULL, 'GMT+03:00', 10800, 'Asia/Bahrain', '3'),
(NULL, 'GMT+02:00', 7200, 'Africa/Bujumbura', '2'),
(NULL, 'GMT+01:00', 3600, 'Africa/Porto-Novo', '1'),
(NULL, 'GMT-04:00', -14400, 'America/St_Barthelemy', '-4'),
(NULL, 'GMT-04:00', -14400, 'Atlantic/Bermuda', '-4'),
(NULL, 'GMT+08:00', 28800, 'Asia/Brunei', '8'),
(NULL, 'GMT-04:00', -14400, 'America/La_Paz', '-4'),
(NULL, 'GMT-04:00', -14400, 'America/Kralendijk', '-4'),
(NULL, 'GMT-03:00', -10800, 'America/Araguaina', '-3'),
(NULL, 'GMT-03:00', -10800, 'America/Bahia', '-3'),
(NULL, 'GMT-03:00', -10800, 'America/Belem', '-3'),
(NULL, 'GMT-04:00', -14400, 'America/Boa_Vista', '-4'),
(NULL, 'GMT-04:00', -14400, 'America/Campo_Grande', '-4'),
(NULL, 'GMT-04:00', -14400, 'America/Cuiaba', '-4'),
(NULL, 'GMT-05:00', -18000, 'America/Eirunepe', '-5'),
(NULL, 'GMT-03:00', -10800, 'America/Fortaleza', '-3'),
(NULL, 'GMT-03:00', -10800, 'America/Maceio', '-3'),
(NULL, 'GMT-04:00', -14400, 'America/Manaus', '-4'),
(NULL, 'GMT-02:00', -7200, 'America/Noronha', '-2'),
(NULL, 'GMT-04:00', -14400, 'America/Porto_Velho', '-4'),
(NULL, 'GMT-03:00', -10800, 'America/Recife', '-3'),
(NULL, 'GMT-05:00', -18000, 'America/Rio_Branco', '-5'),
(NULL, 'GMT-03:00', -10800, 'America/Santarem', '-3'),
(NULL, 'GMT-03:00', -10800, 'America/Sao_Paulo', '-3'),
(NULL, 'GMT-05:00', -18000, 'America/Nassau', '-5'),
(NULL, 'GMT+06:00', 21600, 'Asia/Thimphu', '6'),
(NULL, 'GMT+02:00', 7200, 'Africa/Gaborone', '2'),
(NULL, 'GMT+03:00', 10800, 'Europe/Minsk', '3'),
(NULL, 'GMT-06:00', -21600, 'America/Belize', '-6'),
(NULL, 'GMT-05:00', -18000, 'America/Atikokan', '-5'),
(NULL, 'GMT-04:00', -14400, 'America/Blanc-Sablon', '-4'),
(NULL, 'GMT-07:00', -25200, 'America/Cambridge_Bay', '-7'),
(NULL, 'GMT-07:00', -25200, 'America/Creston', '-7'),
(NULL, 'GMT-07:00', -25200, 'America/Dawson', '-7'),
(NULL, 'GMT-07:00', -25200, 'America/Dawson_Creek', '-7'),
(NULL, 'GMT-07:00', -25200, 'America/Edmonton', '-7'),
(NULL, 'GMT-07:00', -25200, 'America/Fort_Nelson', '-7'),
(NULL, 'GMT-04:00', -14400, 'America/Glace_Bay', '-4'),
(NULL, 'GMT-04:00', -14400, 'America/Goose_Bay', '-4'),
(NULL, 'GMT-04:00', -14400, 'America/Halifax', '-4'),
(NULL, 'GMT-07:00', -25200, 'America/Inuvik', '-7'),
(NULL, 'GMT-05:00', -18000, 'America/Iqaluit', '-5'),
(NULL, 'GMT-04:00', -14400, 'America/Moncton', '-4'),
(NULL, 'GMT-05:00', -18000, 'America/Nipigon', '-5'),
(NULL, 'GMT-05:00', -18000, 'America/Pangnirtung', '-5'),
(NULL, 'GMT-06:00', -21600, 'America/Rainy_River', '-6'),
(NULL, 'GMT-06:00', -21600, 'America/Rankin_Inlet', '-6'),
(NULL, 'GMT-06:00', -21600, 'America/Regina', '-6'),
(NULL, 'GMT-06:00', -21600, 'America/Resolute', '-6'),
(NULL, 'GMT-03:30', -12600, 'America/St_Johns', '-4'),
(NULL, 'GMT-06:00', -21600, 'America/Swift_Current', '-6'),
(NULL, 'GMT-05:00', -18000, 'America/Thunder_Bay', '-5'),
(NULL, 'GMT-05:00', -18000, 'America/Toronto', '-5'),
(NULL, 'GMT-08:00', -28800, 'America/Vancouver', '-8'),
(NULL, 'GMT-07:00', -25200, 'America/Whitehorse', '-7'),
(NULL, 'GMT-06:00', -21600, 'America/Winnipeg', '-6'),
(NULL, 'GMT-07:00', -25200, 'America/Yellowknife', '-7'),
(NULL, 'GMT+06:30', 23400, 'Indian/Cocos', '6'),
(NULL, 'GMT+01:00', 3600, 'Africa/Kinshasa', '1'),
(NULL, 'GMT+02:00', 7200, 'Africa/Lubumbashi', '2'),
(NULL, 'GMT+01:00', 3600, 'Africa/Bangui', '1'),
(NULL, 'GMT+01:00', 3600, 'Africa/Brazzaville', '1'),
(NULL, 'GMT+01:00', 3600, 'Europe/Zurich', '1'),
(NULL, 'GMT+00:00', 0, 'Africa/Abidjan', '0'),
(NULL, 'GMT-10:00', -36000, 'Pacific/Rarotonga', '-10'),
(NULL, 'GMT-03:00', -10800, 'America/Punta_Arenas', '-3'),
(NULL, 'GMT-03:00', -10800, 'America/Santiago', '-3'),
(NULL, 'GMT-05:00', -18000, 'Pacific/Easter', '-5'),
(NULL, 'GMT+01:00', 3600, 'Africa/Douala', '1'),
(NULL, 'GMT+08:00', 28800, 'Asia/Shanghai', '8'),
(NULL, 'GMT+06:00', 21600, 'Asia/Urumqi', '6'),
(NULL, 'GMT-05:00', -18000, 'America/Bogota', '-5'),
(NULL, 'GMT-06:00', -21600, 'America/Costa_Rica', '-6'),
(NULL, 'GMT-05:00', -18000, 'America/Havana', '-5'),
(NULL, 'GMT-01:00', -3600, 'Atlantic/Cape_Verde', '-1'),
(NULL, 'GMT-04:00', -14400, 'America/Curacao', '-4'),
(NULL, 'GMT+07:00', 25200, 'Indian/Christmas', '7'),
(NULL, 'GMT+02:00', 7200, 'Asia/Famagusta', '2'),
(NULL, 'GMT+02:00', 7200, 'Asia/Nicosia', '2'),
(NULL, 'GMT+01:00', 3600, 'Europe/Prague', '1'),
(NULL, 'GMT+01:00', 3600, 'Europe/Berlin', '1'),
(NULL, 'GMT+01:00', 3600, 'Europe/Busingen', '1'),
(NULL, 'GMT+03:00', 10800, 'Africa/Djibouti', '3'),
(NULL, 'GMT+01:00', 3600, 'Europe/Copenhagen', '1'),
(NULL, 'GMT-04:00', -14400, 'America/Dominica', '-4'),
(NULL, 'GMT-04:00', -14400, 'America/Santo_Domingo', '-4'),
(NULL, 'GMT+01:00', 3600, 'Africa/Algiers', '1'),
(NULL, 'GMT-05:00', -18000, 'America/Guayaquil', '-5'),
(NULL, 'GMT-06:00', -21600, 'Pacific/Galapagos', '-6'),
(NULL, 'GMT+02:00', 7200, 'Europe/Tallinn', '2'),
(NULL, 'GMT+02:00', 7200, 'Africa/Cairo', '2'),
(NULL, 'GMT+01:00', 3600, 'Africa/El_Aaiun', '1'),
(NULL, 'GMT+03:00', 10800, 'Africa/Asmara', '3'),
(NULL, 'GMT+01:00', 3600, 'Africa/Ceuta', '1'),
(NULL, 'GMT+00:00', 0, 'Atlantic/Canary', '0'),
(NULL, 'GMT+01:00', 3600, 'Europe/Madrid', '1'),
(NULL, 'GMT+03:00', 10800, 'Africa/Addis_Ababa', '3'),
(NULL, 'GMT+02:00', 7200, 'Europe/Helsinki', '2'),
(NULL, 'GMT+13:00', 46800, 'Pacific/Fiji', '13'),
(NULL, 'GMT-03:00', -10800, 'Atlantic/Stanley', '-3'),
(NULL, 'GMT+10:00', 36000, 'Pacific/Chuuk', '10'),
(NULL, 'GMT+11:00', 39600, 'Pacific/Kosrae', '11'),
(NULL, 'GMT+11:00', 39600, 'Pacific/Pohnpei', '11'),
(NULL, 'GMT+00:00', 0, 'Atlantic/Faroe', '0'),
(NULL, 'GMT+01:00', 3600, 'Europe/Paris', '1'),
(NULL, 'GMT+01:00', 3600, 'Africa/Libreville', '1'),
(NULL, 'GMT+00:00', 0, 'Europe/London', '0'),
(NULL, 'GMT-04:00', -14400, 'America/Grenada', '-4'),
(NULL, 'GMT+04:00', 14400, 'Asia/Tbilisi', '4'),
(NULL, 'GMT-03:00', -10800, 'America/Cayenne', '-3'),
(NULL, 'GMT+00:00', 0, 'Europe/Guernsey', '0'),
(NULL, 'GMT+00:00', 0, 'Africa/Accra', '0'),
(NULL, 'GMT+01:00', 3600, 'Europe/Gibraltar', '1'),
(NULL, 'GMT+00:00', 0, 'America/Danmarkshavn', '0'),
(NULL, 'GMT-03:00', -10800, 'America/Nuuk', '-3'),
(NULL, 'GMT-01:00', -3600, 'America/Scoresbysund', '-1'),
(NULL, 'GMT-04:00', -14400, 'America/Thule', '-4'),
(NULL, 'GMT+00:00', 0, 'Africa/Banjul', '0'),
(NULL, 'GMT+00:00', 0, 'Africa/Conakry', '0'),
(NULL, 'GMT-04:00', -14400, 'America/Guadeloupe', '-4'),
(NULL, 'GMT+01:00', 3600, 'Africa/Malabo', '1'),
(NULL, 'GMT+02:00', 7200, 'Europe/Athens', '2'),
(NULL, 'GMT-02:00', -7200, 'Atlantic/South_Georgia', '-2'),
(NULL, 'GMT-06:00', -21600, 'America/Guatemala', '-6'),
(NULL, 'GMT+10:00', 36000, 'Pacific/Guam', '10'),
(NULL, 'GMT+00:00', 0, 'Africa/Bissau', '0'),
(NULL, 'GMT-04:00', -14400, 'America/Guyana', '-4'),
(NULL, 'GMT+08:00', 28800, 'Asia/Hong_Kong', '8'),
(NULL, 'GMT-06:00', -21600, 'America/Tegucigalpa', '-6'),
(NULL, 'GMT+01:00', 3600, 'Europe/Zagreb', '1'),
(NULL, 'GMT-05:00', -18000, 'America/Port-au-Prince', '-5'),
(NULL, 'GMT+01:00', 3600, 'Europe/Budapest', '1'),
(NULL, 'GMT+07:00', 25200, 'Asia/Jakarta', '7'),
(NULL, 'GMT+09:00', 32400, 'Asia/Jayapura', '9'),
(NULL, 'GMT+08:00', 28800, 'Asia/Makassar', '8'),
(NULL, 'GMT+07:00', 25200, 'Asia/Pontianak', '7'),
(NULL, 'GMT+00:00', 0, 'Europe/Dublin', '0'),
(NULL, 'GMT+02:00', 7200, 'Asia/Jerusalem', '2'),
(NULL, 'GMT+00:00', 0, 'Europe/Isle_of_Man', '0'),
(NULL, 'GMT+05:30', 19800, 'Asia/Kolkata', '5'),
(NULL, 'GMT+06:00', 21600, 'Indian/Chagos', '6'),
(NULL, 'GMT+03:00', 10800, 'Asia/Baghdad', '3'),
(NULL, 'GMT+03:30', 12600, 'Asia/Tehran', '3'),
(NULL, 'GMT+00:00', 0, 'Atlantic/Reykjavik', '0'),
(NULL, 'GMT+01:00', 3600, 'Europe/Rome', '1'),
(NULL, 'GMT+00:00', 0, 'Europe/Jersey', '0'),
(NULL, 'GMT-05:00', -18000, 'America/Jamaica', '-5'),
(NULL, 'GMT+02:00', 7200, 'Asia/Amman', '2'),
(NULL, 'GMT+09:00', 32400, 'Asia/Tokyo', '9'),
(NULL, 'GMT+03:00', 10800, 'Africa/Nairobi', '3'),
(NULL, 'GMT+06:00', 21600, 'Asia/Bishkek', '6'),
(NULL, 'GMT+07:00', 25200, 'Asia/Phnom_Penh', '7'),
(NULL, 'GMT+13:00', 46800, 'Pacific/Enderbury', '13'),
(NULL, 'GMT+14:00', 50400, 'Pacific/Kiritimati', '14'),
(NULL, 'GMT+12:00', 43200, 'Pacific/Tarawa', '12'),
(NULL, 'GMT+03:00', 10800, 'Indian/Comoro', '3'),
(NULL, 'GMT-04:00', -14400, 'America/St_Kitts', '-4'),
(NULL, 'GMT+09:00', 32400, 'Asia/Pyongyang', '9'),
(NULL, 'GMT+09:00', 32400, 'Asia/Seoul', '9'),
(NULL, 'GMT+03:00', 10800, 'Asia/Kuwait', '3'),
(NULL, 'GMT-05:00', -18000, 'America/Cayman', '-5'),
(NULL, 'GMT+06:00', 21600, 'Asia/Almaty', '6'),
(NULL, 'GMT+05:00', 18000, 'Asia/Aqtau', '5'),
(NULL, 'GMT+05:00', 18000, 'Asia/Aqtobe', '5'),
(NULL, 'GMT+05:00', 18000, 'Asia/Atyrau', '5'),
(NULL, 'GMT+05:00', 18000, 'Asia/Oral', '5'),
(NULL, 'GMT+06:00', 21600, 'Asia/Qostanay', '6'),
(NULL, 'GMT+05:00', 18000, 'Asia/Qyzylorda', '5'),
(NULL, 'GMT+07:00', 25200, 'Asia/Vientiane', '7'),
(NULL, 'GMT+02:00', 7200, 'Asia/Beirut', '2'),
(NULL, 'GMT-04:00', -14400, 'America/St_Lucia', '-4'),
(NULL, 'GMT+01:00', 3600, 'Europe/Vaduz', '1'),
(NULL, 'GMT+05:30', 19800, 'Asia/Colombo', '5'),
(NULL, 'GMT+00:00', 0, 'Africa/Monrovia', '0'),
(NULL, 'GMT+02:00', 7200, 'Africa/Maseru', '2'),
(NULL, 'GMT+02:00', 7200, 'Europe/Vilnius', '2'),
(NULL, 'GMT+01:00', 3600, 'Europe/Luxembourg', '1'),
(NULL, 'GMT+02:00', 7200, 'Europe/Riga', '2'),
(NULL, 'GMT+02:00', 7200, 'Africa/Tripoli', '2'),
(NULL, 'GMT+01:00', 3600, 'Africa/Casablanca', '1'),
(NULL, 'GMT+01:00', 3600, 'Europe/Monaco', '1'),
(NULL, 'GMT+02:00', 7200, 'Europe/Chisinau', '2'),
(NULL, 'GMT+01:00', 3600, 'Europe/Podgorica', '1'),
(NULL, 'GMT-04:00', -14400, 'America/Marigot', '-4'),
(NULL, 'GMT+03:00', 10800, 'Indian/Antananarivo', '3'),
(NULL, 'GMT+12:00', 43200, 'Pacific/Kwajalein', '12'),
(NULL, 'GMT+12:00', 43200, 'Pacific/Majuro', '12'),
(NULL, 'GMT+01:00', 3600, 'Europe/Skopje', '1'),
(NULL, 'GMT+00:00', 0, 'Africa/Bamako', '0'),
(NULL, 'GMT+06:30', 23400, 'Asia/Yangon', '6'),
(NULL, 'GMT+08:00', 28800, 'Asia/Choibalsan', '8'),
(NULL, 'GMT+07:00', 25200, 'Asia/Hovd', '7'),
(NULL, 'GMT+08:00', 28800, 'Asia/Ulaanbaatar', '8'),
(NULL, 'GMT+08:00', 28800, 'Asia/Macau', '8'),
(NULL, 'GMT+10:00', 36000, 'Pacific/Saipan', '10'),
(NULL, 'GMT-04:00', -14400, 'America/Martinique', '-4'),
(NULL, 'GMT+00:00', 0, 'Africa/Nouakchott', '0'),
(NULL, 'GMT-04:00', -14400, 'America/Montserrat', '-4'),
(NULL, 'GMT+01:00', 3600, 'Europe/Malta', '1'),
(NULL, 'GMT+04:00', 14400, 'Indian/Mauritius', '4'),
(NULL, 'GMT+05:00', 18000, 'Indian/Maldives', '5'),
(NULL, 'GMT+02:00', 7200, 'Africa/Blantyre', '2'),
(NULL, 'GMT-06:00', -21600, 'America/Bahia_Banderas', '-6'),
(NULL, 'GMT-05:00', -18000, 'America/Cancun', '-5'),
(NULL, 'GMT-07:00', -25200, 'America/Chihuahua', '-7'),
(NULL, 'GMT-07:00', -25200, 'America/Hermosillo', '-7'),
(NULL, 'GMT-06:00', -21600, 'America/Matamoros', '-6'),
(NULL, 'GMT-07:00', -25200, 'America/Mazatlan', '-7'),
(NULL, 'GMT-06:00', -21600, 'America/Merida', '-6'),
(NULL, 'GMT-06:00', -21600, 'America/Mexico_City', '-6'),
(NULL, 'GMT-06:00', -21600, 'America/Monterrey', '-6'),
(NULL, 'GMT-07:00', -25200, 'America/Ojinaga', '-7'),
(NULL, 'GMT-08:00', -28800, 'America/Tijuana', '-8'),
(NULL, 'GMT+08:00', 28800, 'Asia/Kuala_Lumpur', '8'),
(NULL, 'GMT+08:00', 28800, 'Asia/Kuching', '8'),
(NULL, 'GMT+02:00', 7200, 'Africa/Maputo', '2'),
(NULL, 'GMT+02:00', 7200, 'Africa/Windhoek', '2'),
(NULL, 'GMT+11:00', 39600, 'Pacific/Noumea', '11'),
(NULL, 'GMT+01:00', 3600, 'Africa/Niamey', '1'),
(NULL, 'GMT+12:00', 43200, 'Pacific/Norfolk', '12'),
(NULL, 'GMT+01:00', 3600, 'Africa/Lagos', '1'),
(NULL, 'GMT-06:00', -21600, 'America/Managua', '-6'),
(NULL, 'GMT+01:00', 3600, 'Europe/Amsterdam', '1'),
(NULL, 'GMT+01:00', 3600, 'Europe/Oslo', '1'),
(NULL, 'GMT+05:45', 20700, 'Asia/Kathmandu', '5'),
(NULL, 'GMT+12:00', 43200, 'Pacific/Nauru', '12'),
(NULL, 'GMT-11:00', -39600, 'Pacific/Niue', '-11'),
(NULL, 'GMT+13:00', 46800, 'Pacific/Auckland', '13'),
(NULL, 'GMT+13:45', 49500, 'Pacific/Chatham', '13'),
(NULL, 'GMT+04:00', 14400, 'Asia/Muscat', '4'),
(NULL, 'GMT-05:00', -18000, 'America/Panama', '-5'),
(NULL, 'GMT-05:00', -18000, 'America/Lima', '-5'),
(NULL, 'GMT-09:00', -32400, 'Pacific/Gambier', '-9'),
(NULL, 'GMT-09:30', -34200, 'Pacific/Marquesas', '-10'),
(NULL, 'GMT-10:00', -36000, 'Pacific/Tahiti', '-10'),
(NULL, 'GMT+11:00', 39600, 'Pacific/Bougainville', '11'),
(NULL, 'GMT+10:00', 36000, 'Pacific/Port_Moresby', '10'),
(NULL, 'GMT+08:00', 28800, 'Asia/Manila', '8'),
(NULL, 'GMT+05:00', 18000, 'Asia/Karachi', '5'),
(NULL, 'GMT+01:00', 3600, 'Europe/Warsaw', '1'),
(NULL, 'GMT-03:00', -10800, 'America/Miquelon', '-3'),
(NULL, 'GMT-08:00', -28800, 'Pacific/Pitcairn', '-8'),
(NULL, 'GMT-04:00', -14400, 'America/Puerto_Rico', '-4'),
(NULL, 'GMT+02:00', 7200, 'Asia/Gaza', '2'),
(NULL, 'GMT+02:00', 7200, 'Asia/Hebron', '2'),
(NULL, 'GMT-01:00', -3600, 'Atlantic/Azores', '-1'),
(NULL, 'GMT+00:00', 0, 'Atlantic/Madeira', '0'),
(NULL, 'GMT+00:00', 0, 'Europe/Lisbon', '0'),
(NULL, 'GMT+09:00', 32400, 'Pacific/Palau', '9'),
(NULL, 'GMT-03:00', -10800, 'America/Asuncion', '-3'),
(NULL, 'GMT+03:00', 10800, 'Asia/Qatar', '3'),
(NULL, 'GMT+04:00', 14400, 'Indian/Reunion', '4'),
(NULL, 'GMT+02:00', 7200, 'Europe/Bucharest', '2'),
(NULL, 'GMT+01:00', 3600, 'Europe/Belgrade', '1'),
(NULL, 'GMT+12:00', 43200, 'Asia/Anadyr', '12'),
(NULL, 'GMT+07:00', 25200, 'Asia/Barnaul', '7'),
(NULL, 'GMT+09:00', 32400, 'Asia/Chita', '9'),
(NULL, 'GMT+08:00', 28800, 'Asia/Irkutsk', '8'),
(NULL, 'GMT+12:00', 43200, 'Asia/Kamchatka', '12'),
(NULL, 'GMT+09:00', 32400, 'Asia/Khandyga', '9'),
(NULL, 'GMT+07:00', 25200, 'Asia/Krasnoyarsk', '7'),
(NULL, 'GMT+11:00', 39600, 'Asia/Magadan', '11'),
(NULL, 'GMT+07:00', 25200, 'Asia/Novokuznetsk', '7'),
(NULL, 'GMT+07:00', 25200, 'Asia/Novosibirsk', '7'),
(NULL, 'GMT+06:00', 21600, 'Asia/Omsk', '6'),
(NULL, 'GMT+11:00', 39600, 'Asia/Sakhalin', '11'),
(NULL, 'GMT+11:00', 39600, 'Asia/Srednekolymsk', '11'),
(NULL, 'GMT+07:00', 25200, 'Asia/Tomsk', '7'),
(NULL, 'GMT+10:00', 36000, 'Asia/Ust-Nera', '10'),
(NULL, 'GMT+10:00', 36000, 'Asia/Vladivostok', '10'),
(NULL, 'GMT+09:00', 32400, 'Asia/Yakutsk', '9'),
(NULL, 'GMT+05:00', 18000, 'Asia/Yekaterinburg', '5'),
(NULL, 'GMT+04:00', 14400, 'Europe/Astrakhan', '4'),
(NULL, 'GMT+02:00', 7200, 'Europe/Kaliningrad', '2'),
(NULL, 'GMT+03:00', 10800, 'Europe/Kirov', '3'),
(NULL, 'GMT+03:00', 10800, 'Europe/Moscow', '3'),
(NULL, 'GMT+04:00', 14400, 'Europe/Samara', '4'),
(NULL, 'GMT+04:00', 14400, 'Europe/Saratov', '4'),
(NULL, 'GMT+04:00', 14400, 'Europe/Ulyanovsk', '4'),
(NULL, 'GMT+03:00', 10800, 'Europe/Volgograd', '3'),
(NULL, 'GMT+02:00', 7200, 'Africa/Kigali', '2'),
(NULL, 'GMT+03:00', 10800, 'Asia/Riyadh', '3'),
(NULL, 'GMT+11:00', 39600, 'Pacific/Guadalcanal', '11'),
(NULL, 'GMT+04:00', 14400, 'Indian/Mahe', '4'),
(NULL, 'GMT+02:00', 7200, 'Africa/Khartoum', '2'),
(NULL, 'GMT+01:00', 3600, 'Europe/Stockholm', '1'),
(NULL, 'GMT+08:00', 28800, 'Asia/Singapore', '8'),
(NULL, 'GMT+00:00', 0, 'Atlantic/St_Helena', '0'),
(NULL, 'GMT+01:00', 3600, 'Europe/Ljubljana', '1'),
(NULL, 'GMT+01:00', 3600, 'Arctic/Longyearbyen', '1'),
(NULL, 'GMT+01:00', 3600, 'Europe/Bratislava', '1'),
(NULL, 'GMT+00:00', 0, 'Africa/Freetown', '0'),
(NULL, 'GMT+01:00', 3600, 'Europe/San_Marino', '1'),
(NULL, 'GMT+00:00', 0, 'Africa/Dakar', '0'),
(NULL, 'GMT+03:00', 10800, 'Africa/Mogadishu', '3'),
(NULL, 'GMT-03:00', -10800, 'America/Paramaribo', '-3'),
(NULL, 'GMT+03:00', 10800, 'Africa/Juba', '3'),
(NULL, 'GMT+00:00', 0, 'Africa/Sao_Tome', '0'),
(NULL, 'GMT-06:00', -21600, 'America/El_Salvador', '-6'),
(NULL, 'GMT-04:00', -14400, 'America/Lower_Princes', '-4'),
(NULL, 'GMT+02:00', 7200, 'Asia/Damascus', '2'),
(NULL, 'GMT+02:00', 7200, 'Africa/Mbabane', '2'),
(NULL, 'GMT-05:00', -18000, 'America/Grand_Turk', '-5'),
(NULL, 'GMT+01:00', 3600, 'Africa/Ndjamena', '1'),
(NULL, 'GMT+05:00', 18000, 'Indian/Kerguelen', '5'),
(NULL, 'GMT+00:00', 0, 'Africa/Lome', '0'),
(NULL, 'GMT+07:00', 25200, 'Asia/Bangkok', '7'),
(NULL, 'GMT+05:00', 18000, 'Asia/Dushanbe', '5'),
(NULL, 'GMT+13:00', 46800, 'Pacific/Fakaofo', '13'),
(NULL, 'GMT+09:00', 32400, 'Asia/Dili', '9'),
(NULL, 'GMT+05:00', 18000, 'Asia/Ashgabat', '5'),
(NULL, 'GMT+01:00', 3600, 'Africa/Tunis', '1'),
(NULL, 'GMT+13:00', 46800, 'Pacific/Tongatapu', '13'),
(NULL, 'GMT+03:00', 10800, 'Europe/Istanbul', '3'),
(NULL, 'GMT-04:00', -14400, 'America/Port_of_Spain', '-4'),
(NULL, 'GMT+12:00', 43200, 'Pacific/Funafuti', '12'),
(NULL, 'GMT+08:00', 28800, 'Asia/Taipei', '8'),
(NULL, 'GMT+03:00', 10800, 'Africa/Dar_es_Salaam', '3'),
(NULL, 'GMT+02:00', 7200, 'Europe/Kiev', '2'),
(NULL, 'GMT+03:00', 10800, 'Europe/Simferopol', '3'),
(NULL, 'GMT+02:00', 7200, 'Europe/Uzhgorod', '2'),
(NULL, 'GMT+02:00', 7200, 'Europe/Zaporozhye', '2'),
(NULL, 'GMT+03:00', 10800, 'Africa/Kampala', '3'),
(NULL, 'GMT-11:00', -39600, 'Pacific/Midway', '-11'),
(NULL, 'GMT+12:00', 43200, 'Pacific/Wake', '12'),
(NULL, 'GMT-10:00', -36000, 'America/Adak', '-10'),
(NULL, 'GMT-09:00', -32400, 'America/Anchorage', '-9'),
(NULL, 'GMT-07:00', -25200, 'America/Boise', '-7'),
(NULL, 'GMT-06:00', -21600, 'America/Chicago', '-6'),
(NULL, 'GMT-07:00', -25200, 'America/Denver', '-7'),
(NULL, 'GMT-05:00', -18000, 'America/Detroit', '-5'),
(NULL, 'GMT-05:00', -18000, 'America/Indiana/Indianapolis', '-5'),
(NULL, 'GMT-06:00', -21600, 'America/Indiana/Knox', '-6'),
(NULL, 'GMT-05:00', -18000, 'America/Indiana/Marengo', '-5'),
(NULL, 'GMT-05:00', -18000, 'America/Indiana/Petersburg', '-5'),
(NULL, 'GMT-06:00', -21600, 'America/Indiana/Tell_City', '-6'),
(NULL, 'GMT-05:00', -18000, 'America/Indiana/Vevay', '-5'),
(NULL, 'GMT-05:00', -18000, 'America/Indiana/Vincennes', '-5'),
(NULL, 'GMT-05:00', -18000, 'America/Indiana/Winamac', '-5'),
(NULL, 'GMT-09:00', -32400, 'America/Juneau', '-9'),
(NULL, 'GMT-05:00', -18000, 'America/Kentucky/Louisville', '-5'),
(NULL, 'GMT-05:00', -18000, 'America/Kentucky/Monticello', '-5'),
(NULL, 'GMT-08:00', -28800, 'America/Los_Angeles', '-8'),
(NULL, 'GMT-06:00', -21600, 'America/Menominee', '-6'),
(NULL, 'GMT-09:00', -32400, 'America/Metlakatla', '-9'),
(NULL, 'GMT-05:00', -18000, 'America/New_York', '-5'),
(NULL, 'GMT-09:00', -32400, 'America/Nome', '-9'),
(NULL, 'GMT-06:00', -21600, 'America/North_Dakota/Beulah', '-6'),
(NULL, 'GMT-06:00', -21600, 'America/North_Dakota/Center', '-6'),
(NULL, 'GMT-06:00', -21600, 'America/North_Dakota/New_Salem', '-6'),
(NULL, 'GMT-07:00', -25200, 'America/Phoenix', '-7'),
(NULL, 'GMT-09:00', -32400, 'America/Sitka', '-9'),
(NULL, 'GMT-09:00', -32400, 'America/Yakutat', '-9'),
(NULL, 'GMT-10:00', -36000, 'Pacific/Honolulu', '-10'),
(NULL, 'GMT-03:00', -10800, 'America/Montevideo', '-3'),
(NULL, 'GMT+05:00', 18000, 'Asia/Samarkand', '5'),
(NULL, 'GMT+05:00', 18000, 'Asia/Tashkent', '5'),
(NULL, 'GMT+01:00', 3600, 'Europe/Vatican', '1'),
(NULL, 'GMT-04:00', -14400, 'America/St_Vincent', '-4'),
(NULL, 'GMT-04:00', -14400, 'America/Caracas', '-4'),
(NULL, 'GMT-04:00', -14400, 'America/Tortola', '-4'),
(NULL, 'GMT-04:00', -14400, 'America/St_Thomas', '-4'),
(NULL, 'GMT+07:00', 25200, 'Asia/Ho_Chi_Minh', '7'),
(NULL, 'GMT+11:00', 39600, 'Pacific/Efate', '11'),
(NULL, 'GMT+12:00', 43200, 'Pacific/Wallis', '12'),
(NULL, 'GMT+14:00', 50400, 'Pacific/Apia', '14'),
(NULL, 'GMT+03:00', 10800, 'Asia/Aden', '3'),
(NULL, 'GMT+03:00', 10800, 'Indian/Mayotte', '3'),
(NULL, 'GMT+02:00', 7200, 'Africa/Johannesburg', '2'),
(NULL, 'GMT+02:00', 7200, 'Africa/Lusaka', '2'),
(NULL, 'GMT+02:00', 7200, 'Africa/Harare', '2');

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,1,0,'accounts','permissions',' ','permissions_list', 'Roles & Permission', '["main","list","create","delete","edit","search"]', 0, '2019-01-25 09:01:03', '1.60000');


UPDATE `permissions` SET `name` = 'Reseller' WHERE `description`= 'reseller';


UPDATE `menu_modules` SET `menu_label` = 'My Order' WHERE `menu_label` = 'My order' AND `module_url` = 'user/user_products_list/';

UPDATE `translations` SET `en_En` = 'Edit SIP Device' WHERE `module_name` = 'Edit SIP Device' AND `en_En` = 'Edit SIP device';


UPDATE `translations` SET `module_name`= `en_EN` WHERE `module_name` = 'currency';

UPDATE `roles_and_permission` SET `display_name` = 'SIP Devices' WHERE `menu_name` = 'accounts' AND `module_name` = 'freeswitch';

-- ---------------28-Jan-2021

UPDATE `roles_and_permission` SET `permissions` = '[\"main\",\"list\",\"edit\",\"search\"]' WHERE `login_type` = 2 AND `module_url` = 'user_products_list';

-- ---------------29-Jan-2021


CREATE TABLE `login_activity_report` (
  `id` int NOT NULL,
  `account_id` int NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `country_name` varchar(200) NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `timestamp` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE `login_activity_report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ip` (`ip`);

ALTER TABLE `login_activity_report`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

DROP TABLE IF EXISTS activity_reports;

CREATE TABLE `activity_reports` (
`id` int(11) NOT NULL,
`accountid` int(11) NOT NULL,
`reseller_id` int(11) NOT NULL DEFAULT '1',
`last_did_call_time` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
`last_outbound_call_time` datetime NOT NULL DEFAULT '1000-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE `activity_reports`
ADD PRIMARY KEY (`id`),
ADD UNIQUE KEY `accountid` (`accountid`);

ALTER TABLE `activity_reports`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

DELIMITER $$
CREATE TRIGGER `activity_reports` AFTER INSERT ON `cdrs`
 FOR EACH ROW BEGIN
IF (NEW.calltype = 'DID' AND NEW.call_direction = 'outbound') THEN
	INSERT INTO `activity_reports` (accountid,reseller_id,last_did_call_time,balance,credit_limit) VALUES (NEW.accountid, NEW.reseller_id, NEW.callstart,(SELECT balance from accounts where id=NEW.accountid),(SELECT credit_limit from accounts where id=NEW.accountid)) ON DUPLICATE KEY UPDATE `last_did_call_time`=NEW.callstart,`balance`=VALUES(balance),`credit_limit`=VALUES(credit_limit);
ELSEIF (NEW.calltype = 'STANDARD') THEN
    INSERT INTO `activity_reports` (accountid, reseller_id,last_outbound_call_time,balance,credit_limit) VALUES (NEW.accountid, NEW.reseller_id, NEW.callstart,(SELECT balance from accounts where id=NEW.accountid),(SELECT credit_limit from accounts where id=NEW.accountid)) ON DUPLICATE KEY UPDATE `last_outbound_call_time`=NEW.callstart,`balance`=VALUES(balance),`credit_limit`=VALUES(credit_limit);
END IF;
END $$
DELIMITER ;

INSERT INTO `menu_modules` (`id`, `menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES (NULL, 'Activity Report', 'activity_report', 'activity_report/activityReport/', 'Reports', '', '0', '82.1');
UPDATE userlevels SET module_permissions = concat( module_permissions, ',', ( SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = -1;

INSERT INTO `roles_and_permission` ( `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
( 0, 0, 'reports','activity_report','','activityReport', 'Call Activity Report', '["main","list","search","export"]', 0, '2019-01-25 09:01:03', '9.960000');
UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules WHERE module_url = 'activity_report/activityReport/' ) ) WHERE userlevelid = 2;

UPDATE `translations` SET `module_name`= 'Invoices Older Than Days' , `en_EN`='Invoices Older Than Days' WHERE `module_name` = 'Inovices Older Than Days';

UPDATE `menu_modules` SET `module_name` = 'activity_report' WHERE `module_name` = 'activityReport';

UPDATE `menu_modules` SET `module_url` = 'activity_report/activityReport/' WHERE `module_name`= "activity_report";

UPDATE `roles_and_permission` SET `permissions` = '[\"main\",\"list\",\"search\",\"export\"]' AND `sub_module_name` = '0' WHERE `module_name` = 'activity_report';

UPDATE `roles_and_permission` SET `permissions` = '[\"main\",\"list\",\"search\",\"export\"]', `sub_module_name` = '0' WHERE `module_name` = 'activity_report';



INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`, `sub_group`, `field_rules`) VALUES (NULL, 'product_debug_flag', 'Debug', '1', 'enable_disable_option', 'enable:-print the log of product\r\ndisable:-not print the log of product', '2019-04-01 00:00:00', '0', '0', 'Products', 'General', '');


UPDATE `translations` SET `module_name`= 'Invoices Older Than Days' , `en_EN`='Invoices Older Than Days' WHERE `module_name` = 'Inovices Older Than Days';

UPDATE `system` SET `group_title` = 'Products' WHERE `system`.`name` = 'reservation_days';

UPDATE `system` SET `group_title` = 'Products' WHERE `system`.`name` = 'did_reserve';

UPDATE `system` SET `group_title` = 'Products' WHERE `system`.`name` = 'rate_type_subscription';

UPDATE `system` SET `group_title` = 'Products' WHERE `system`.`name` = 'rate_type_did';

ALTER TABLE `products` CHANGE `rate_type` `pro_rate` INT NOT NULL DEFAULT '0' COMMENT '0 for full price, 1 for max days, 2 from max minute, 3 for 1 or 2 both of one max';

ALTER TABLE `dids` CHANGE `rate_type` `pro_rate` INT NOT NULL DEFAULT '0' COMMENT '0 for full price, 1 for max days, 2 from max minute, 3 for 1 or 2 both of one max';

INSERT INTO `menu_modules` (`menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES
('Low Balance', 'low_balance', 'low_balance/low_balance_list/', 'Reports', '', '0', 89.3);
update userlevels set module_permissions = concat( module_permissions, ',', ( SELECT max(id ) FROM menu_modules ) ) WHERE userlevelid = -1;

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL, 0, 0, 'reports','low_balance',' ','low_balance_list', 'Low Balance', '["main","list","search"]', 0, '2019-01-25 09:01:03', '7.80000');
UPDATE userlevels SET module_permissions = concat( module_permissions, ',', ( SELECT max( id ) FROM menu_modules WHERE module_url = 'low_balance/low_balance_list/' ) ) WHERE userlevelid = 2;

-- ----------------02-Feb-2021
UPDATE `system` SET `comment` = 'Set decimal points to use through out system (Max 5)' WHERE `name` = 'decimal_points' AND `group_title` = 'global';

-- ----------------03-Feb-2021

ALTER TABLE `cron_settings`  ADD `default_interval_type` VARCHAR(255);

UPDATE `system` SET `display_name` = 'Invoices Older Than Days' WHERE `name`= 'purge_invoices';


-- ---------------02-Feb-2021

ALTER TABLE `payment_transaction` ADD `notes` TEXT NOT NULL;


-- ---------------05-Feb-2021
UPDATE `system` SET	`sub_group`= 'Assorted' WHERE `name` IN ('trunk_count','ewallet_payment','folder_path');

-- ---------------04-Feb-2021

UPDATE `system` SET `display_name` = 'Invoice Debug' WHERE `system`.`name` = 'product_debug_flag';

-- ---------------10-Feb-2021

ALTER TABLE `activity_reports` ADD `balance` VARCHAR(40) NOT NULL AFTER `last_outbound_call_time`;
ALTER TABLE `activity_reports` ADD `credit_limit` VARCHAR(40) NOT NULL AFTER `balance`;

-- ---------------15-Feb-2021

ALTER TABLE `invoice_conf` CHANGE `smtp_port` `smtp_port` INT NOT NULL;

ALTER TABLE `invoice_conf` CHANGE `smtp_host` `smtp_host` VARCHAR(255) NOT NULL;

ALTER TABLE `invoice_conf` CHANGE `smtp_user` `smtp_user` VARCHAR(255) NOT NULL;

ALTER TABLE `invoice_conf` CHANGE `smtp_pass` `smtp_pass` VARCHAR(255) NOT NULL;

ALTER TABLE `invoice_conf` CHANGE `smtp_status` `smtp_status` TINYINT(1) NOT NULL DEFAULT '1';

-- ---------------16-Feb-2021

ALTER TABLE `sip_devices`  ADD `opensips_md5` VARCHAR(255);


UPDATE `system` SET `value` = '1' WHERE `name`= "did_reserve" and `field_type` = "enable_disable_option";

-- ---------------17-Feb-2021

UPDATE `cron_settings` SET `command` = 'minutes', `exec_interval` = '30' WHERE `name` = 'Manage Services';

ALTER TABLE `freeswich_servers` ADD `freeswitch_pubip` VARCHAR(255) NULL DEFAULT NULL AFTER `last_modified_date`;

INSERT INTO `system` (`name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`, `sub_group`, `field_rules`) VALUES('opensips_public_host','Opensips Public Host','','default_system_input','For opensip public IP','2020-03-21 17:21:24',0,0,'opensips','','');

-- ---------------18-Feb-2021

UPDATE `roles_and_permission` SET `display_name` = 'Bulk DID Purchase' WHERE `login_type` = '2' AND `module_name` = 'did_purchase';

UPDATE `roles_and_permission` SET `module_name` = 'notification', `module_url` = 'notification_list', `display_name` = 'Notification History' WHERE `login_type` = '0' AND `menu_name` = 'reports' AND `module_name` = 'email';

-- ---------------17-Feb-2021

INSERT INTO `system` (`name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`, `sub_group`, `field_rules`) VALUES ('audit_log', 'Audit Log', '0', 'enable_disable_option', 'You can enable/disable audit logs', '2019-04-01 00:00:00.000000', '0', '0', 'global', 'General', '');

-- ---------------22-Feb-2021

ALTER TABLE `activity_reports` CHANGE `last_outbound_call_time` `last_outbound_call_time` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00' ,
CHANGE `last_did_call_time` `last_did_call_time` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00';

UPDATE `roles_and_permission` SET `permissions` = '[\"main\",\"list\",\"purchase\"]' WHERE `login_type`= '2' AND `module_name` = 'did_purchase' ;

-- ---------------19-Feb-2021

DELETE FROM `system` WHERE `name` = 'rate_type_did';

UPDATE `system` SET `value` = '' WHERE `field_type` = 'default_system_input' AND `name` = 'url';

UPDATE `system` SET `value` = '' WHERE `field_type` = 'textarea' AND `name` = 'text';

-- ---------------24-Feb-2021

update `system` set name='hybrid_routing', display_name='Hybrid Routing', field_type='hybrid_routing', comment='Rates selection has two stages;1) One from particular vendor 2) One from all selected vendors;Default rate selection is based on same routing strategy for both stages;This option will enable you to use stretegy LCR for 1st stage and Cost for 2nd and vice-versa based on the strategy selected in rate group', value=0 where name='sort_cost_based_routing';

-- ---------------26-Feb-2021

UPDATE `default_templates` SET `sms_template` = 'Dear #FIRST_NAME#, Congratulations, Your have received #AMOUNT# for Product #PRODUCT_NAME# commission. Thanks, #COMPANY_NAME#' WHERE `name`= 'product_commission';

UPDATE `default_templates` SET `template` = '<p>Dear #NAME#,</p>\n\n<p>The product #PRODUCT_NAME# has now been added to your account.</p>\n\n<p><strong>Product Information: </strong></p>\n\n<p>Product Name: #PRODUCT_NAME#<br />\nProduct Category: #PRODUCT_CATEGORY#<br />\nPayment Method: #PAYMENT_METHOD#<br />\nProduct Amount: #PRODUCT_AMOUNT#<br />\nNext Bill Date: #NEXT_BILL_DATE#<br />\nQuantity:#QUANTITY#<br />\nTotal Amount:#TOTAL_PRICE#</p>\n\n<p>You can always let us know if you have any question at #COMPANY_EMAIL#. We will be happy to help!</p>\n\n<p>Thanks,<br />\n#COMPANY_NAME#</p>' WHERE name = 'product_purchase';	

-- ---------------26-Feb-2021

ALTER TABLE `dids` DROP INDEX `number`, ADD UNIQUE `number` (`number`) USING BTREE;
-- ---------------2-March-2021

-- UPDATE `routes` SET `effective_date` = now() where `id` = 1;
UPDATE `routes` SET `effective_date` = CURDATE() where `id` = 1;
-- UPDATE `outbound_routes` SET `effective_date` = now() where `id`= 1;
UPDATE `outbound_routes` SET `effective_date` = CURDATE() where `id`= 1;

-- ---------------3-March-2021

INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`, `sub_group`, `field_rules`) VALUES (NULL, 'sms_logs', 'SMS Logs', '0', 'enable_disable_option', 'Set Enable For Logs', '2021-03-02 10:47:50', '0', '0', 'notifications', 'SMS', '');

update sip_profiles set profile_data = '{"rtp-ip":"$${local_ip_v4}","dialplan":"XML","user-agent-string":"ASTPP","debug":"0","sip-trace":"no","tls":"false","inbound-reg-force-matching-username":"true","disable-transcoding":"true","all-reg-options-ping":"false","unregister-on-options-fail":"true","log-auth-failures":"true","status":"0","inbound-bypass-media":"false","inbound-proxy-media":"false","disable-transfer":"false","enable-100rel":"false","rtp-timeout-sec":"300","dtmf-duration":"2000","manual-redirect":"true","aggressive-nat-detection":"true","enable-timer":"false","minimum-session-expires":"120","session-timeout-pt":"1800","auth-calls":"true","apply-inbound-acl":"default","inbound-codec-prefs":"PCMA,PCMU","outbound-codec-prefs":"PCMA,PCMU","inbound-late-negotiation":"false","sip-capture":"no","forward-unsolicited-mwi-notify":"false","context":"default","rfc2833-pt":"101","rtp-timer-name":"soft","hold-music":"$${hold_music}","manage-presence":"true","presence-hosts":"$${domain},$${local_ip_v4}","presence-privacy":"$${presence_privacy}","inbound-codec-negotiation":"generous","auth-all-packets":"false","ext-rtp-ip":"$${local_ip_v4}","ext-sip-ip":"$${local_ip_v4}","rtp-hold-timeout-sec":"1800","challenge-realm":"auto_from","nonce-ttl":"60","pass-callee-id":"false", "dtmf_type":"rfc2833"}' where id = 1;

-- ---------------9-March-2021

update `system` set value="5.0" where name="version";


-- ---------------11-March-2020
delete from `system` where name ='realtime_billing';
INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`, `sub_group`, `field_rules`) VALUES
(NULL, 'realtime_billing', 'Status', '1', 'enable_disable_option', 'Set enable or disable Realtime Billing', '0000-00-00 00:00:00', 0, 0, 'realtime_billing', 'general', ''),
(NULL, 'realtime_billing_heartbeat', 'Heartbeat', '30', 'default_system_input', 'Set Heartbeat in seconds', '0000-00-00 00:00:00', 0, 0, 'realtime_billing', 'general', ''),
(NULL, 'realtime_low_balance_amount', 'Amount', '5', 'default_system_input', 'Set low balance amount alert', '0000-00-00 00:00:00', 0, 0, 'realtime_billing', 'Low Balance Threshold', ''),
(NULL, 'realtime_low_balance_alert', 'Alert Type', '0', 'warning_hangup_option', 'Set Warning or Hangup alert for Realtime Billing', '0000-00-00 00:00:00', 0, 0, 'realtime_billing', 'Low Balance Threshold', ''),
(NULL, 'realtime_no_balance_amount', 'Amount', '0', 'default_system_input', 'Set No balance amount alert', '0000-00-00 00:00:00', 0, 0, 'realtime_billing', 'No Balance Threshold', ''),
(NULL, 'realtime_no_balance_alert', 'Alert Type', '1', 'warning_hangup_option', 'Set Warning or Hangup alert for Realtime Billing', '0000-00-00 00:00:00', 0, 0, 'realtime_billing', 'No Balance Threshold', ''),
(NULL, 'realtime_percall_max_amt', 'Amount', '10', 'default_system_input', 'Set Max amount per call', '0000-00-00 00:00:00', 0, 0, 'realtime_billing', 'Max amount per call', ''),
(NULL, 'realtime_percall_action', 'Alert Type', '1', 'warning_hangup_option', 'Set Warning or Hangup alert for reached max amount', '0000-00-00 00:00:00', 0, 0, 'realtime_billing', 'Max amount per call', ''),
(NULL, 'realtime_custom_sql_lookup', 'Alert Type', "SELECT if(posttoexternal=1,credit_limit+(balance*-1),balance) AS nibble_balance FROM accounts WHERE id='${nibble_account}'", 'default_system_input', 'Set Warning or Hangup alert for reached max amount', '0000-00-00 00:00:00', 0, 1, 'realtime_billing', '', ''),
(NULL, 'realtime_custom_sql_save', 'Alert Type', "Update accounts SET balance=IF(posttoexternal=1,balance+${nibble_bill},balance-${nibble_bill}) WHERE id='${nibble_account}'", 'default_system_input', 'Set Warning or Hangup alert for reached max amount', '0000-00-00 00:00:00', 0, 1, 'realtime_billing', '', '');

-- ---------------11-March-2021

INSERT INTO `menu_modules` (`menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES
('Live Calls', 'user', 'user/user_livecall_report/', 'Reports', '', '0', 89.5);
UPDATE `userlevels` SET `module_permissions` = concat( `module_permissions`, ',', (  SELECT max( `id` ) FROM `menu_modules` where `module_url` = "user/user_livecall_report/" ) ) WHERE `userlevelid` = 0;


INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0,'reports','user',' ','user_livecall_report', 'Live Calls', '["main","list"]', 0, '2019-01-25 09:01:03', '9.10000');

UPDATE `menu_modules` SET `menu_label` = 'Notifications' WHERE `module_name` = 'notification' AND `module_url` = 'notification/notification_list/'; 

UPDATE `roles_and_permission` SET `display_name` = 'Notifications' WHERE `menu_name` = 'reports' AND `module_url` = 'notification_list';

UPDATE `menu_modules` SET `menu_label` = 'Notifications' WHERE `module_name` = 'user' AND `module_url` = 'user/user_notification_list/';

UPDATE `roles_and_permission` SET `display_name` = 'Notifications' WHERE `menu_name` = 'reports' AND `module_url` = 'user_notification_list';

-- ---------------16-March-2021

ALTER TABLE `order_items` ADD `pro_rate` INT NOT NULL;


-- ---------------22-March-2021
ALTER TABLE `sip_devices`  ADD `is_pbx` TINYINT NOT NULL DEFAULT '1';


-- INSERT INTO `translations` (`id`, `module_name`, `en_En`) VALUES 
-- (NULL, '(Fixed tax)', '(Fixed tax)');

UPDATE `cron_settings` SET `command` = 'hours' WHERE `name` = 'Timezone Update';

-- ---------------01-April-2021
INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL, 0, 0, 'configuration','systems',' ','global', 'Settings', '["main","list"]', 0, '2019-01-25 09:01:03', '8.91000');

UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules WHERE module_url = 'systems/configuration/global' ) ) WHERE userlevelid = 2;

-- ---------------02-April-2021

INSERT INTO `default_templates` (`name`, `subject`, `description`, `sms_template`, `alert_template`, `template`, `last_modified_date`, `reseller_id`, `is_email_enable`, `is_sms_enable`, `is_alert_enable`, `status`) VALUES
('pro_rate_refund', 'Your account refund with #REFUNDBALANCE#', 'Pro Rate refund notification template', 'Dear #FIRST_NAME#, Your account has been refund with #REFUNDBALANCE#. Your new balance is #BALANCE#. Thanks, #COMPANY_NAME#', '<p>Your account has been refund with #REFUNDBALANCE#. Your new balance is #BALANCE#.</p>', '<p>Dear #NAME#,</p>\r\n\r\n<p>Your account has been refund with #REFUNDBALANCE# on #ORDERNUMBER#.</p>\r\n\r\n<p>Your account new balance is #BALANCE#.</p>\r\n\r\n<p>For more info, please visit on our website #COMPANY_WEBSITE# or contact to our support department at #COMPANY_EMAIL#.</p>\r\n\r\n<p>Thanks,<br />\r\n#COMPANY_NAME#</p>\r\n', '2019-01-26 10:53:45', 0, 0, 0, 0, 0),
('pro_rate_postcharge', 'Your account postcharge with #POSTCHARGEBALANCE#', 'Pro Rate postcharge notification template', 'Dear #FIRST_NAME#, Your account has been postcharge with #POSTCHARGEBALANCE#. Your new balance is #BALANCE#. Thanks, #COMPANY_NAME#', '<p>Your account has been postcharge with #POSTCHARGEBALANCE#. Your new balance is #BALANCE#.</p>', '<p>Dear #NAME#,</p>\r\n\r\n<p>Your account has been postcharge with #POSTCHARGEBALANCE# on #ORDERNUMBER#.</p>\r\n\r\n<p>Your account new balance is #BALANCE#.</p>\r\n\r\n<p>For more info, please visit on our website #COMPANY_WEBSITE# or contact to our support department at #COMPANY_EMAIL#.</p>\r\n\r\n<p>Thanks,<br />\r\n#COMPANY_NAME#</p>\r\n', '2019-01-26 10:53:45', 0, 0, 0, 0, 0);

UPDATE `default_templates` SET `name` = 'balance_transfer' WHERE `name` = 'balance_tranfer' ;

-- ---------------05-April-2021

UPDATE `cron_settings` SET `default_interval_type` = 'days' WHERE `name` = 'Generate Invoice';

INSERT INTO `cron_settings` (`name`, `command`, `exec_interval`, `creation_date`, `last_modified_date`, `last_execution_date`, `next_execution_date`, `status`, `file_path`, `default_interval_type`) VALUES
('Product Renewal Reminder', 'days', 1, UTC_TIMESTAMP(), UTC_TIMESTAMP(),'0000-00-00 00:00:00','0000-00-00 00:00:00', 0, 'wget --no-check-certificate -O - -q {BASE_URL}ProcessInvoice/product_renewal_reminder/', 'days');

UPDATE `system` SET `comment` = 'This rate type is applicable only on Subscription category of product ' WHERE `name` = 'rate_type_subscription';

UPDATE `translations` SET `module_name`=' Page ', `en_En` = 'Page ' where `module_name`='Page';
UPDATE `translations` SET `module_name`=' of ', `en_En` = ' of ' where `module_name`='of';
UPDATE `translations` SET `module_name`=' Records', `en_En` = ' Records' where `module_name`='Records';


UPDATE `system` SET `sub_group` = 'General' WHERE `name` = 'realtime_billing_heartbeat';
UPDATE `system` SET `sub_group` = 'General' WHERE `name` = 'realtime_billing';

UPDATE `system` SET `sub_group` = 'Push Notifications' WHERE `sub_group` = 'Alert Notifications';

INSERT INTO `cron_settings` (`name`, `command`, `exec_interval`, `creation_date`, `last_modified_date`, `last_execution_date`, `next_execution_date`, `status`, `file_path`,`default_interval_type`) VALUES ( 'Currency Update', 'days', '1', UTC_TIMESTAMP(), UTC_TIMESTAMP(),'0000-00-00 00:00:00','0000-00-00 00:00:00', '0', 'wget --no-check-certificate -q -O- {BASE_URL}currencyupdate/update_currency','days');

DELETE FROM `system` WHERE `name` = 'custom_rule';

DELETE FROM `cron_settings` WHERE `file_path` = "wget --no-check-certificate -O - -q {BASE_URL}autorefill/auto_refill/";

INSERT INTO `system`(`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`, `sub_group`, `field_rules`) VALUES ('NULL','email_logs','Email Logs','0','enable_disable_option','Set Enable For Logs','2021-03-02 10:47:50','0','0','notifications','Email','');

-- ---------------15-April-2021

UPDATE `roles_and_permission` SET `permissions` = '[\"main\",\"list\",\"assign\",\"assign_to_reseller\"]' WHERE `module_url` = 'did_purchase_list' and  `login_type` = 0;

UPDATE `roles_and_permission` SET `permissions` = '[\"main\",\"list\",\"assign\",\"assign_to_reseller\"]' WHERE `module_url` = 'did_purchase_list' and  `login_type` = 1 and `permission_type` = 0;

-- ----------------06-May-2021
INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`, `sub_group`, `field_rules`) VALUES
(NULL, 'customer_default_permission', 'Customer Role', '4', 'set_customer_permission', 'Set customer permission', NOW(), 0, 0, 'signup', '', '');

-- ---------------07-May-2021

UPDATE `system` SET `group_title` = 'global' WHERE `system`.`name` = 'product_debug_flag';

UPDATE `system` SET `display_name` = 'Charge Type', `value` = '0' WHERE `system`.`name` = 'rate_type_subscription';