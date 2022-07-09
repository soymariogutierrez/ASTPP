delete from system where group_title='InternationalRecharge';
delete from menu_modules where module_url='recharge/recharge_add/';
delete from menu_modules where module_url='recharge/recharge_list/';
drop table transferto;

delete from `roles_and_permission` where `module_name`='recharge' AND `module_url`='recharge_list' AND `login_type`=0;
