
INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0,'services','supportticket',' ','supportticket_list', 'Support Tickets', '["main","list","create","delete","edit","search"]', 0, '2019-01-25 09:01:03', '3.50000');

-- -------14-April-2021
UPDATE `default_templates` SET `template` = '<p>Email Ticket ID: #TICKET_ID# had a new status <strong>#REPLY_TYPE#</strong> posted by #NAME#</p>\r\n\r\n<p>#MESSAGE#</p>\r\n\r\n<p>Feel free to re write us in case if you have any concern regarding this ticket.</p>' WHERE `name`="email_sent_support_ticket";

-- -------14-July-2021
UPDATE `default_templates` set `description`  = "Email sent support ticket notification template" WHERE `name` = "email_sent_support_ticket";

UPDATE `default_templates` set `description`  = "Auto reply mail support notification template" WHERE `name` = "auto_reply_mail_support";

