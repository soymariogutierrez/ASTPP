
DROP TABLE IF EXISTS `ib_chains`;
DROP TABLE IF EXISTS `ib_rules`;
DROP TABLE IF EXISTS `ib_servers`;

delete from `menu_modules` where `module_url`='ipboss/ipboss_list/' and `module_name`='ipboss';
delete from `menu_modules` where `module_url`='ipboss/servers_list/' and `module_name`='servers';
delete from `menu_modules` where `module_url`='ipboss/chains_list/' and `module_name`='chains';

delete from `roles_and_permission` where `module_name`='ipboss' AND `module_url`='ipboss_list' AND `login_type`=0;
delete from `roles_and_permission` where `module_name`='servers' AND `module_url`='servers_list' AND `login_type`=0;
delete from `roles_and_permission` where `module_name`='chains' AND `module_url`='chains_list' AND `login_type`=0;
