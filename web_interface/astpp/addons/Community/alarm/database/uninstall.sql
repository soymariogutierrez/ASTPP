DROP TABLE IF EXISTS alarm_report;
DROP TABLE IF EXISTS alarms;
UPDATE userlevels ul CROSS JOIN (SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('alarm/alarm_list/','alarmreport/alarmreport_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END )WHERE ul.userlevelid = -1;
UPDATE userlevels ul CROSS JOIN (SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('alarm/alarm_list/','alarmreport/alarmreport_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END )WHERE ul.userlevelid = 2;
delete from `menu_modules` where `menu_label`='Alarm Configuration' and `module_name`='alarm';
delete from `menu_modules` where `menu_label`='Report' and `module_name`='alarmreport';

delete from `roles_and_permission` where `module_name`='alarm' AND `module_url`='alarm_list' AND `login_type`=0;
delete from `roles_and_permission` where `module_name`='alarmreport' AND `module_url`='alarmreport_list' AND `login_type`=0;

delete from cron_settings where name in('Alarm_active_calls','Alarm_gateway_console','Alarm_gateway_freeswitch','Alarmping_freeswitch');

delete from default_templates where name='alarm_report';
DELETE FROM `translations` WHERE `module_name` = 'alarm';

