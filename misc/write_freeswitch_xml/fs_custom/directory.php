<?php
// ##############################################################################
// ASTPP - Open Source VoIP Billing Solution
//
// Copyright (C) 2016 iNextrix Technologies Pvt. Ltd.
// Samir Doshi <samir.doshi@inextrix.com>
// ASTPP Version 3.0 and above
// License https://www.gnu.org/licenses/agpl-3.0.html
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program. If not, see <http://www.gnu.org/licenses/>.
// ##############################################################################


//Define variables
$fs_directory="/etc/freeswitch/directory/default/";
$table_name="temp_sip_devices_fs";
$fs_cli_password="EX6XSmRJcUPCp74h";

// Error handling
define ( 'ENVIRONMENT', 'production' );

if (defined ( 'ENVIRONMENT' )) {
	switch (ENVIRONMENT) {
		case 'development' :
			error_reporting ( E_ALL );
			break;
		
		case 'testing' :
		case 'production' :
			error_reporting ( 0 );
			break;
		
		default :
			error_reporting ( E_ALL );
	}
}

// Include file
include ("lib/astpp.xml.php");
include ("lib/astpp.db.php");
include ("lib/astpp.logger.php");
include ("lib/astpp.lib.php");

// Define db object
$db = new db ();

// Get default configuration
$lib = new lib ();

$config = $lib->get_configurations ( $db );
// echo "<pre>";print_r($config);exit;
// Define logger object
$logger = new logger ( $lib );

$action = "";
if (isset($argv[1]) and $argv[1] == 'rewrite')
{
	$action = $argv[1];
}

// Define file name
$file = "astpp.write_directory.php";

// Include file
include_once ("scripts/" . $file);
?>
