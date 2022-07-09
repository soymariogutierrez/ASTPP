ALTER TABLE `pbx_ringgroup` CHANGE `description` `description` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;

ALTER TABLE `pbx_conference_specification` CHANGE `description` `description` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;


INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL, 1, 0, 'inbound','recording',' ','recording_list', 'Recording', '["main","list","create","edit","delete","search"]', 0, '2019-01-25 09:01:03', '6.50000');


UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules WHERE module_url = 'recording/recording_list/' ) ) WHERE userlevelid = 1;


INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,0, 0, 'inbound','recording',' ','recording_list', 'Recording', '["main","list","create","edit","delete","search"]', 0, '2019-01-25 09:01:03', '6.50000'); 

UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules WHERE module_url = 'recording/recording_list/' ) ) WHERE userlevelid = 2; 


INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL, 1, 0, 'inbound','ringgroup',' ','ringgroup_list', 'RingGroup', '["main","list","create","edit","delete","search"]', 0, '2019-01-25 09:01:03', '6.60000')	; 

UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules WHERE module_url = 'ringgroup/ringgroup_list/' ) ) WHERE userlevelid = 1;


INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,0, 0, 'inbound','ringgroup',' ','ringgroup_list', 'RingGroup', '["main","list","create","edit","delete","search"]', 0, '2019-01-25 09:01:03', '6.60000'); 

UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules WHERE module_url = 'ringgroup/ringgroup_list/' ) ) WHERE userlevelid = 2; 


INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL, 1, 0, 'inbound','timeconditions',' ','timeconditions_list', 'Time Conditions', '["main","list","create","edit","delete","search"]', 0, '2019-01-25 09:01:03', '6.70000')	; 

UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules WHERE module_url = 'timeconditions/timeconditions_list/' ) ) WHERE userlevelid = 1;

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL, 0, 0, 'inbound','timeconditions',' ','timeconditions_list', 'Time Conditions', '["main","list","create","edit","delete","search"]', 0, '2019-01-25 09:01:03', '6.70000'); 

UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules WHERE module_url = 'timeconditions/timeconditions_list/' ) ) WHERE userlevelid = 2;



INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL, 1, 0, 'inbound','queue',' ','queue_list', 'Queue', '["main","list","create","edit","delete","search"]', 0, '2019-01-25 09:01:03', '6.70000'); 

UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules WHERE module_url = 'queue/queue_list/' ) ) WHERE userlevelid = 1;


INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL, 0, 0, 'inbound','queue',' ','queue_list', 'Queue', '["main","list","create","edit","delete","search"]', 0, '2019-01-25 09:01:03', '6.70000'); 

UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules WHERE module_url = 'queue/queue_list/' ) ) WHERE userlevelid = 2;

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES

(NULL, 1, 0, 'inbound','featurecode',' ','featurecode_pickup_group', 'Pickup Group', '["main","list","create","edit","delete","search"]', 0, '2019-01-25 09:01:03', '6.90000'); 

UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules WHERE module_url = 'featurecode/featurecode_pickup_group/' ) ) WHERE userlevelid = 1;

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL, 0, 0, 'inbound','featurecode',' ','featurecode_pickup_group', 'Pickup Group', '["main","list","create","edit","delete","search"]', 0, '2019-01-25 09:01:03', '6.90000'); 

UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules WHERE module_url = 'featurecode/featurecode_pickup_group/' ) ) WHERE userlevelid = 2;

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL, 1, 0, 'inbound','ivr',' ','ivr_list', 'IVR', '["main","list","create","edit","delete","search"]', 0, '2019-01-25 09:01:03', '6.80000'); 

UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules WHERE module_url = 'ivr/ivr_list/' ) ) WHERE userlevelid = 1;

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL, 0, 0, 'inbound','ivr',' ','ivr_list', 'IVR', '["main","list","create","edit","delete","search"]', 0, '2019-01-25 09:01:03', '6.80000'); 

UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules WHERE module_url = 'ivr/ivr_list/' ) ) WHERE userlevelid = 2;

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL, 1, 0, 'inbound','conference',' ','conference_list', 'Conference', '["main","list","create","edit","delete","search"]', 0, '2019-01-25 09:01:03', '6.90000'); 

UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules WHERE module_url = 'conference/conference_list/' ) ) WHERE userlevelid = 1;

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL, 0, 0, 'inbound','conference',' ','conference_list', 'Conference', '["main","list","create","edit","delete","search"]', 0, '2019-01-25 09:01:03', '6.90000'); 

UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules WHERE module_url = 'conference/conference_list/' ) ) WHERE userlevelid = 2;

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL, 1, 0, 'inbound','featurecode',' ','featurecode_list', 'Feature Code', '["main","list"]', 0, '2019-01-25 09:01:03', '6.93200'); 

UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules WHERE module_url = 'featurecode/featurecode_list/' ) ) WHERE userlevelid = 1;


INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL, 0, 0, 'inbound','featurecode',' ','featurecode_list', 'Feature Code', '["main","list"]', 0, '2019-01-25 09:01:03', '6.93200'); 

UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules WHERE module_url = 'featurecode/featurecode_list/' ) ) WHERE userlevelid = 2;

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL, 1, 0, 'accounts','domains','customers','domains_list', 'Domains', '["main","list","search"]', 0, '2019-01-25 09:01:03', '6.93200'); 

UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules WHERE module_url = 'domains/domains_list/' ) ) WHERE userlevelid = 1;

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL, 0, 0, 'accounts','domains','customers','domains_list', 'Domains', '["main","list","search"]', 0, '2019-01-25 09:01:03', '6.93200'); 

UPDATE userlevels SET module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules WHERE module_url = 'domains/domains_list/' ) ) WHERE userlevelid = 2;

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0, 'inbound','queue',' ','queue_list', 'Queue', '["main","list","create","edit","delete","search"]', 0, '2019-01-25 09:01:03', '2.20000');

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0, 'inbound','recording',' ','recording_list', 'Recording', '["main","list","create","edit","delete","search"]', 0, '2019-01-25 09:01:03', '2.21000');

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0, 'inbound','conference',' ','conference_list', 'Conference', '["main","list","create","edit","delete","search"]', 0, '2019-01-25 09:01:03', '2.22000');

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0, 'inbound','ivr',' ','ivr_list', 'IVR', '["main","list","create","edit","delete","search"]', 0, '2019-01-25 09:01:03', '2.23000');

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0, 'inbound','timeconditions',' ','timeconditions_list', 'Time Conditions', '["main","list","create","edit","delete","search"]', 0, '2019-01-25 09:01:03', '2.24000');

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0, 'inbound','featurecode',' ','user_featurecode_list', 'Feature Code', '["main","list"]', 0, '2019-01-25 09:01:03', '2.25000');

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0, 'inbound','ringgroup',' ','ringgroup_list', 'RingGroup', '["main","list","create","edit","delete","search"]', 0, '2019-01-25 09:01:03', '2.26000');

INSERT INTO `roles_and_permission` (`id`, `login_type`, `permission_type`, `menu_name`, `module_name`, `sub_module_name`, `module_url`, `display_name`, `permissions`, `status`, `creation_date`, `priority`) VALUES
(NULL,2,0, 'inbound','featurecode',' ','featurecode_pickup_group', 'Pickup Group', '["main","list","create","edit","delete","search"]', 0, '2019-01-25 09:01:03', '2.27000');

-- start-event

DROP TRIGGER IF EXISTS `add_domain`;

-- break-event

CREATE TRIGGER `add_domain` AFTER INSERT ON `accounts`
 FOR EACH ROW BEGIN
DECLARE domain_name varchar(100); 
DECLARE domain_id INT default 0;
DECLARE default_domain varchar(100);

IF( NEW.type = '0') THEN
	IF( NEW.reseller_id > '0') THEN
    	SELECT domain FROM invoice_conf WHERE accountid = NEW.reseller_id INTO @default_domain;
    ELSE
		SELECT domain FROM invoice_conf WHERE accountid = '1' INTO @default_domain;
    END IF;
    SET domain_id = (SELECT max(id+1) FROM domains);
    SET domain_name = CONCAT_WS('.',CONCAT(NEW.first_name,'',domain_id),@default_domain);
    INSERT INTO domains (domain,accountid,status,creation_date,last_modified_date) VALUES (domain_name,NEW.id,0,UTC_TIMESTAMP(),UTC_TIMESTAMP());
END IF;
END;
-- end-event

-- ---------------2021-04-02
UPDATE `feature_code` SET `feature` = 'Call Recording Active' WHERE `feature_action` = 'call_recording_active';


-- ---------------2021-10-21
ALTER TABLE `pbx_recording` MODIFY file_name text;

-- ---------------2022-02-23 HP:
ALTER TABLE `pbx_ivr_specification` ADD `exit_msg_id` INT(11) NOT NULL DEFAULT '0' AFTER `invalid_msg_id`;
