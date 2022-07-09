
CREATE TABLE `acl_management` (
  `id` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `acl_management`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `acl_management`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

INSERT INTO `menu_modules` (`id`, `menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES (NULL, 'ACL Management', 'acl_management', 'acl_management/acl_management_list/', 'Switch', 'acl.png', '0', 85);
UPDATE `userlevels` SET `module_permissions` = concat( `module_permissions`, ',', (  SELECT max( `id` ) FROM `menu_modules` ) ) WHERE `userlevelid` = -1;
