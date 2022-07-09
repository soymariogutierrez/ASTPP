-- ------2020-04-20
INSERT INTO `system` (`id` ,`name` ,`display_name` ,`value` ,`field_type` ,`comment` ,`reseller_id` ,`group_title`)
VALUES (NULL , 'fax_server_sip_port', 'Fax Server SIP Port', '5060', 'default_system_input', 'Set here your Fax server SIP port', '0', 'fax');

-- ------2020-05-01
delete from `default_templates` where `name`='fax_receive_mail';
INSERT INTO `default_templates` (`id`, `name`, `subject`, `template`, `last_modified_date`, `reseller_id`) VALUES ('', 'fax_receive_mail', '[ Faxer ] You have a Fax From #SEND_NUMBER# ', '<p>Hello #NAME#</p>\n<p>Here is fax information</p>\n<p>Send Date: #SEND_DATE#</p>\n<p>Send Number: #SEND_NUMBER#</p>\n<p>Receive Number: #RECEIVE_NUMBER#</p>\n<p>Caller ID: #CALLER_ID#</p>', '2017-07-12 05:52:13', 0);

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0,'services','authemail','APFaxer','user_authemail_list', 'Auth Email', '["main","list","create","edit","delete","search"]', 0, '2019-01-25 09:01:03', '3.50000');



INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0,'services','web2fax','APFaxer','web2fax_list', 'Faxer', '["main","list","create","delete","search"]', 0, '2019-01-25 09:01:03', '3.60000');

-- ------2022-02-02
INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,1,0,'configuration','authemail','APFaxer','authemail_detail', 'Auth Email', '["main","list","create","edit","delete","search"]', 0, '2019-01-25 09:01:03', '3.50000');

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,1,0,'configuration','web2fax','APFaxer','web2fax_list', 'Faxer', '["main","list","create","delete","search"]', 0, '2019-01-25 09:01:03', '3.60000');

ALTER TABLE `auth_email` ADD `reseller_id` int(11) NOT NULL AFTER `email`;
-- ------2022-02-02

