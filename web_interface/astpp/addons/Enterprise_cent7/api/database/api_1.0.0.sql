--
-- Table structure for table `dialer_device_info`
-- This will be used for the active devices information
--
CREATE TABLE `dialer_device_info` (
  `id` int(11) NOT NULL,
  `accountid` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `device_id` varchar(80) NOT NULL,
  `callkit_token` varchar(80) NOT NULL,
  `mobile_type` varchar(10) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `last_login_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE `dialer_device_info`
ADD PRIMARY KEY (`id`);

ALTER TABLE `dialer_device_info`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Dump data for the `system` table for the basic configuration
-- This will be used for the insert baisc details for the notification and all
--

INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`, `sub_group`, `field_rules`) VALUES
(NULL, 'ios_inapp_secret', 'IOS Inapp Secret', '0', 'default_system_input', 'Set IOS Inapp purchase secret', '1000-01-01 00:00:00', 0, 0, 'global', 'Dialer Configuration', ''),
(NULL, 'ios_inapp_production_type', 'IOS Inapp Production Type', '0', 'enable_disable_option', 'Set IOS Inapp purchase production type. Enable for Live and Disable for Sandbox', '1000-01-01 00:00:00', 0, 0, 'global', 'Dialer Configuration', ''),
(NULL, 'ios_push_notification_passphrase', 'IOS Push Notification Passphrase', '0', 'default_system_input', 'Set IOS Push notification passphrase', '1000-01-01 00:00:00', 0, 0, 'global', 'Dialer Configuration', ''),
(NULL, 'ios_push_notification_mode', 'IOS Push Notification Mode', '0', 'default_system_input', 'Set IOS Push notification mode for incoming calls. Enable for Live and Disable for Sandbox', '1000-01-01 00:00:00', 0, 0, 'global', 'Dialer Configuration', ''),
(NULL, 'paypal_secret_key', 'Paypal Secret key (For SDK)', '0', 'default_system_input', 'Set Paypal Secret key for Mobile Dialer SDK', '1000-01-01 00:00:00', 0, 0, 'global', 'Dialer Configuration', ''),
(NULL, 'paypal_clientid', 'Paypal Clientid (For SDK)', '0', 'default_system_input', 'Set Paypal Client Id for Mobile Dialer SDK', '1000-01-01 00:00:00', 0, 0, 'global', 'Dialer Configuration', ''),
(NULL, 'api_auth_key', 'API Auth Key (For IOS Push)', '0', 'default_system_input', 'Define API Auth Key', '1000-01-01 00:00:00', 0, 0, 'global', 'Dialer Configuration', ''),
(NULL, 'api_url', 'API URL (For IOS Push)', '0', 'default_system_input', 'Define API URL', '1000-01-01 00:00:00', 0, 0, 'global', 'Dialer Configuration', ''),
(NULL, 'api_debug_log', 'API Debug Mode', '0', 'enable_disable_option', 'To enable api log', '1000-01-01 00:00:00', 0, 0, 'global', 'Dialer Configuration', '');

--
-- Dump data for the implement the admob feature
-- This is the feature specific contains
--

INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`, `sub_group`, `field_rules`) VALUES
(NULL, 'tap_coins', 'Reward coins for per Tap', '2', 'tap_coins', 'Add Coins For Tap', '2019-04-01 00:00:00', 0, 0, 'global', 'Ad-Mob', ''),
(NULL, 'video_coins', 'Reward coins for per video', '4', 'video_coins', 'Add Coins For Video', '2019-04-01 00:00:00', 0, 0, 'global', 'Ad-Mob', ''),
(NULL, 'coins_consider_for_cost', 'Coins Consider For Cost', '200', 'coins_consider_for_cost', 'Add Credit', '2019-04-01 00:00:00', 0, 0, 'global', 'Ad-Mob', ''),
(NULL, 'cost_of_refill_for_coins', 'Cost Of Refill For Coins', '0.02', 'refillcoins_cost', 'Add Credit', '2019-04-01 00:00:00', 0, 0, 'global', 'Ad-Mob', '');

--
-- Dump data for the implement the admob feature "admob_coins"
-- This is the feature specific contains part of new dev and security enhansement
--
CREATE TABLE `admob_coins` (
  `id` int(11) NOT NULL,
  `accountid` int(11) NOT NULL,
  `coin_wheele` float NOT NULL DEFAULT '0',
  `coin_dailycheckin` float NOT NULL DEFAULT '0',
  `coin_video` float NOT NULL DEFAULT '0',
  `coin_tap` float NOT NULL DEFAULT '0',
  `total_added_coins` float NOT NULL DEFAULT '0',
  `total_redeemed_coins` float NOT NULL DEFAULT '0',
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `admob_coins`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `admob_coins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;



INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`, `sub_group`, `field_rules`) VALUES
(NULL, 'google_fcm_key', 'Google API Key', '0', 'default_system_input', 'Set API key from the google firebase console', '2019-04-01 00:00:00.000000', '0', '0', 'notifications', 'Alert Notifications', ''),
(NULL, 'ios_push_notification_mode', 'IOS Push Notification Mode', '0', 'ios_notification_mode', 'Set IOS Push notification mode for incoming calls. Enable for Live and Disable for Sandbox', '1000-01-01 00:00:00', 0, 0, 'notifications', 'Alert Notifications', ''),
(NULL, 'ios_push_notification_passphrase', 'IOS Push Notification Passphrase', '0', 'default_system_input', 'Set IOS Push notification passphrase', '1000-01-01 00:00:00', 0, 0, 'notifications', 'Alert Notifications', '');

--
-- 29-05-19 'dialer_device_info' skima changes due to long string from the fcm
--
--

ALTER TABLE `dialer_device_info` CHANGE `callkit_token` `callkit_token` VARCHAR(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL;

-- 29-09-21 Mobile dialer api related changes in core files

ALTER TABLE `dialer_device_info` ADD `apns_token` VARCHAR(200) NOT NULL AFTER `callkit_token`;

INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`, `sub_group`, `field_rules`) VALUES (NULL, 'static_domain', 'Sip Domain', '', 'default_system_input', 'Define SIP domain with port. EG. sip.yourdomain.com:5060', '1000-01-01 00:00:00', '0', '0', 'global', 'Dialer Configuration', '') ;

INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`, `sub_group`, `field_rules`) VALUES(NULL, 'mobile_notification','Mobile App', '1', 'notification_mode', 'Set Notification', '0000-00-00 00:00:00', 0, 0, 'global', 'Dialer Configuration', '');

INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`, `sub_group`, `field_rules`) VALUES (NULL, 'apns_topic', 'APNS Topic', '', 'default_system_input', 'Define APNS topic name(Define value if you have personalised dialer and want to send notification from our central notification server.). EG. com.inextrix.astpp.iap.voip', '2021-09-03 00:00:00', '0', '0', 'global', 'Dialer Configuration', '') ;

INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`, `sub_group`, `field_rules`) VALUES (NULL, 'dialer_for', 'Dialer For', '', 'default_system_input', 'Define dialer project name. EG. iNextrix', '2021-09-03 00:00:00', '0', '0', 'global', 'Dialer Configuration', '') ;

UPDATE `system` SET `display_name` = 'Mobile Dialer Support' WHERE`name` LIKE 'mobile_dialer';

INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`, `sub_group`, `field_rules`) VALUES (NULL, 'voip_topic', 'VOIP Topic', '0', 'default_system_input', 'Define VOIP topic name(Define value if you have personalised dialer and want to send notification from our central notification server.). EG. com.inextrix.astpp.iap.voip', '2021-09-03 00:00:00', '0', '0', 'global', 'Dialer Configuration', '') ;

INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`, `sub_group`, `field_rules`) VALUES
(NULL, 'apns_pem', 'APNS Pem File', '0', 'default_system_input','Set your APNS pem file', '2022-01-21 00:00:00', '0', '0', 'global', 'Dialer Configuration', ''),
(NULL, 'voip_pem', 'VOIP Pem File', '0', 'default_system_input','Set your VOIP pem file', '2022-01-21 00:00:00', '0', '0', 'global', 'Dialer Configuration', '');

DELETE FROM `system` WHERE `name` In ('ios_inapp_secret','ios_inapp_production_type','paypal_secret_key','paypal_clientid','dialer_for');

DELETE FROM `system` WHERE `name` = 'ios_push_notification_mode' AND `group_title` = 'global';