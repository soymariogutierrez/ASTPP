
update `cron_settings` set `command` = 'days' , `default_interval_type` = 'days' where file_path = 'wget --no-check-certificate -q -O- {BASE_URL}scheduleReport/Schedule_Report';

-- --sandip change for roles and permission

update userlevels set module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules where `module_url` = 'schedule_report/schedule_report_list/') ) WHERE userlevelid = 2;
