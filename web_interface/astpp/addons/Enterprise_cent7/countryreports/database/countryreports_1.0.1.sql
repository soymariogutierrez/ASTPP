-- --sandip roles and permission for admin

update userlevels set module_permissions = concat( module_permissions, ',', (  SELECT max( id ) FROM menu_modules where module_url = 'countryreports/accounts_list/') ) WHERE userlevelid = 2;