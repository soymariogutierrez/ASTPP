-- ------------------12-May-2020
INSERT INTO `system` ( `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`, `sub_group`, `field_rules`) VALUES
('test_email', 'SMTP Email Test', 'test_email', 'default_system_button', 'Click to verify', NOW(), 0, 0, 'notifications', 'Email', '');

-- -----------------09-Jun-2020
update `system` set name='hybrid_routing', display_name='Hybrid Routing', field_type='hybrid_routing', comment='Rates selection has two stages;1) One from particular vendor 2) One from all selected vendors;Default rate selection is based on same routing strategy for both stages;This option will enable you to use stretegy LCR for 1st stage and Cost for 2nd and vice-versa based on the strategy selected in rate group', value=0 where name='sort_cost_based_routing';

-- ------------------12-Jun-2020
INSERT INTO `menu_modules` (`menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES 
( 'Live Calls', 'user', 'user/user_livecall_report/', 'Live Calls', '', '0', '6.2');
update userlevels set module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = 0;
