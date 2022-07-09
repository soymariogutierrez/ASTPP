INSERT INTO `menu_modules` (`id`, `menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES (NULL, 'International Recharge', 'recharge', 'recharge/recharge_add/', 'Services', 'ListAccounts.png', '0', '10.7');

update userlevels set module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = 0;
update userlevels set module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = 1;
update userlevels set module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = 3;

ALTER TABLE `system` CHANGE `group_title` `group_title` VARCHAR(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL; 

INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`) VALUES (NULL, 'transferto_status', 'International Recharge', '0', 'enable_disable_option', 'Set enable to add International Recharge option', '0000-00-00 00:00:00', '0', '0', 'InternationalRecharge');

INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`) VALUES (NULL, 'transferto_login', 'International Recharge login', '', 'default_system_input', 'set International Recharge login', '0000-00-00 00:00:00', '0', '0', 'InternationalRecharge');

INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`) VALUES (NULL, 'transferto_token', 'International Recharge token', '', 'default_system_input', 'set International Recharge token', '0000-00-00 00:00:00', '0', '0', 'InternationalRecharge');

INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`) VALUES (NULL, 'transferto_fee(%)', 'International Recharge Fee(%)', '16', 'default_system_input', 'set International Recharge Fee', '0000-00-00 00:00:00', '0', '0', 'InternationalRecharge');

INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`) VALUES (NULL, 'transferto_mode', 'Transferto mode', '1', 'paypal_mode', 'set International Recharge mode', '0000-00-00 00:00:00', '0', '0', 'InternationalRecharge');

INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`) VALUES (NULL, 'transferto_simulate_url', 'Simulated URL', '', 'default_system_input', 'set simulate url', '0000-00-00 00:00:00', '0', '0', 'InternationalRecharge');

INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`) VALUES (NULL, 'transferto_topup_url', 'Topup URL', '', 'default_system_input', 'set topup url', '0000-00-00 00:00:00', '0', '0', 'InternationalRecharge');

INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`) VALUES (NULL, 'transferto_balance', 'Transferto balance', '', 'default_system_input', 'set International Recharge mode', '0000-00-00 00:00:00', '0', '0', 'InternationalRecharge');


INSERT INTO `menu_modules` (`id`, `menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES (NULL, 'International Recharge Report', 'recharge', 'recharge/recharge_list/', 'Reports', '', '0', '82.3');

update userlevels set module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = -1;

update userlevels set module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = 1;

 

ALTER TABLE `menu_modules` CHANGE `menu_label` `menu_label` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
INSERT INTO `menu_modules` (`id`, `menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES (NULL, 'International Recharge Report', 'recharge', 'recharge/recharge_list/', 'Reports', '', '0', '82.3');
update userlevels set module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = 0;
update userlevels set module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = 3;


DROP TABLE IF EXISTS transferto; 
CREATE TABLE `transferto` (
  `id` int(11) NOT NULL,
  `country_id` int(10) NOT NULL,
  `mobile_number` varchar(25) NOT NULL,
  `amount` varchar(50) NOT NULL,
  `sender_phone` int(20) NOT NULL,
  `available_amount` varchar(50) NOT NULL,
  `sms` varchar(255) NOT NULL,
  `charges` varchar(5) NOT NULL,
  `amount_to_sent` varchar(50) NOT NULL,
  `created_date` varchar(25) NOT NULL,
  `status` int(1) NOT NULL,
  `accountid` int(50) NOT NULL,
  `responce` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
ALTER TABLE `transferto`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `transferto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `transferto` ADD `reseller_id` INT(10) NOT NULL AFTER `accountid`;


INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL, 0, 0, 'reports','recharge','recharge','recharge_list', 'International Recharge Report', '["main","list","search"]', 0, '2019-01-25 09:01:03', '7.92000');


