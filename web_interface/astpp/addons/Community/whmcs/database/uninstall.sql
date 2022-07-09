ALTER TABLE `accounts` DROP `whmcs_id`;

DELETE from `system` where name = 'whmcs_url';
DELETE from `system` where name = 'whmcs_username';
DELETE from `system` where name = 'whmcs_password';
DELETE from `system` where name = 'whmcs_secret_key';
DELETE from `system` where name = 'whmcs_iv_key';
