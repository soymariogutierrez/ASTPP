-- -----sandip add roles and permission

update userlevels set module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules where module_url = "internationalcredits/internationalcredits_list/" ) ) WHERE userlevelid = 2;
INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL, 0, 0, 'accounts', 'internationalcredits', '', 'internationalcredits_list', 'International Recharge', '[\"main\",\"list\",\"recharge\",\"delete\",\"search\"]', 0, '2019-01-25 09:01:05', '1.70000');
