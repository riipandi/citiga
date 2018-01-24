<?php defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| Hooks
| -------------------------------------------------------------------------
| This file lets you define "hooks" to extend CI without hacking the core
| files.  Please see the user guide for info:
|
|	https://codeigniter.com/user_guide/general/hooks.html
|
*/

$hook['pre_system'][] = array(
  'class'    => 'dantehooks',
  'function' => 'maintenance_mode',
  'filename' => 'dantehooks.php',
  'filepath' => 'hooks'
);

// Compress output
$hook['display_override'][] = array(
	'class'    => 'dantehooks',
	'function' => 'minify_output',
	'filename' => 'dantehooks.php',
	'filepath' => 'hooks'
);