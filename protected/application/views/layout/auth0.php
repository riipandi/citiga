<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8"><meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<title><?=APP_NAME." :: ".$title;?></title>
	<meta name="resource-type" content="document">
	<meta name="robots" content="all, noindex, nofollow">
	<meta name="googlebot" content="all, noindex, nofollow">
	<?php
		if(!empty($meta)) { foreach($meta as $name=>$content){ echo "\n\t\t<meta name='$name' content='$content'>"; }}
		if(!empty($canonical)) { echo "\n\t\t<link rel='canonical' href='$canonical'>"; }
		foreach($css as $file) { echo "\n\t\t<link href='$file' rel='stylesheet' type='text/css'>"; }
	?>
	<link rel="shortcut icon" href="<?=site_url('assets/img/favicon.ico');?>" type="image/x-icon">
	<link rel="stylesheet" href="<?=site_url('assets/css/fontawesome-all.min.css');?>">
	<link rel="stylesheet" href="<?=site_url('assets/css/toastr.min.css');?>">
    <link rel="stylesheet" href="<?=site_url('assets/css/styles.css');?>">
</head>
<body>
	<div class="page-wrapper flex-row align-items-center">
		<div class="container">
			<?php echo $output;?>
		</div>
	</div>
	<!-- Javascript Libraries -->
	<script src="<?=site_url('assets/js/jquery.min.js');?>"></script>
	<script src="<?=site_url('assets/js/jquery.validate.min.js');?>"></script>
	<script src="<?=site_url('assets/js/bootstrap.bundle.min.js');?>"></script>
	<script src="<?=site_url('assets/js/toastr.min.js');?>"></script>
	<?php foreach($js as $file){ echo "\n\t\t<script src='$file'></script>"; } ?>
	<script src="<?=site_url('assets/js/dante.js');?>"></script>

	<?php if (!empty($this->session->flashdata('message'))): ?>
	<script>toastr.info('<?=$this->session->flashdata("message");?>');</script>
	<?php endif; ?>
	
</body>
</html>
