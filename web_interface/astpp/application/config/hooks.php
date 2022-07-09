<?php

if (! defined ( 'BASEPATH' )) {
	exit ( 'No direct script access allowed' );
}
/*
 * | -------------------------------------------------------------------------
 * | Hooks
 * | -------------------------------------------------------------------------
 * | This file lets you define "hooks" to extend CI without hacking the core
 * | files. Please see the user guide for info:
 * |
 * | http://codeigniter.com/user_guide/general/hooks.html
 * |
 */
/*
 *
 * Purpose : Display logo based on domain name
 *
 */
$hook['pre_system'][] = array(
		'class' => 'PHPFatalError',
		'function' => 'setHandler',
		'filename' => 'PHPFatalError.php',
		'filepath' => 'hooks'
);
$hook ['pre_system'][] = array (
		'class' => 'Router',
		'function' => 'route',
		'filename' => 'router.php',
		'filepath' => 'hooks' 
);

$hook ['pre_controller'][] = array (
		'class' => 'Router',
		'function' => 'config',
		'filename' => 'router.php',
		'filepath' => 'hooks' 
);
/*********************************************************/
/*
 *
 * Purpose : For audit log
 *
 */
$hook['post_system'][] = array('class' => 'Usertracking', 
                'function' => 'auto_track',
                'filename' => 'Usertracking.php',
                'filepath' => 'libraries');
                           
/*********************************************************/

//Make menu dynamic
$dir=getcwd()."/application/config/addons";
$a = scandir($dir);

foreach($a as $key=>$val){

	if($val!=='.' || $val!='..'){
		$function=str_replace(".php","",$val);
		if(file_exists($dir."/".$val."/hooks.php")){
			include_once($dir."/".$val."/hooks.php");
		}
	}
}
/***************/
/* End of file hooks.php */
/* Location: ./application/config/hooks.php */
