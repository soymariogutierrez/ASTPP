--
-- DID call Type
--

INSERT INTO `did_call_types` (`id`, `call_type_code`, `call_type`) VALUES (NULL, '7', 'Ring Group'), (NULL, '8', 'Conference') , (NULL, '9', 'Queue'), (NULL, '10', 'IVR'), (NULL, '11', 'Time Condition'); 

-- RingGroup Query
INSERT INTO `menu_modules` (`menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES
('RingGroup', 'ringgroup', 'ringgroup/ringgroup_list/', 'Inbound', '', '0', 40.4);

update userlevels set module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = -1;
update userlevels set module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = 0;

CREATE TABLE `pbx_ringgroup` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `strategy` varchar(50) NOT NULL,
  `call_time_out` varchar(50) NOT NULL,
  `destinations` longtext NOT NULL,
  `description` varchar(200) NOT NULL,
  `product_id` int(11) NOT NULL,
  `reseller_id` int(11) NOT NULL,
  `accountid` int(11) NOT NULL,
  `announcementid` int(10) NOT NULL,
  `call_record` int(10) NOT NULL,
  `skip_busy` int(10) NOT NULL,
  `duration` int(10) NOT NULL,
  `ringbackid` varchar(50) NOT NULL,
  `calleridnumber` varchar(100) NOT NULL,
  `calleridname` varchar(100) NOT NULL,
  `ring_back` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:Active,1:Inactive',
  `creation_date` datetime NOT NULL,
  `no_answer_call_type` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_answer` varchar(50) NOT NULL,
  `no_answer_call_type_value` varchar(255) NOT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `pbx_ringgroup`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `pbx_ringgroup`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;


-- Conference Query

INSERT INTO `menu_modules` (`id`, `menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES (NULL, 'Conference Profile', 'conference', 'conference/conferenceprofiles_list/', 'Inbound', '0', '0', '30.5');  
UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = -1;

INSERT INTO `menu_modules` (`id`, `menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES (NULL, 'Conference Controls', 'conference', 'conference/conferencecontrols_list/', 'Inbound', '0', '0', '30.6');  
UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = -1;

INSERT INTO `menu_modules` (`id`, `menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES (NULL, 'Conference', 'conference', 'conference/conference_list/', 'Inbound', '0', '0', '30.8');  
UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = -1;
UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = 0;

CREATE TABLE `pbx_conference_controls` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `description` varchar(500) NOT NULL,
  `control_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `accountid` int(11) NOT NULL,
  `reseller_id` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `last_modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `pbx_conference_controls`
  ADD PRIMARY KEY (`id`);
  
ALTER TABLE `pbx_conference_controls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;  


CREATE TABLE `pbx_conference_profiles` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `description` varchar(500) NOT NULL,
  `profile_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `accountid` int(11) NOT NULL,
  `reseller_id` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `last_modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `pbx_conference_profiles`
  ADD PRIMARY KEY (`id`);
  
ALTER TABLE `pbx_conference_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;  

CREATE TABLE `pbx_conference_specification` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` varchar(100) NOT NULL,
  `greetingid` int(11) NOT NULL,
  `profileid` int(11) NOT NULL,
  `accountid` int(11) NOT NULL,
  `reseller_id` int(11) NOT NULL,
  `pin_length` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:enable,1:disable',
  `description` varchar(100) NOT NULL,
  `product_id` int(11) NOT NULL,
  `is_pin` int(10) NOT NULL DEFAULT '0',
  `is_pin1` tinyint(1) NOT NULL DEFAULT '0',
  `creation_date` datetime NOT NULL,
  `last_modified_date` datetime NOT NULL,
  `duration` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `pbx_conference_specification`
  ADD PRIMARY KEY (`id`);
 
 ALTER TABLE `pbx_conference_specification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT; 
 

INSERT INTO `pbx_conference_profiles` VALUES (1,'defaultControls',0,'do not delete','cdr-log-dir:true:0:test,domain::0:test,rate:8000:0:,interval:20:0:,energy-level:15:0:,auto-gain-level:0:0:,caller-controls:defaultControls:0:,moderator-controls:defaultControls:0:,muted-sound:conference/conf-muted.wav:0:,unmuted-sound:conference/conf-unmuted.wav:0:,alone-sound:conference/conf-alone.wav:0:,moh-sound:conference/conf-alone.wav:0:0:0:,enter-sound:conference/conf-muted.wav:0:,exit-sound:conference/conf-muted.wav:0:,kicked-sound:conference/conf-kicked.wav:0:,locked-sound:conference/conf-locked.wav:0:,is-locked-sound:conference/conf-is-locked.wav:0:,is-unlocked-sound:conference/conf-is-unlocked.wav:0:,pin-sound:conference/conf-pin.wav:0:,bad-pin-sound:conference/conf-bad-pin.wav:0:,caller-id-name:123456:0:,caller-id-number:123456:0:,comfort-noise:true:0:,announce-count:1:0:Test count',0,0,NOW(),NOW()); 

INSERT INTO `pbx_conference_controls` VALUES (1,'defaultControls',0,'do not delete','0:mute::0,1:vol talk dn::0,2:vol talk up::0,3:vol talk zero::0,4:vol listen dn::0,5:vol listen zero::0,caller-controls:defaultControls:0:,moderator-controls:defaultControls:0:,6:vol listen up::0,7:energy dn::0,8:energy equ::0,9:energy up::0',0,0,NOW(),NOW());


-- Queue Query
INSERT INTO `menu_modules` (`id`, `menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES (NULL, 'Queue', 'queue', 'queue/queue_list/', 'Inbound', '0', '0', '30.4');
UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = -1;
UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = 0;

CREATE TABLE `pbx_queue` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `reseller_id` int(11) NOT NULL DEFAULT '0',
  `description` text,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:Active,1:Inactive',
  `agent_hold_file` varchar(50) NOT NULL DEFAULT '0',
  `client_hold_file` varchar(50) NOT NULL DEFAULT '0',
  `did_id` int(11) NOT NULL DEFAULT '0',
  `destination_number` varchar(20) NOT NULL,
  `duration` char(50) NOT NULL DEFAULT '0',
  `creation_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `account_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


ALTER TABLE `pbx_queue`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `pbx_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


-- Recording Query
INSERT INTO `menu_modules` (`id`, `menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES
(NULL, 'Recording', 'recording', 'recording/recording_list/', 'Inbound', '', '0',30.7);
UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = -1;
UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = 0;
INSERT INTO `system` (`id`, `name`, `display_name`, `value`, `field_type`, `comment`, `timestamp`, `reseller_id`, `is_display`, `group_title`,`sub_group`,`field_rules`) VALUES (NULL, 'recording_number', 'Recording Number', '1800', 'default_system_input', 'Set your Recording number here.',NOW(), 0, 0, 'global','General','');


CREATE TABLE `pbx_recording` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `accountid` int(11) NOT NULL DEFAULT '0',
  `creation_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reseller_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `pbx_recording`
  ADD PRIMARY KEY (`id`);
  
ALTER TABLE `pbx_recording`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;  

-- Timecondition Query
INSERT INTO `menu_modules` (`id`, `menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES
(NULL, 'Time Conditions', 'timeconditions', 'timeconditions/timeconditions_list/', 'Inbound', '', '0', 30.9);
UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = -1;
UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = 0;

CREATE TABLE `time_condition` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `timecondition` text NOT NULL,
  `failover_condition` text NOT NULL,
  `accountid` int(11) NOT NULL DEFAULT '0',
  `reseller_id` int(11) NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `last_modified_date` datetime NOT NULL DEFAULT '1970-01-01 00:00:01'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `time_condition`
  ADD PRIMARY KEY (`id`);
  
  ALTER TABLE `time_condition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- -IVR Query

INSERT INTO `menu_modules` (`id`, `menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES
(NULL, 'IVR', 'IVR', 'ivr/ivr_list/', 'Inbound', '0', '0', 30.9);

UPDATE `userlevels` SET `module_permissions` = concat( `module_permissions`, ',', (  SELECT max( `id` ) FROM `menu_modules` ) ) WHERE `userlevelid` = -1;
UPDATE `userlevels` SET `module_permissions` = concat( `module_permissions`, ',', (  SELECT max( `id` ) FROM `menu_modules` ) ) WHERE `userlevelid` = 0;



--
-- Table structure for table `pbx_ivr_specification`
--

CREATE TABLE `pbx_ivr_specification` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `direct_dial` int(11) NOT NULL,
  `accountid` int(11) NOT NULL,
  `reseller_id` int(11) NOT NULL,
  `greetingid` int(11) NOT NULL,
  `invalid_msg_id` int(11) NOT NULL,
  `calleridname` varchar(100) NOT NULL,
  `calleridnumber` varchar(100) NOT NULL,
  `timeout` varchar(100) NOT NULL,
  `invalid_retries` varchar(100) NOT NULL,
  `ringbackid` varchar(50) NOT NULL,
  `duration` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `last_modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


--
-- Indexes for dumped tables
--

--
-- Indexes for table `pbx_ivr_specification`
--
ALTER TABLE `pbx_ivr_specification`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pbx_ivr_specification`
--
ALTER TABLE `pbx_ivr_specification`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;


CREATE TABLE `pbx_ivr_controls` (
  `id` int(11) NOT NULL,
  `ivr_id` int(11) NOT NULL,
  `digits` int(11) NOT NULL,
  `ivr_type` varchar(100) NOT NULL,
  `destination_id` varchar(30) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


--
-- Indexes for dumped tables
--

--
-- Indexes for table `pbx_ivr_controls`
--
ALTER TABLE `pbx_ivr_controls`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pbx_ivr_controls`
--
ALTER TABLE `pbx_ivr_controls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Deep Query
--

 INSERT INTO `menu_modules` (`id`, `menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES (NULL, 'Domains', 'domains', 'domains/domains_list/', 'Accounts', 'ListAccounts.png', 'Customers', '0.1');

update userlevels set module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = -1;

CREATE TABLE `domains` (
  `id` int(11) NOT NULL,
  `domain` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `accountid` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-Active,1-inactive',
  `creation_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `last_modified_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `domains`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accountid` (`accountid`);

ALTER TABLE `domains`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

CREATE TABLE `sip_device_routing` (
  `id` int(11) NOT NULL,
  `sip_device_id` int(11) NOT NULL DEFAULT '0',
  `call_forwarding_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:Enable,1:Disable',
  `call_forwarding_destination` varchar(25) DEFAULT NULL,
  `on_busy_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:Enable,1:Disable',
  `on_busy_destination` varchar(25) DEFAULT NULL,
  `no_answer_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:Enable,1:Disable',
  `no_answer_destination` varchar(25) DEFAULT NULL,
  `not_register_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:Enable,1:Disable',
  `not_register_destination` varchar(25) DEFAULT NULL,
  `follow_me_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:Enable,1:Disable',
  `follow_me_destination` mediumtext,
  `ingnore_busy_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:Enable,1:Disable',
  `do_not_disturb` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:Enable,1:Disable',
  `is_recording` tinyint(1) NOT NULL DEFAULT '1',
  `call_waiting` int(1) NOT NULL DEFAULT '1' COMMENT '0: Enable and 1: Disable',
  `pickup_ids` varchar(50) DEFAULT NULL,
  `allow_pickup_ids` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `sip_device_routing`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sip_device_routing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

INSERT INTO sip_device_routing (`sip_device_id`) SELECT `id` FROM sip_devices;

-- start-event

DROP TRIGGER IF EXISTS `add_sip_routing`;
-- break-event

DROP TRIGGER IF EXISTS `add_domain`;
-- break-event

CREATE TRIGGER `add_sip_routing` AFTER INSERT ON `sip_devices`
FOR EACH ROW BEGIN
INSERT INTO sip_device_routing (`sip_device_id`) VALUES (NEW.id);
END;

-- break-event

CREATE TRIGGER `add_domain` AFTER INSERT ON `accounts`
 FOR EACH ROW BEGIN
DECLARE domain_name varchar(100); 
DECLARE domain_id INT default 0;
DECLARE default_domain varchar(100);

IF( NEW.type = '0') THEN
	SELECT domain FROM invoice_conf WHERE accountid = '1' INTO @default_domain;
    SET domain_id = (SELECT max(id+1) FROM domains);
    SET domain_name = CONCAT_WS('.',CONCAT(NEW.first_name,'',domain_id),@default_domain);
    INSERT INTO domains (domain,accountid,status,creation_date,last_modified_date) VALUES (domain_name,NEW.id,0,UTC_TIMESTAMP(),UTC_TIMESTAMP());
END IF;
END;

-- end-event



-- System Query

ALTER TABLE `pbx_ringgroup` CHANGE `destinations` `destinations` TEXT CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL; 


-- Feature Code

INSERT INTO `menu_modules` (`id`, `menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES
(NULL, 'Feature Code', 'featurecode', 'featurecode/featurecode_list/', 'Inbound', '', '0', 31.1);
UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = -1;

INSERT INTO `menu_modules` (`id`, `menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES
(NULL, 'Feature Code', 'featurecode', 'featurecode/user_featurecode_list/', 'Inbound', '', '0', 31.2);
UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = 0;

CREATE TABLE `feature_code` (
  `id` int(11) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `feature` varchar(50) DEFAULT NULL,
  `feature_code` varchar(50) DEFAULT NULL,
  `feature_action` varchar(50) NOT NULL,
  `description` text,
  `creation_date` datetime DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `feature_code`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `feature_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

INSERT INTO `feature_code` (`id`, `type`, `feature`, `feature_code`, `feature_action`, `description`, `creation_date`, `modified_date`) VALUES 
(1,'call_forward','Call forward all active','*71','call_forward_active','Using for Call Forward All Active.',NOW(),NOW()),
(2,'call_forward','Call forward all inactive','*72','call_forward_inactive','Using for Call Forward All Inactive.',NOW(),NOW()),
(3,'call_forward','Call Forward Toggle','*73','call_forward_all_toggle','Using for Call Forward Toggle.',NOW(),NOW()),
(4,'call_forward','Call forward busy active','*74','call_forward_busy_active','Using for Call Forward Busy Active.',NOW(),NOW()),
(5,'call_forward','Call Forward Busy Deactivate','*75','call_forward_busy_inactive','Using for Call Forward Busy Deactivate.',NOW(),NOW()),
(6,'call_forward','Call Forward Busy Toggle','*76','call_forward_busy_toggle','Using for Call Forward Busy Toggle.',NOW(),NOW()),
(7,'call_forward','Call Forward No Answer/Unavailable Activate','*77','call_forward_no_answer_active','Using for Call Forward No Answer/Unavailable Activate.',NOW(),NOW()),
(8,'call_forward','Call Forward No Answer/Unavailable Deactivate','*78','call_forward_no_answer_inactive','Using for Call Forward No Answer/Unavailable Deactivate',NOW(),NOW()),
(9,'call_forward','Call Forward No Answer Toggle','*79','call_forward_no_answer_toggle','Using for Call Forward No Answer Toggle.',NOW(),NOW()),
(10,'follow_me','Follow me - activate','*80','follow_me_active','Using for Follow Me - Activate.',NOW(),NOW()),
(11,'follow_me','Follow me - Deactivate','*81','follow_me_inactive','Using for Follow Me - Deactivate.',NOW(),NOW()),
(12,'follow_me','Follow me Toggle','*82','follow_me_toggle','Using for Follow me Toggle.',NOW(),NOW()),
(13,'call_waiting','Call Waiting - Activate','*83','call_waiting_active','Using for Call Waiting - Activate.',NOW(),NOW()),
(14,'call_waiting','Call Waiting - Deactivate','*84','call_waiting_inactive','Using for Call Waiting - Deactivate.',NOW(),NOW()),
(15,'call_waiting','Call Waiting Toggle','*85','call_waiting_toggle','Using for Call Waiting Toggle.',NOW(),NOW()),
(16,'dnd','Enable DND','*86','dnd_active','Using for Enable DND.',NOW(),NOW()),
(17,'dnd','Disable DND','*87','dnd_inactive','Using for Disable DND.',NOW(),NOW()),
(18,'dnd','DND Toggle','*88','dnd_toggle','Using for DND Toggle.',NOW(),NOW()),
(19,'call_forward','Call forward not register active','*89','call_forward_not_register_active','Using for Call Forward Not Register Active.',NOW(),NOW()),
(20,'call_forward','Call forward not register inactive','*90','call_forward_not_register_inactive','Using for Call Forward Not Register Inactive.',NOW(),NOW()),
(21,'call_forward','Call Forward not register Toggle','*91','call_forward_not_register_toggle','Using for Call Forward not register Toggle.',NOW(),NOW()),
(22,'call_recording','Toggle Call Recording','*92','call_recording_toggle','Using for Toggle Call Recording.',NOW(),NOW()),
(23,'call_recording','call_recording_active','*93','call_recording_active','Using for Active call recording.',NOW(),NOW()),
(24,'call_transfer','Blind Call Transfer','*94','call_transfer','Using for Blind Call Transfer.',NOW(),NOW()),
(25,'call_transfer','Attended Call Transfer','*95','call_transfer_attended','Using for Attended Call Transfer.',NOW(),NOW()),
(26,'voicemail','Any Dial Voicemail','*96','voicemail_any_dial','Using for Any Dial Voicemail.',NOW(),NOW()),
(27,'voicemail','My own Voicemail','*97','voicemail_own','Using for Listen own voicemail.',NOW(),NOW()),
(28,'spy','Intercept an extension','*98','spy_call','Using for Listen live running call on dialled extension.',NOW(),NOW()),
(29,'call_pickup','Directed Call Pickup Same group','*99','call_pickup_same_group','Using for Pickup Same Group Ringing Extension.',NOW(),NOW()),
(30,'call_pickup','General Call Pick','*100','call_pickup_all_group','Using for Pickup Any Ringing Extension.',NOW(),NOW()),
(31,'call_recording_inactive','Call Recording Inactive','*101','call_recording_inactive','Using for Inactive Call Recording.',NOW(),NOW());

INSERT INTO `menu_modules` (`id`, `menu_label`, `module_name`, `module_url`, `menu_title`, `menu_image`, `menu_subtitle`, `priority`) VALUES (NULL, 'Pickup Group', 'featurecode', 'featurecode/featurecode_pickup_group/', 'Inbound', '', '0', '31.3');
UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = -1;
UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules ) ) WHERE userlevelid = 0;

CREATE TABLE `pickup_group` (
  `id` int(11) NOT NULL,
  `reseller_id` int(11) NOT NULL DEFAULT '0',
	`accountid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:Active, 1:Inactive',
  `creation_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `pickup_group`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `pickup_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `time_condition` ADD `duration` INT(11) NOT NULL DEFAULT '0' AFTER `reseller_id`; 

-- ----------------2019-07-23

ALTER TABLE `sip_devices` DROP INDEX `username`, ADD UNIQUE `username` (`username`, `accountid`) USING BTREE;

-- ---------------2020-01-22
UPDATE `feature_code` SET `feature_code` = '*2' WHERE `feature_action` = 'call_transfer';
UPDATE `feature_code` SET `feature_code` = '*3' WHERE `feature_action` = 'call_transfer_attended';


