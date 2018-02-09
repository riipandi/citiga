<?php defined('ENVIRONMENT') OR exit('No direct script access allowed');

/**
 * MySQL Database Connection
 * Please set default time zone
*/
define('DB_PORT', '3306');
define('DB_HOST', 'localhost');
define('DB_NAME', 'arci3');
define('DB_USER', 'root');
define('DB_PASS', '123321');

define('TIMEZONE',  'Asia/Jakarta');

/**
 * SMTP and reCaptcha configuration
 * For getting reCaptcha key, register at:
 *  https://www.google.com/recaptcha/admin
*/
define('SMTP_USER', '');
define('SMTP_PASS', '');
define('SMTP_HOST', '');
define('SMTP_PORT', '');

define('RECAPTCHA_SITEKEY',   '6Lf07SQUAAAAAC54ghk7T6iUhj32SvcXvn3o-zPN');
define('RECAPTCHA_SECRETKEY', '6Lf07SQUAAAAAAeI_lgN65QqkZU3rse2OvHpwlma');
