DROP TABLE IF EXISTS acl_management;

UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('acl_management/acl_management_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = -1;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('acl_management/acl_management_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 2;
delete from `roles_and_permission` where `module_name`='acl_management' AND `module_url`='acl_management_list' AND `login_type`=0;
DELETE FROM `menu_modules` WHERE `menu_label` = 'ACL Management';
DELETE FROM `translations` WHERE `module_name` = 'acl_management';
