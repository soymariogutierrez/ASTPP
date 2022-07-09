DROP TABLE IF EXISTS fraud_conf;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('frauddetection/frauddetection_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = -1;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('frauddetection/frauddetection_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 2;
delete from `menu_modules` where `module_name`='frauddetection' AND `module_url`='frauddetection/frauddetection_list/';
delete from `roles_and_permission` where `module_name`='frauddetection' AND `module_url`='frauddetection_list' AND `login_type`=0;

DROP TABLE IF EXISTS fraud_report;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('fraudreport/fraudreport_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = -1;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('fraudreport/fraudreport_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 2;
delete from `menu_modules` where `module_name`='fraudreport' AND `module_url`='fraudreport/fraudreport_list/';
delete from `roles_and_permission` where `module_name`='fraudreport' AND `module_url`='fraudreport_list' AND `login_type`=0;
delete from `cron_settings` where name='Fraud Detection';
DELETE FROM `default_templates` WHERE `name`='fraud_report';





