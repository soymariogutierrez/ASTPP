DROP TABLE `auth_email`;
DROP TABLE `tbl_fax`;

UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('authemail/authemail_detail/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = -1;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('authemail/authemail_detail/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 1;

UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('authemail/authemail_detail/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 0;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('authemail/user_authemail_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 0;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('authemail/user_authemail_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 3;

UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('web2fax/web2fax_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = -1;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('web2fax/web2fax_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 1;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('web2fax/web2fax_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 0;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('web2fax/web2fax_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 3;

DELETE FROM `menu_modules` WHERE `menu_label` = 'Auth Email';
DELETE FROM `menu_modules` WHERE `menu_label` = 'Faxer';
DELETE FROM `menu_modules` WHERE `menu_label` = 'User Auth Email';
DELETE FROM `menu_modules` WHERE `menu_label` = 'Fax Setting';
DELETE FROM `default_templates` WHERE `name` = 'fax_receive_mail';
DELETE FROM `default_templates` WHERE `name` = 'outbound_fax_mail';
DELETE FROM `system`  WHERE `name` = 'send_fax_retries';
DELETE FROM `system`  WHERE `name` = 'fax_server_sip_port';
DELETE FROM `system`  WHERE `name` = 'imap_email_id';
DELETE FROM `system`  WHERE `name` = 'imap_password';
DELETE FROM `system`  WHERE `name` = 'imap_host';
DELETE FROM `system`  WHERE `name` = 'freeswitch_host';
-- Manish Issue 2854
-- DELETE FROM `system`  WHERE `name` = 'folder_path';
-- END
DELETE FROM `did_call_types`  WHERE `call_type` = 'FOIP';
DELETE FROM `roles_and_permission` where `module_name`='authemail' AND `module_url`='user_authemail_list' AND `login_type`=2;
DELETE FROM `roles_and_permission` where `module_name`='web2fax' AND `module_url`='web2fax_list' AND `login_type`=2;

DELETE FROM `cron_settings` WHERE `name`='Send Fax';
DELETE FROM `cron_settings` WHERE `name`='Fax2mail';

DELETE FROM `translations` WHERE `module_name` = 'foip';

-- ------2022-02-02
DELETE FROM `roles_and_permission` where `module_name`='authemail' AND `module_url`='authemail_detail' AND `login_type`=1;
DELETE FROM `roles_and_permission` where `module_name`='web2fax' AND `module_url`='web2fax_list' AND `login_type`=1;
