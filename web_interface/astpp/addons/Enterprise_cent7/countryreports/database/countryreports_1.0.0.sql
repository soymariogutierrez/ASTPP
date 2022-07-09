INSERT INTO `menu_modules` (`id`, `menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) 
VALUES (NULL, 'Country Report', 'countryreports', 'countryreports/accounts_list/', 'Reports', '', '0', '82.1');

update userlevels set module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = -1;
update userlevels set module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = 1;
 
INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL, 0, 0, 'reports','countryreports','country_reports','accounts_list', 'Country Report', '["main","list","search"]', 0, '2019-01-25 09:01:03', '8.70000');

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL, 1, 0, 'reports','countryreports','country_reports','accounts_list', 'Country Report', '["main","list","search"]', 0, '2019-01-25 09:01:03', '6.50000');
