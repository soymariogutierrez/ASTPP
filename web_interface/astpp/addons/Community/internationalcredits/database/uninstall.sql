UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('internationalcredits/internationalcredits_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = -1;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('internationalcredits/internationalcredits_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 2;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('internationalcredits/internationalcredits_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 1;
delete from `roles_and_permission` where `module_name`='internationalcredits' AND `module_url`='internationalcredits_list' AND `login_type`=1;
delete from `roles_and_permission` where `module_name`='internationalcredits' AND `module_url`='internationalcredits_list' AND `login_type`=0;
delete from `menu_modules` where `menu_label`='International Credits' and `module_name`='internationalcredits';
delete from `system` where group_title='InternationalPrefixes';
alter table accounts drop column int_balance;
alter table accounts drop column int_credit_limit;
delete from `cron_settings` where name='Low International Balance Alert';
DELETE FROM `translations` WHERE `module_name` = 'internationalcredits';
