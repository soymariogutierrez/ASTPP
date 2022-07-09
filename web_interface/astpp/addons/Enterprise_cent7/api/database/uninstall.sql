--
-- PBX DELETE Query
--

DROP TABLE IF EXISTS `dialer_device_info`;

DELETE FROM `system` where sub_group = 'Dialer Configuration';

DELETE FROM `system` where sub_group = 'Ad-Mob';

DROP TABLE IF EXISTS `admob_coins`;

DELETE FROM `system` where sub_group = 'notifications';

DELETE FROM `system` where sub_group = 'Alert Notifications';