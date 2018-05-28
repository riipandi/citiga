# What is CodeIgniter

CodeIgniter is an Application Development Framework - a toolkit - for people
who build web sites using PHP. Its goal is to enable you to develop projects
much faster than you could if you were writing code from scratch, by providing
a rich set of libraries for commonly needed tasks, as well as a simple
interface and logical structure to access these libraries. CodeIgniter lets
you creatively focus on your project by minimizing the amount of code needed
for a given task.

## Release Information

This repo contains in-development code. To download the latest stable release 
please visit <https://codeigniter.com/download>. This repo contain:

```
 - CodeIgniter3
 - Asura Admin
 - Font Awesome 5
 - Bootstrap 3
 - Bootstrap Datepicker
 - jQuery Vide
 - ToastrJs
 - DataTables
 - ChartJs
 - PopperJS
 - ElFinder
```

## Server Requirements

PHP version 5.6 or newer is recommended. It should work on 5.4.8 as well, 
but we strongly advise you NOT to run such old versions of PHP, because 
of potential security and performance issues, as well as missing features.

## Installation

Create file `config.inc.php` in folder `applications` with this code:

```
<?php defined('ENVIRONMENT') OR exit('No direct script access allowed');

/**
 * MySQL Database Connection
 * Please set default timezone
*/
define('DB_PORT', 'database_port');
define('DB_HOST', 'database_host');
define('DB_NAME', 'database_name');
define('DB_USER', 'database_user');
define('DB_PASS', 'database_pass');

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

define('RECAPTCHA_SITEKEY',   '');
define('RECAPTCHA_SECRETKEY', '');
```

Add this htaccess configuration if you are using Apache Web Server:

```
Options -Indexes +ExecCGI +FollowSymLinks
DirectoryIndex index.php index.html default.html

<IfModule rewrite_module>
  RewriteEngine On
  RewriteCond %{REQUEST_FILENAME} !-f
  RewriteCond %{REQUEST_FILENAME} !-d
  RewriteRule ^(.*)$ index.php/$1 [L]
</IfModule>
```

## License

Please see the `license file`.

## Resources

- User Guide <https://codeigniter.com/docs>
- Language File Translations <https://github.com/bcit-ci/codeigniter3-translations>
- Community Forums <http://forum.codeigniter.com/>
- Community Wiki <https://github.com/bcit-ci/CodeIgniter/wiki>
- Community Slack Channel <https://codeigniterchat.slack.com>

Report security issues to our Security Panel <mailto:security@codeigniter.com>
or via our page on HackerOne <https://hackerone.com/codeigniter>, thank you.

## Acknowledgement

The CodeIgniter team would like to thank EllisLab, all the contributors 
to the CodeIgniter project and you, the CodeIgniter user.
