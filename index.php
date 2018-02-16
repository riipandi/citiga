<?php define('ENVIRONMENT', 'development'); // development|production

$system_path        = 'vendor/codeigniter/framework/system';
$application_folder = 'application';
$view_folder        = 'application/views';

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
    $backup_dir = FILE_PATH.'backup';
    $upload_dir = FILE_PATH.'upload';
    if ( (!is_dir($backup_dir)) || (!is_dir($upload_dir)) ) { 
        mkdir($backup_dir, 0777, TRUE);
        mkdir($upload_dir, 0777, TRUE);
    }
    //if (is_writable($backup_dir)) { echo 'Backup directory not writeable!'; }
    //if (is_writable($upload_dir)) { echo 'Upload directory not writeable!'; }
    require_once $application_folder.'/bootstrap.php';
}
