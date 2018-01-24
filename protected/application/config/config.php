<?php defined('BASEPATH') OR exit('No direct script access allowed');

/*
|--------------------------------------------------------------------------
| Base Site URL
|--------------------------------------------------------------------------
*/
$port = $_SERVER['SERVER_PORT'];
$prot = 'http' . ((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') ? 's' : '') . '://';
$path = str_replace('index.php', '', $_SERVER['SCRIPT_NAME']);
$port = ((($port == 80) || ($port == 443)) ? '' : ':' . $port);
$config['base_url'] = $prot . $_SERVER['SERVER_NAME'] . $port . "" . $path;

/*
|--------------------------------------------------------------------------
| URI CONFIGURATION
|--------------------------------------------------------------------------
*/
$config['index_page']       = '';
$config['uri_protocol']	    = 'REQUEST_URI';
$config['url_suffix']       = '';

/*
|--------------------------------------------------------------------------
| Locales
|--------------------------------------------------------------------------
*/
$config['language']	        = 'english';
$config['charset']          = 'UTF-8';

/*
|--------------------------------------------------------------------------
| System Hooks and Class Extension Prefix
|--------------------------------------------------------------------------
*/
$config['enable_hooks']     = TRUE;
$config['subclass_prefix']  = 'MY_';

/*
|--------------------------------------------------------------------------
| Composer auto-loading
|--------------------------------------------------------------------------
|
| For more information about Composer, please visit http://getcomposer.org/
|
| Note: This will NOT disable or override the CodeIgniter-specific
|	autoloading (application/config/autoload.php)
*/
$config['composer_autoload'] = FCPATH.'vendor/autoload.php';

/*
|--------------------------------------------------------------------------
| URL Characters & Query Strings
|--------------------------------------------------------------------------
*/
$config['permitted_uri_chars']   = 'a-z 0-9~%.:_\-';
$config['enable_query_strings']  = FALSE;
$config['cache_query_string']    = FALSE;
$config['controller_trigger']    = 'c';
$config['function_trigger']      = 'm';
$config['directory_trigger']     = 'd';

/*
|--------------------------------------------------------------------------
| Error Logging
|--------------------------------------------------------------------------
|
|	0 = Disables logging, Error logging TURNED OFF
|	1 = Error Messages (including PHP errors)
|	2 = Debug Messages
|	3 = Informational Messages
|	4 = All Messages
|
*/
$config['log_threshold']        = 0;
$config['log_file_extension']   = 'php';
$config['log_file_permissions'] = 0644;
$config['log_date_format']      = 'Y-m-d H:i:s';
$config['log_path']             = FCPATH . 'temp' . DIRECTORY_SEPARATOR;

/*
|--------------------------------------------------------------------------
| Other Directory Path
|--------------------------------------------------------------------------
|
*/
$config['error_views_path']     = APPPATH . 'errors' . DIRECTORY_SEPARATOR;
$config['cache_path']           = $config['log_path'];

/*
|--------------------------------------------------------------------------
| Encryption Key
|--------------------------------------------------------------------------
|
| If you use the Encryption class, you must set an encryption key.
| See the user guide for more info.
|
| https://codeigniter.com/user_guide/libraries/encryption.html
|
*/
$config['encryption_key'] = '9dcfad793878046bcd6ae50c7e7ec0fb';

/*
|--------------------------------------------------------------------------
| Session Variables
|--------------------------------------------------------------------------
*/
$config['sess_driver']              = 'files';
$config['sess_save_path']           = $config['log_path'];
$config['sess_cookie_name']         = strtolower(str_replace(' ','', APP_NAME));
$config['sess_expiration']          = 7200;
$config['sess_time_to_update']      = 300;
$config['sess_match_ip']            = TRUE;
$config['sess_regenerate_destroy']  = TRUE;

/*
|--------------------------------------------------------------------------
| Cookie Related Variables
|--------------------------------------------------------------------------
|
| 'cookie_prefix'   = Set a cookie name prefix if you need to avoid collisions
| 'cookie_domain'   = Set to .your-domain.com for site-wide cookies
| 'cookie_path'     = Typically will be a forward slash
| 'cookie_secure'   = Cookie will only be set if a secure HTTPS connection exists.
| 'cookie_httponly' = Cookie will only be accessible via HTTP(S) (no javascript)
|
| Note: These settings (with the exception of 'cookie_prefix' and
|       'cookie_httponly') will also affect sessions.
|
*/
$config['cookie_prefix']	= '';
$config['cookie_domain']	= '';
$config['cookie_path']		= '/';
$config['cookie_secure']	= FALSE;
$config['cookie_httponly'] 	= FALSE;

/*
|--------------------------------------------------------------------------
| Cross Site Request Forgery
|--------------------------------------------------------------------------
|
| 'csrf_token_name' = The token name
| 'csrf_cookie_name' = The cookie name
| 'csrf_expire' = The number in seconds the token should expire.
| 'csrf_regenerate' = Regenerate token on every submission
| 'csrf_exclude_uris' = Array of URIs which ignore CSRF checks
*/
$config['csrf_protection']   = TRUE;
$config['csrf_regenerate']   = TRUE;
$config['csrf_token_name']   = 'csrftoken';
$config['csrf_cookie_name']  = 'cxcookies';
$config['csrf_expire']       = 7200;
$config['csrf_exclude_uris'] = array();

/*
|--------------------------------------------------------------------------
| Other Settings
|--------------------------------------------------------------------------
*/
$config['time_reference']       = TIMEZONE;
$config['compress_output']      = FALSE;
$config['rewrite_short_tags']   = FALSE;
$config['proxy_ips']            = '';

/*
|--------------------------------------------------------------------------
| SMTP Mail Configuration
|--------------------------------------------------------------------------
*/
$config['protocol']  = 'smtp';
$config['smtp_host'] = defined('SMTP_HOST') ? SMTP_HOST : 'smtp.mailtrap.io';
$config['smtp_user'] = defined('SMTP_USER') ? SMTP_USER : 'bcadc69ad9b52f';
$config['smtp_pass'] = defined('SMTP_PASS') ? SMTP_PASS : '96116554b82171';
$config['smtp_port'] = defined('SMTP_PORT') ? SMTP_PORT : 2525;
$config['crlf']      = "\r\n";
$config['newline']   = "\r\n";

/*
|--------------------------------------------------------------------------
| Extra Custom Configuration
|--------------------------------------------------------------------------
*/
$config['maintenance_mode']     = FALSE;
$config['minify_output']        = FALSE;
$config['use_recaptcha']        = FALSE;

/*
|--------------------------------------------------------------------------
| Google reCaptcha
|--------------------------------------------------------------------------
*/
$config['recaptcha.options'] = [
    'dataBadge' => 'bottomright',
    'debug'     => false,
    'hideBadge' => false,
    'timeout'   => 10,
];
