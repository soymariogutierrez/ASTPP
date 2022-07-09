-- ------sandip roles and permission

UPDATE `userlevels` SET `module_permissions` = concat( `module_permissions`, ',', (  SELECT max( `id` ) FROM `menu_modules` where `module_url` = "acl_management/acl_management_list/" ) ) WHERE `userlevelid` = 2;
INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES (NULL, '0', '0', 'switch', 'acl_management', '', 'acl_management_list', 'ACL Management', '[\"main\",\"list\"]', '0', '2019-01-25 09:01:05', '6.34');
