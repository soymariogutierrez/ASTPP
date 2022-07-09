DELETE FROM `system` WHERE `system`.`name` = 'minimum_accountlength';
DELETE FROM `system` WHERE `system`.`name` = 'maximum_accountlength';
DELETE FROM `system` WHERE `system`.`name` = 'minimum_accountlength_customer';
DELETE FROM `system` WHERE `system`.`name` = 'maximum_accountlength_customer';
DELETE FROM `system` WHERE `system`.`name` = 'minimum_accountlength_reseller';
DELETE FROM `system` WHERE `system`.`name` = 'maximum_accountlength_reseller';
DELETE FROM `system` WHERE `system`.`name` = 'minimum_accountlength_provider';
DELETE FROM `system` WHERE `system`.`name` = 'maximum_accountlength_provider';
DELETE FROM `translations` WHERE `module_name` = 'account_range';



