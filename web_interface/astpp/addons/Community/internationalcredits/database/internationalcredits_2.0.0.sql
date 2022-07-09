
UPDATE `roles_and_permission` SET `permissions` = '[\"main\",\"list\",\"recharge\",\"search\"]' WHERE `module_name` = 'internationalcredits' and module_url='internationalcredits_list';

-- --------15-April-2021
UPDATE `default_templates` SET `template` = '<p>Dear #NAME#,</p>\r\n\r\n<p>Here is a quick reminder that your current balance is at #BALANCE# which is below your set threshold.</p>\r\n\r\n<p>You can refill your account from our website to ensure your services will remain consistent.</p>\r\n\r\n<p>For more info, please visit on our website #COMPANY_WEBSITE# or contact to our support at #COMPANY_EMAIL#.</p>\r\n\r\n<p>Thanks,<br />\r\n#COMPANY_NAME#</p>' WHERE `name` = "international_low_balance";