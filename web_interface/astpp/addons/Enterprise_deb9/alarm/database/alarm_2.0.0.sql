delete from `roles_and_permission` where `module_name`='alarm' AND `module_url`='alarm_list' AND `login_type`=0;
delete from `roles_and_permission` where `module_name`='alarmreport' AND `module_url`='alarmreport_list' AND `login_type`=0;
INSERT INTO `roles_and_permission` (`login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(0, 0, 'switch','alarm','Call Alarms','alarm_list', 'Alarm Configuration', '["main","list","search","create","delete"]', 0, '2019-01-25 09:01:03', '6.70000');
INSERT INTO `roles_and_permission` (`login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(0, 0, 'switch','alarmreport','Call Alarms','alarmreport_list', 'Alarm Report', '["main","list","search","close"]', 0, '2019-01-25 09:01:03', '6.80000');
