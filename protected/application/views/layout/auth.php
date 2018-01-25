<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<title><?=APP_NAME." :: ".$title;?></title>
	<meta name="resource-type" content="document">
	<meta name="robots" content="all, noindex, nofollow">
	<meta name="googlebot" content="all, noindex, nofollow">
	<?php
		if(!empty($meta)) { foreach($meta as $name=>$content){ echo "\n\t\t<meta name='$name' content='$content'>"; }}
		if(!empty($canonical)) { echo "\n\t\t<link rel='canonical' href='$canonical'>"; }
		foreach($css as $file) { echo "\n\t\t<link href='$file' rel='stylesheet' type='text/css'>"; }
	?>
	<link rel="icon" type="image/png" href="<?=site_url('assets/img/'.SESSNAME.'.png');?>">
	<link rel="stylesheet" href="<?=site_url('assets/css/fontawesome-all.min.css');?>">
    <link rel="stylesheet" href="<?=site_url('assets/css/fontface.css');?>">
    <link rel="stylesheet" href="<?=site_url('assets/css/login.css');?>">
</head>
<body>
	<div class="background"></div>
	<div class="backdrop backdrop-dotted"></div>
	<div class="login-form-container">
		<div class="login-form-box">
			<div class="login-form-header">
				<div class="logo"><img src="<?=site_url('assets/img/'.SESSNAME.'.png');?>"/></div>
				<h3><?=$title?></h3>
			</div>
			<div class="login-form-content">
				<?=$output?>
			</div>
		</div>
	</div>
	<!-- Javascript Libraries -->
	<script src="<?=site_url('assets/js/jquery.min.js');?>"></script>
	<script src="<?=site_url('assets/js/jquery.validate.min.js');?>"></script>
	<?php foreach($js as $file){ echo "\n\t\t<script src='$file'></script>"; } ?>
	<script src="<?=site_url('assets/js/dante.js');?>"></script>

</body>
</html>
