DELETE FROM `system` where name in ('live_secret_key','live_publishable_key','stripe_fix_charges','stripe_flag','stripe_mode','sandbox_secret_key','sandbox_publishable_key');

DROP TABLE IF EXISTS card_details;

DROP TABLE IF EXISTS auto_refill_history;

ALTER TABLE `accounts`
  DROP `auto_refill`,
  DROP `refill_amount_limit`,
  DROP `occurrence_per_day`;

DELETE FROM `cron_settings` WHERE `file_path` = "wget --no-check-certificate -O - -q {BASE_URL}autorefill/auto_refill/";

DELETE FROM `menu_modules` WHERE `module_url` = 'user/user_card_management/' AND `module_name` = 'user';

DELETE FROM `roles_and_permission` WHERE `menu_name`= 'my_account' AND `module_name`= 'user' AND `module_url` ='user_card_management' AND `login_type` = '2';
