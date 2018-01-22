<?php defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------
| AUTO-LOADER
| -------------------------------------------------------------------
| This file specifies which systems should be loaded by default.
|
| In order to keep the framework as light-weight as possible only the
| absolute minimal resources are loaded by default. For example,
| the database is not connected to automatically since no assumption
| is made regarding whether you intend to use it.  This file lets
| you globally define which systems you would like loaded with every
| request.
|
*/

$autoload['packages']  = [];
$autoload['libraries'] = ['session', 'form_validation', 'user_agent'];
$autoload['drivers']   = [];
$autoload['helper']    = ['form', 'url', 'file'];
$autoload['config']    = [];
$autoload['language']  = [];
$autoload['model']     = [];
