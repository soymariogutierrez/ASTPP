update userlevels set module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules where `module_url` = 'local_number/local_number_list/' ) ) WHERE userlevelid = 2;
delete from roles_and_permission where module_name="local_number" and module_url="local_number_list" and permission_type="0";
INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL, 0, 0, 'inbound','local_number','local_number','local_number_list', 'Local Number', '["main","list","search","create","export","edit","import","delete"]', 0, '2019-01-25 09:01:03', '3.30000');



INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0, 'inbound','local_number',' ','local_number_list_customer', 'Local Number', '["main","list","add","edit","delete","search"]', 0, '2019-01-25 09:01:03', '2.28000');

