ALTER TABLE `accounts`
  DROP `otp`,
  DROP `otp_due_date`,
  DROP `find_time_due_date`,
  DROP `ban_time_due_date`,
  DROP `retries`,
  DROP `flag`,
  DROP `two_factor_authentication`;

DELETE FROM `default_templates` WHERE `default_templates`.`name` = 'two_factor_authentication';

DELETE FROM `system` WHERE `system`.`name` = 'two_factor_authentication';
DELETE FROM `system` WHERE `system`.`name` = 'login_otp_expire';
DELETE FROM `system` WHERE `system`.`name` = 'maximum_unsuccessfull_attempt';
DELETE FROM `system` WHERE `system`.`name` = 'ban_time';
DELETE FROM `system` WHERE `system`.`name` = 'find_time';

DROP EVENT IF EXISTS `login_otp_expire`;