DROP TABLE IF EXISTS `request_number_porting`;

DELETE FROM `default_templates` WHERE `name` = 'number_porting';

DELETE FROM `system` WHERE `display_name` = 'Term and Condition URL';

DELETE FROM `system` WHERE `name` = 'porting_admin_email_address';

DELETE FROM `default_templates` WHERE `name` = 'porting_request';

UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('porting/porting_status_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = -1;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('porting/porting_status_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 1;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('porting/porting_status_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 2;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('porting/porting_status_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 0;

delete from `menu_modules` where `module_url`='porting/porting_status_list/' and `module_name`='porting';

delete from `roles_and_permission` where `module_name`='porting' AND `module_url`='porting_status_list' AND `login_type`=0;
delete from `roles_and_permission` where `module_name`='porting' AND `module_url`='porting_status_list' AND `login_type`=1;
delete from `roles_and_permission` where `module_name`='porting' AND `module_url`='porting_status_list' AND `login_type`=2;


