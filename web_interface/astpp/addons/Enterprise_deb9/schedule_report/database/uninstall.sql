DROP TABLE IF EXISTS schedule_report;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('schedule_report/schedule_report_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = -1;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('schedule_report/schedule_report_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 2;
delete from `menu_modules` where `module_name`='schedule' AND `module_url`='schedule_report/schedule_report_list/';
delete from `roles_and_permission` where `module_name`='schedule_report' AND `module_url`='schedule_report_list' AND `login_type`=0;
DELETE FROM `default_templates` WHERE `name` LIKE 'schedule_report';
delete from `cron_settings` where name='Schedule Report';
DELETE FROM `translations` WHERE `module_name` = 'schedule_report';
