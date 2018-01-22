<?php define('ENVIRONMENT', 'development');

$system_path        = 'protected/vendor/codeigniter/framework/system';
$application_folder = 'protected/application';
$view_folder        = 'protected/application/views';

if(!file_exists(dirname(__FILE__).'/protected/vendor')) {
    die('Please install with the `composer update` first!');
} else {
    require_once 'protected/config.inc.php';
    if (defined(DB_NAME) || DB_NAME !== '') {
        if (!$conn = mysqli_connect(DB_HOST.':'.DB_PORT, DB_USER, DB_PASS, DB_NAME)) {
            die('Please check your database connection parameter!');
        }
    }
    require_once 'protected/system.php';
}
