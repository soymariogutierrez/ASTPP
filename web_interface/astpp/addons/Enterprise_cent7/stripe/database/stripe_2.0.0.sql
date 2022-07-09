INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`, `sub_group`, `field_rules`) VALUES
(NULL, 'live_secret_key', 'Live Secret key', '', 'default_system_input', 'Set stripe secret key', '0000-00-00 00:00:00', 0, 0, 'stripe', '', ''),
(NULL, 'live_publishable_key', 'Live Publishable key', '', 'default_system_input', 'Set stripe Publishable key', '0000-00-00 00:00:00', 0, 0, 'stripe', '', ''),
(NULL, 'stripe_flag', 'Stripe', '1', 'enable_disable_option', 'Set enable or disable stripe recharge', '0000-00-00 00:00:00', 0, 0, 'stripe', '', ''),
(NULL, 'stripe_mode', 'Stripe Mode', '1', 'paypal_mode', 'Set Stripe mode live or sandbox', '0000-00-00 00:00:00', 0, 0, 'stripe', '', ''),
(NULL, 'sandbox_secret_key', 'Sandbox secret key', '', 'default_system_input', 'Set stripe sandbox secret key', '0000-00-00 00:00:00', 0, 0, 'stripe', '', ''),
(NULL, 'sandbox_publishable_key', 'Sandbox publishable key', '', 'default_system_input', 'Set stripe sandbox publishable key', '0000-00-00 00:00:00', 0, 0, 'stripe', '', '');

DROP TABLE IF EXISTS auto_refill_history;
CREATE TABLE `auto_refill_history` (
  `id` int(11) NOT NULL,
  `accountid` int(11) NOT NULL,
  `reseller_id` int(11) NOT NULL,
  `src_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_details` text COLLATE utf8_unicode_ci NOT NULL,
  `occurrence_per_day` int(11) NOT NULL,
  `payment_status` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `payment_gateway` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `refill_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


ALTER TABLE `auto_refill_history`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `auto_refill_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

DROP TABLE IF EXISTS card_details;
CREATE TABLE `card_details` (
  `id` int NOT NULL,
  `accountid` int NOT NULL,
  `reseller_id` int NOT NULL DEFAULT '0',
  `product_id` int NOT NULL DEFAULT '0',
  `cust_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `src_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `card_num` int NOT NULL,
  `card_brand` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `card_exp_month` int NOT NULL,
  `card_exp_year` int NOT NULL,
  `item_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `item_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `item_price` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `item_price_currency` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `paid_amount` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `paid_amount_currency` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `txn_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `payment_gateway` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `transaction_details` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `card_required` tinyint(1) NOT NULL COMMENT '0:required,1:optional',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE `card_details`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `card_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `accounts` ADD `auto_refill` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '1:No , 0:Yes' AFTER `tax_number`, ADD `refill_amount_limit` DECIMAL(20,5) NOT NULL DEFAULT '0.00000' AFTER `auto_refill`, ADD `occurrence_per_day` INT NOT NULL DEFAULT '0' AFTER `refill_amount_limit`;

INSERT INTO `cron_settings`(id,name,command,exec_interval,creation_date,last_modified_date,last_execution_date,next_execution_date,status,file_path) VALUES (null,'Auto Refill','minutes',1,UTC_TIMESTAMP(),UTC_TIMESTAMP(),'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'wget --no-check-certificate -O - -q {BASE_URL}autorefill/auto_refill/');

ALTER TABLE `card_details` ADD `card_expiry` VARCHAR(100) NOT NULL AFTER `created`;

ALTER TABLE `card_details` ADD `status` TINYINT(1) NOT NULL DEFAULT '1' AFTER `card_expiry`;

ALTER TABLE `card_details` ADD `last_modified_date` DATETIME(6) NOT NULL AFTER `status`;

UPDATE `system` SET `group_title` = 'payment_methods',`sub_group` = 'Stripe' WHERE `group_title` = 'stripe';

INSERT INTO `menu_modules` (`id`, `menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES (NULL, 'Card Management', 'user', 'user/user_card_management/', 'My Account', '', '0', '7.7');

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL, 2, 0, 'my_account','user',' ','user_card_management', 'Card Management', '["main","list","add","delete", "search"]', 0, '2019-01-25 09:01:03', '7.60000'); 

UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules WHERE module_url = 'user/user_card_management/' ) ) WHERE userlevelid = 0;

