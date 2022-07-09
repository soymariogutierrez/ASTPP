-- sandip add roles and permission in admin 2-4-20

UPDATE `userlevels` SET `module_permissions` = concat( `module_permissions`, ',', (  SELECT max( `id` ) FROM `menu_modules` where `module_url` = "fsmonitor/sip_devices/" ) ) WHERE `userlevelid` = 2;
INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES (NULL, '0', '0', 'switch', 'fsmonitor', '', 'sip_devices', 'Registered SIP Devices', '[\"main\",\"list\"]', '0', '2019-01-25 09:01:05', '6.30');

UPDATE `userlevels` SET `module_permissions` = concat( `module_permissions`, ',', (  SELECT max( `id` ) FROM `menu_modules` where `module_url` = "fsmonitor/gateways/" ) ) WHERE `userlevelid` = 2;
INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES (NULL, '0', '0', 'switch', 'fsmonitor', '', 'gateways', 'Registered Gateways', '[\"main\",\"list\"]', '0', '2019-01-25 09:01:05', '6.31');

UPDATE `userlevels` SET `module_permissions` = concat( `module_permissions`, ',', (  SELECT max( `id` ) FROM `menu_modules` where `module_url` = "fsmonitor/fs_cli/" ) ) WHERE `userlevelid` = 2;
INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES (NULL, '0', '0', 'switch', 'fsmonitor', '', 'fs_cli', 'switch CLI', '[\"main\",\"list\"]', '0', '2019-01-25 09:01:05', '6.32');

UPDATE `userlevels` SET `module_permissions` = concat( `module_permissions`, ',', (  SELECT max( `id` ) FROM `menu_modules` where `module_url` = "fsmonitor/live_call_graph/" ) ) WHERE `userlevelid` = 2;
INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES (NULL, '0', '0', 'switch', 'fsmonitor', '', 'live_call_graph', 'Live Call Graph', '[\"main\",\"list\"]', '0', '2019-01-25 09:01:05', '6.33');
