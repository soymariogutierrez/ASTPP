ALTER TABLE `accounts` ADD `otp` VARCHAR(20) NOT NULL AFTER `tax_number`, ADD `otp_due_date` DATETIME NOT NULL AFTER `otp`;

ALTER TABLE `accounts` ADD `two_factor_authentication` TINYINT NOT NULL DEFAULT '0' COMMENT '0:enable,1:disable' AFTER `otp_due_date`;

ALTER TABLE `accounts` ADD `flag` TINYINT NOT NULL DEFAULT '1', ADD `retries` INT(11) NOT NULL, ADD `ban_time_due_date` DATETIME NOT NULL, ADD `find_time_due_date` DATETIME NOT NULL;

INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`, `sub_group`, `field_rules`) VALUES (NULL, 'two_factor_authentication', 'Two-factor Authentication', '1', 'enable_disable_option', 'Two-factor Authentication', '2019-04-01 00:00:00.000000', '0', '0', 'Security', 'General', ''), (NULL, 'login_otp_expire', 'OTP Expire Time(min)', '10', 'default_system_input', 'Set OTP expire time for login ', '2019-04-01 00:00:00.000000', '0', '0', 'Security', 'General', ''), (NULL, 'maximum_unsuccessfull_attempt', 'Wrong Attempts/Customer/Days', '10', 'default_system_input', 'Set maximum unsuccessfull attempts per customer ', '2019-04-01 00:00:00.000000', '0', '0', 'Security', 'General', ''), (NULL, 'ban_time', 'Ban Time(min)', '60', 'default_system_input', 'Set ban time for customer ', '2019-04-01 00:00:00.000000', '0', '0', 'Security', 'General', ''), (NULL, 'find_time', 'Find Time(min)', '60', 'default_system_input', 'Set find time for customer ', '2019-04-01 00:00:00.000000', '0', '0', 'Security', 'General', '');

INSERT INTO `default_templates` (`id`, `name`, `subject`, `description`, `sms_template`, `alert_template`, `template`, `last_modified_date`, `reseller_id`, `is_email_enable`, `is_sms_enable`, `is_alert_enable`, `status`) VALUES (NULL, 'two_factor_authentication', 'Two-factor Authentication OTP', 'Two-factor Authentication\'S OTP template', 'Dear #FIRST_NAME#, Please use otp #OTP# to login.This is usable once & valid for #TIME# min from the request.\r\n', '', '<p>Hi #NAME#,</p>\r\n\r\n<p>Please use one time password #OTP# to reset your password.</p>\r\n\r\n\r\n<p>This is usable once valid for #TIME# min from the request.</p>\r\n\r\n<p>If you have not raised a request to login then please contact us immediately.</p>\r\n\r\n<p>For more info, Please visit on our website #COMPANY_WEBSITE# or contact to our support at #COMPANY_EMAIL#.</p>\r\n\r\n<p>Thanks,</p>\r\n\r\n<p>#COMPANY_NAME#</p>', '1000-01-01 00:00:00', '0', '0', '0', '0', '0');

-- start-event
CREATE DEFINER=`astppuser`@`localhost` EVENT `login_otp_expire` ON SCHEDULE EVERY 1 MINUTE STARTS '2020-08-20 06:09:28' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
	UPDATE accounts SET otp = "" WHERE otp_due_date <= UTC_TIMESTAMP();
END
-- end-event



