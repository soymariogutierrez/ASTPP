<?php
// Build directory xml
function write_directory($logger, $db,$action,$fs_directory,$table_name,$fs_cli_password) {

    //rewrite = delete all files and rewrite all files
    if ($action != ""){
	rewrite_directory($logger,$db,$fs_directory,$fs_cli_password);exit;
    }

    //Reload fs flag
    $reload = false;
    //Check SIP Devices status and based on the take action 1=Newly created, 2 Updated, 3 Deleted
    $query_update = "SELECT * FROM ".$table_name;

    $logger->log ( "Directory table update query : " . $query_update );
	$res_dir_update = $db->run ( $query_update );
	$logger->log ( $res_dir_update );

    foreach ( $res_dir_update as $res_dir_key_update => $res_dir_value_update ) {

        //Delete file
        if ($res_dir_value_update ['action_id'] == 3 or $res_dir_value_update ['action_id'] == 2)
        {
            unlink($fs_directory.$res_dir_value_update ['sip_device_id'].".xml");
            $logger->log ( "Deleted file from fs directory". $res_dir_value_update ['sip_device_id']);
	    $reload = true;
	}

        //Create new file
        if ($res_dir_value_update ['action_id'] == 2 or $res_dir_value_update ['action_id'] == 1)
        {
            $logger->log ( "Create new file in fs directory". $res_dir_value_update ['sip_device_id']);
            $xml = "";
            $query = "SELECT username,dir_params,dir_vars,number as accountcode,accountid FROM sip_devices,accounts WHERE sip_devices.status=0 AND accounts.status=0 AND accounts.deleted=0 AND accounts.id=sip_devices.accountid AND sip_devices.id=".$res_dir_value_update ['sip_device_id']." limit 1";
    
            $logger->log ( "Directory Query : " . $query );
            $res_dir = $db->run ( $query );
            $logger->log ( $res_dir );
            
            foreach ( $res_dir as $res_dir_key => $res_dir_value ) {

                $dir = fopen($fs_directory.$res_dir_value_update['sip_device_id'].".xml", "w");
                $xml = ""; 
                $xml .= "<include>\n";
                $xml .= "  <user id=\"" . $res_dir_value ['username'] . "\">\n";
                
                $params = json_decode ( $res_dir_value ['dir_params'], true );
                
                $vars = json_decode ( $res_dir_value ['dir_vars'], true );
                $param_xml = $var_xml = "";
                foreach ( $params as $parms_key => $res_dir_params ) {
                    $param_xml .= "<param name=\"" . $parms_key . "\" value=\"" . $res_dir_params . "\"/>\n";
                }
                
                foreach ( $vars as $var_key => $res_dir_vars ) {
                    $var_xml .= "<variable name=\"" . $var_key . "\" value=\"" . $res_dir_vars . "\"/>\n";
                }
                
                $xml .= "               <params>\n";
                $xml .= $param_xml;
                $xml .= "<param name=\"allow-empty-password\" value=\"false\"/>\n";
                $xml .= "<param name=\"dial-string\" value=\"{sip_invite_domain=\${domain_name},presence_id=\${dialed_user}@\${domain_name}}\${sofia_contact(*/\${dialed_user}@\${domain_name})}\"/>\n";
                $xml .= "               </params>\n";
                
                $xml .= "               <variables>\n";
                $xml .= $var_xml;
                $xml .= "<variable name=\"sipcall\" value=\"true\"/>\n";
                $xml .= "<variable name=\"sip_user\" value=\"" . $res_dir_value ['username'] . "\"/>\n";
                $xml .= "<variable name=\"accountcode\" value=\"" . $res_dir_value ['accountcode'] . "\"/>\n";
                $xml .= "               </variables>\n";
                $xml .= "           </user>\n";
                $xml .= "</include>";
                fwrite($dir, $xml);
                $logger->log ( $xml );
		fclose($dir);
		$reload = true;	
            }
        }
        $delete_query = "DELETE FROM ".$table_name." WHERE sip_device_id=".$res_dir_value_update ['sip_device_id'];
	$db->run ( $delete_query );

	if ($reload){
		system ("/usr/bin/fs_cli -p".$fs_cli_password." -x 'reloadxml'");
	}
    }
}


// Build directory xml
function rewrite_directory($logger, $db,$fs_directory,$fs_cli_password) {
	$xml = "";

if ($fs_directory != ""){
	$logger->log ( "Delete all files from".$fs_directory );
		shell_exec("rm -rf ".$fs_directory."*.xml");
	}
	
	$query = "SELECT sip_devices.id as sip_device_id,username,dir_params,dir_vars,number as accountcode,accountid FROM sip_devices,accounts WHERE sip_devices.status=0 AND accounts.status=0 AND accounts.deleted=0 AND accounts.id=sip_devices.accountid";
//HP: PBX_ADDON
	
	$logger->log ( "Directory Query : " . $query );
	$res_dir = $db->run ( $query );
	$logger->log ( $res_dir );
	
	foreach ( $res_dir as $res_dir_key => $res_dir_value ) {

		$dir = fopen($fs_directory.$res_dir_value ['sip_device_id'].".xml", "w");
		$xml = ""; 
		$xml .= "<include>\n";
		$xml .= "           <user id=\"" . $res_dir_value ['username'] . "\">\n";
		
		$params = json_decode ( $res_dir_value ['dir_params'], true );
		
		$vars = json_decode ( $res_dir_value ['dir_vars'], true );
		$param_xml = $var_xml = "";
		foreach ( $params as $parms_key => $res_dir_params ) {
			$param_xml .= "<param name=\"" . $parms_key . "\" value=\"" . $res_dir_params . "\"/>\n";
		}
		
		foreach ( $vars as $var_key => $res_dir_vars ) {
			$var_xml .= "<variable name=\"" . $var_key . "\" value=\"" . $res_dir_vars . "\"/>\n";
		}
		
		$xml .= "               <params>\n";
		$xml .= $param_xml;
		$xml .= "<param name=\"allow-empty-password\" value=\"false\"/>\n";
		$xml .= "<param name=\"dial-string\" value=\"{sip_invite_domain=\${domain_name},presence_id=\${dialed_user}@\${domain_name}}\${sofia_contact(*/\${dialed_user}@\${domain_name})}\"/>\n";
		$xml .= "               </params>\n";
		
		$xml .= "               <variables>\n";
		$xml .= $var_xml;
		$xml .= "<variable name=\"sipcall\" value=\"true\"/>\n";
		$xml .= "<variable name=\"sip_user\" value=\"" . $res_dir_value ['username'] . "\"/>\n";
		$xml .= "<variable name=\"accountcode\" value=\"" . $res_dir_value ['accountcode'] . "\"/>\n";
//HP: PBX_ADDON
		$xml .= "               </variables>\n";
		
		$xml .= "           </user>\n";
		$xml .= "</include>";
		fwrite($dir, $xml);
		$logger->log ( $xml );
		fclose($dir);
	}
        system ("/usr/bin/fs_cli -p".$fs_cli_password." -x 'reloadxml'");
}

?>
