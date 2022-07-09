DROP TABLE IF EXISTS ftp_track;
DROP TABLE IF EXISTS ported_number;
DROP TABLE IF EXISTS numbering_plan;
DROP TABLE IF EXISTS routing_labels;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('portednumber/portednumber_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = -1;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('portednumber/portednumber_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 2;
delete from `menu_modules` where `module_name`='portednumber' AND `module_url`='portednumber/portednumber_list/';
delete from `system` where group_title='ported_number';
delete from `roles_and_permission` where `module_name`='portednumber' AND `module_url`='portednumber_list' AND `login_type`=0;
delete from `cron_settings` where name='GNP Number';
delete from `cron_settings` where name='MNP Number';
DELETE FROM `default_templates` WHERE `name` LIKE 'ported_number';
DELETE FROM `default_templates` WHERE `name` LIKE 'ported_number_ftp_connect';
DELETE FROM `default_templates` WHERE `name` LIKE 'ported_number_no_file';
DELETE FROM `translations` WHERE `module_name` = 'portednumber';



