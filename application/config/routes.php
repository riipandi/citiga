<?php defined('BASEPATH') OR exit('No direct script access allowed');

$route['translate_uri_dashes']  = FALSE;
$route['default_controller']    = 'auth/index';
$route['dashboard']             = 'welcome/dashboard';
$route['privacy']               = 'welcome/privacy';
$route['robots.txt']            = 'welcome/robotxt';

// oAuth Login
$route['oauth2']                 = 'oauth2/index';
$route['oauth2/(:any)']          = 'oauth2/authorize/$1';
$route['oauth2/callback/(:any)'] = 'oauth2/callback/$1';

// Authentication
$route['signin']                = 'auth/index';
$route['signup']                = 'auth/signup';
$route['signout']               = 'auth/signout';
$route['lostpass']              = 'auth/lostpass';
$route['resetpass']             = 'auth/resetpas';
$route['changepass']            = 'auth/changepass';
$route['activate']              = 'auth/activate';
$route['deactivate']            = 'auth/deactivate';

$route['profile']               = 'auth/user_profile';
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

