DROP TABLE IF EXISTS ib_chains; 
CREATE TABLE `ib_chains` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `ip` text,
  `rule` varchar(7) NOT NULL DEFAULT 'NONE',
  `created_date` timestamp NULL DEFAULT NULL,
  `is_deleted` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `ib_chains`
  ADD PRIMARY KEY (`id`);
  
  ALTER TABLE `ib_chains`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Dumping data for table `ib_chains`
--

INSERT INTO `ib_chains` (`id`, `name`, `ip`, `rule`, `created_date`, `is_deleted`) VALUES
(1, 'INPUT', '', 'ACCEPT', '2018-05-01 11:56:07', 0),
(2, 'INPUT', '', 'DROP', '2018-04-25 09:10:12', 0),
(3, 'OUTPUT', '', 'ACCEPT', '2018-05-01 11:56:11', 0),
(4, 'OUTPUT', '', 'DROP', '2018-04-25 07:54:59', 0),
(5, 'FORWARD', '', 'ACCEPT', '2018-05-01 11:54:06', 0),
(6, 'FORWARD', '', 'DROP', '2018-04-25 07:58:25', 0),
(7, 'fail2ban-ssh', '', 'NONE', '2018-05-01 11:54:12', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ib_rules`
--
DROP TABLE IF EXISTS ib_rules; 
CREATE TABLE `ib_rules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hostname` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `chain_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `chain_rule` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `protocol` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `port` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `block_ip` varchar(90) COLLATE utf8_unicode_ci DEFAULT NULL,
  `servers` text COLLATE utf8_unicode_ci,
  `domain` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `rule` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ib_rules`
--
ALTER TABLE `ib_rules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hostname` (`hostname`,`block_ip`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ib_rules`
--
ALTER TABLE `ib_rules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
-- --------------------------------------------------------

--
-- Table structure for table `ib_servers`
--
DROP TABLE IF EXISTS ib_servers;
CREATE TABLE `ib_servers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for table `ib_servers`
--
ALTER TABLE `ib_servers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ib_servers`
--
ALTER TABLE `ib_servers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


INSERT INTO `menu_modules` (`menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES ('Rules', 'ipboss', 'ipboss/ipboss_list/', 'Services', '', 'IPBoss', 60.5);
update userlevels set module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = -1;
INSERT INTO `menu_modules` (`menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES ('Servers', 'servers', 'ipboss/servers_list/', 'Services', '', 'IPBoss', 61.1);
update userlevels set module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = -1;
INSERT INTO `menu_modules` (`menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES ('Chains', 'chains', 'ipboss/chains_list/', 'Services', '', 'IPBoss', 61.2);
update userlevels set module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = -1;

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL, 0, 0, 'services','ipboss','ipboss','ipboss_list', 'Rules', '["main","list","search","add_rule","create_shortcut","edit","delete"]', 0, '2019-01-25 09:01:03', '5.60000');


INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL, 0, 0, 'services','ipboss','servers','servers_list', 'Servers', '["main","list","search","add_server","edit","delete"]', 0, '2019-01-25 09:01:03', '5.70000');

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL, 0, 0, 'services','ipboss','chains','chains_list', 'Chain', '["main","list","search","add_chain","edit","delete"]', 0, '2019-01-25 09:01:03', '5.80000');



