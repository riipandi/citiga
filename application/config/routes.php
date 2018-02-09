<?php defined('BASEPATH') OR exit('No direct script access allowed');

$route['translate_uri_dashes']  = FALSE;
$route['default_controller']    = 'auth/index';
$route['dashboard']             = 'welcome/dashboard';

// Authentication
$route['login']                 = 'auth/index';
$route['logout']                = 'auth/logout';
$route['lostpass']              = 'auth/lostpass';
$route['resetpass']             = 'auth/resetpas';
$route['changepass']            = 'auth/changepass';
$route['activate']              = 'auth/activate';
$route['deactivate']            = 'auth/deactivate';

$route['profile']               = 'auth/user_edit';
$route['users']                 = 'auth/user_list';
$route['options']               = 'setting/index';

$route['user/add']              = 'auth/user_add';
$route['user/edit/(:num)']      = 'auth/user_edit/$1';
$route['user/delete/(:num)']    = 'auth/user_delete/$1';

$route['group/add']             = 'auth/group_add';
$route['group/edit/(:num)']     = 'auth/group_edit/$1';
$route['group/delete/(:num)']   = 'auth/group_delete/$1';


if (file_exists(dirname(__FILE__).'/approutes.php')) {
    require_once dirname(__FILE__).'/approutes.php';
}

