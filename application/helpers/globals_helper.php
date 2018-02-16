<?php defined('BASEPATH') OR exit('No direct script access allowed');

use Monolog\Logger;
use Monolog\Handler\StreamHandler;

class Globals {
    
    private static $authenticated = null;
    private static $initialized = false;

	public static function _recaptcha()
	{
        $CI =& get_instance();
		$cfg = $CI->config->item('recaptcha.options');
		return new \AlbertCht\InvisibleReCaptcha\InvisibleReCaptcha(RECAPTCHA_SITEKEY, RECAPTCHA_SECRETKEY, $cfg);
	}

	public static function _logger($logname = NULL)
	{
		$logger  = new Monolog\Logger($logname);
		$logfile = TEMP_PATH.SESSNAME.'-'.date('ymd').'.log';
		return $logger->pushHandler(new Monolog\Handler\StreamHandler($logfile));
	}

	public static function _auth()
	{
        $CI =& get_instance();
        $CI->load->database();
		$db_port = $CI->db->port;
		$db_host = $CI->db->hostname;
		$db_user = $CI->db->username;
		$db_pass = $CI->db->password;
		$db_name = $CI->db->database;
		$dsn = 'mysql:dbname='.$db_name.';host='.$db_host.';port='.$db_port.';charset=utf8mb4';
		return new \Delight\Auth\Auth(new \Delight\Db\PdoDsn($dsn, $db_user, $db_pass));
	}
    
} // EndClass