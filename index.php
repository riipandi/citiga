<?php define('ENVIRONMENT', 'development'); // development|production

$system_path        = 'vendor/codeigniter/framework/system';
$application_folder = 'application';
$view_folder        = 'application/views';

@ini_set('display_errors', 0);
if(!file_exists(dirname(__FILE__).'/vendor')) {
    die('Please install with the `composer update` first!');
} else {
    define('ROOT_PATH', dirname(__FILE__).'/');
    define('FILE_PATH', dirname(__FILE__).'/files/');
    define('TEMP_PATH', dirname(__FILE__).'/files/temp/');
    require_once $application_folder.'/config.inc.php';
    if (defined(DB_NAME) || DB_NAME !== '') {
        if (!$conn = mysqli_connect(DB_HOST.':'.DB_PORT, DB_USER, DB_PASS, DB_NAME)) {
            die('Please check your database connection parameter!');
        }
    }
    require_once $application_folder.'/system.php';
}
