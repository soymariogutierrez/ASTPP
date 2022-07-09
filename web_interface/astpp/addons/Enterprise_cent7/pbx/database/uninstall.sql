--
-- PBX DELETE Query
--

delete from `did_call_types` where call_type_code >= 7 and call_type_code <= 11;

update `dids` set extensions ='',call_type=0 where call_type >= 7 and call_type <= 11;

delete from `system` where name = 'recording_number';
--
-- RingGroup Module 
--

UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('ringgroup/ringgroup_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = -1;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('ringgroup/ringgroup_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 0;

UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('ringgroup/ringgroup_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 1;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('ringgroup/ringgroup_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 2;


delete from `menu_modules` where `menu_label`='RingGroup' and `module_name`='ringgroup';
delete from `roles_and_permission` where `module_name`='ringgroup' AND `module_url`='ringgroup_list' AND `login_type`=0;
delete from `roles_and_permission` where `module_name`='ringgroup' AND `module_url`='ringgroup_list' AND `login_type`=1;
delete from `roles_and_permission` where `module_name`='ringgroup' AND `module_url`='ringgroup_list' AND `login_type`=2;


DROP TABLE IF EXISTS `pbx_ringgroup`;

--
-- Conference Module
--
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('conference/conferenceprofiles_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = -1;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('conference/conferencecontrols_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = -1;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('conference/conference_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = -1;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('conference/conference_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 0;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('conference/conference_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 1;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('conference/conference_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 2;

delete from `menu_modules` where `module_url`='conference/conferenceprofiles_list/' and `module_name`='conference';
delete from `menu_modules` where `module_url`='conference/conferencecontrols_list/' and `module_name`='conference';
delete from `menu_modules` where `module_url`='conference/conference_list/' and `module_name`='conference';
delete from `roles_and_permission` where `module_name`='conference' AND `module_url`='conference_list' AND `login_type`=0;
delete from `roles_and_permission` where `module_name`='conference' AND `module_url`='conference_list' AND `login_type`=1;
delete from `roles_and_permission` where `module_name`='conference' AND `module_url`='conference_list' AND `login_type`=2;


DROP TABLE IF EXISTS pbx_conference_controls;
DROP TABLE IF EXISTS pbx_conference_profiles;
DROP TABLE IF EXISTS pbx_conference_specification;

--
-- Queue Module
--
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('queue/queue_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = -1;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('queue/queue_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 0;

UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('queue/queue_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 1;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('queue/queue_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 2;

delete from `menu_modules` where `module_url`='queue/queue_list/' and `module_name`='queue';
delete from `roles_and_permission` where `module_name`='queue' AND `module_url`='queue_list' AND `login_type`=0;
delete from `roles_and_permission` where `module_name`='queue' AND `module_url`='queue_list' AND `login_type`=1;
delete from `roles_and_permission` where `module_name`='queue' AND `module_url`='queue_list' AND `login_type`=2;

DROP TABLE IF EXISTS pbx_queue;

--
-- Recording Module
--

UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('recording/recording_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = -1;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('recording/recording_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 0;

UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('recording/recording_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 1;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('recording/recording_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 2;

delete from `menu_modules` where `module_url`='recording/recording_list/' and `module_name`='recording';
delete from `roles_and_permission` where `module_name`='recording' AND `module_url`='recording_list' AND `login_type`=0;
delete from `roles_and_permission` where `module_name`='recording' AND `module_url`='recording_list' AND `login_type`=1;
delete from `roles_and_permission` where `module_name`='recording' AND `module_url`='recording_list' AND `login_type`=2;

DROP TABLE IF EXISTS pbx_recording;


--
-- Timecondition Module
--

UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('timeconditions/timeconditions_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = -1;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('timeconditions/timeconditions_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 0;

UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('timeconditions/timeconditions_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 1;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('timeconditions/timeconditions_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 2;

delete from `menu_modules` where `module_url`='timeconditions/timeconditions_list/' and `module_name`='timeconditions';
delete from `roles_and_permission` where `module_name`='timeconditions' AND `module_url`='timeconditions_list' AND `login_type`=0;
delete from `roles_and_permission` where `module_name`='timeconditions' AND `module_url`='timeconditions_list' AND `login_type`=1;
delete from `roles_and_permission` where `module_name`='timeconditions' AND `module_url`='timeconditions_list' AND `login_type`=2;

DROP TABLE IF EXISTS time_condition;

--
-- IVR Module
--

UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('ivr/ivr_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = -1;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('ivr/ivr_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 0;

UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('ivr/ivr_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 1;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('ivr/ivr_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 2;

delete from `menu_modules` where `menu_label`='IVR' and `module_name`='IVR';
delete from `roles_and_permission` where `module_name`='ivr' AND `module_url`='ivr_list' AND `login_type`=0;
delete from `roles_and_permission` where `module_name`='ivr' AND `module_url`='ivr_list' AND `login_type`=1;
delete from `roles_and_permission` where `module_name`='ivr' AND `module_url`='ivr_list' AND `login_type`=2;

DROP TABLE IF EXISTS `pbx_ivr_specification`;

DROP TABLE IF EXISTS `pbx_ivr_controls`;

--
-- Featurecode Modue
--

UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('featurecode/featurecode_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = -1;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('featurecode/featurecode_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 1;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('featurecode/featurecode_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 2;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('featurecode/featurecode_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 0;

delete from `menu_modules` where `module_url`='featurecode/featurecode_list/' and `module_name`='featurecode';
delete from `roles_and_permission` where `module_name`='featurecode' AND `module_url`='featurecode_list' AND `login_type`=0;
delete from `roles_and_permission` where `module_name`='featurecode' AND `module_url`='featurecode_list' AND `login_type`=1;

UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('featurecode/user_featurecode_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 0;
delete from `menu_modules` where `module_url`='featurecode/user_featurecode_list/' and `module_name`='featurecode';
delete from `roles_and_permission` where `module_name`='featurecode' AND `module_url`='user_featurecode_list' AND `login_type`=2;	


UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('featurecode/featurecode_pickup_group/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = -1;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('featurecode/featurecode_pickup_group/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 0;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('featurecode/featurecode_pickup_group/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 1;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('featurecode/featurecode_pickup_group/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 2;


delete from `menu_modules` where `module_url`='featurecode/featurecode_pickup_group/' and `module_name`='featurecode';
delete from `roles_and_permission` where `module_name`='featurecode' AND `module_url`='featurecode_pickup_group' AND `login_type`=0;
delete from `roles_and_permission` where `module_name`='featurecode' AND `module_url`='featurecode_pickup_group' AND `login_type`=1;
delete from `roles_and_permission` where `module_name`='featurecode' AND `module_url`='featurecode_pickup_group' AND `login_type`=2;

DROP TABLE IF EXISTS feature_code;

DROP TABLE IF EXISTS pickup_group;


--
-- Deep 
--

UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('domains/domains_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = -1;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('domains/domains_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 1;
UPDATE userlevels ul CROSS JOIN( SELECT GROUP_CONCAT(id) id FROM menu_modules WHERE module_url IN('domains/domains_list/')) mm SET ul.module_permissions =( CASE WHEN mm.id IS NOT NULL THEN REPLACE (ul.module_permissions, CONCAT(",",mm.id ), '') ELSE ul.module_permissions END ) WHERE ul.userlevelid = 2;
delete from `menu_modules` where `menu_label`='Domains' and `module_url`='domains/domains_list/';
delete from `roles_and_permission` where `module_name`='domains' AND `module_url`='domains_list' AND `login_type`=0;
delete from `roles_and_permission` where `module_name`='domains' AND `module_url`='domains_list' AND `login_type`=1;

DROP TRIGGER IF EXISTS `add_domain`;
DROP TRIGGER IF EXISTS `add_sip_routing`;

DROP TABLE IF EXISTS `domains`;
DROP TABLE IF EXISTS `sip_device_routing`;

DELETE FROM `translations` WHERE `module_name` = 'pbx';

-- ----------------2019-07-23
delete from `sip_devices` where `is_pbx` = '0';
ALTER TABLE `sip_devices` DROP INDEX `username`, ADD UNIQUE `username` (`username`) USING BTREE;

-- -------------2020-06-24

DROP TRIGGER IF EXISTS `remove_domain`;