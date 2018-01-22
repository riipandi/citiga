<?php defined('BASEPATH') OR exit('No direct script access allowed');

$active_group  = 'default';
$query_builder = TRUE;

$db['default'] = array(
    'port'     => DB_PORT,
    'hostname' => DB_HOST,
    'username' => DB_USER,
    'password' => DB_PASS,
    'database' => DB_NAME,
    'dbdriver' => 'mysqli',
    'pconnect' => FALSE,
    'db_debug' => FALSE,
    'cache_on' => FALSE,
    'char_set' => 'utf8',
    'dbcollat' => 'utf8_general_ci',
    'encrypt'  => FALSE,
    'compress' => FALSE,
    'stricton' => FALSE,
    'failover' => array(),
    'save_queries' => TRUE
);
