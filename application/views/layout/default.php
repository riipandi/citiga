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
	<link rel="stylesheet" href="<?=site_url('assets/css/ionicons.min.css');?>">
	<link rel="stylesheet" href="<?=site_url('assets/css/toastr.min.css');?>">
    <link rel="stylesheet" href="<?=site_url('assets/css/styles.css');?>">
</head>
<body class="sidebar-fixed header-fixed">
<!--body class="sidebar-hidden header-fixed"-->
	<!-- Page Wrapper -->
	<div class="page-wrapper">
		<!-- Header Nav -->
		<nav class="navbar page-header">
 			<a href="#" class="btn btn-link sidebar-toggle d-md-down-none"><i class="icon ion-navicon-round"></i></a>
			<a href="#" class="btn btn-link sidebar-mobile-toggle d-md-none mr-auto"><i class="icon ion-navicon-round"></i></a>
			<!--span class="navbar-brand"><img src="<?=site_url('assets/img/'.SESSNAME.'.png');?>" class="avatar avatar-xs" alt="<?=APP_NAME?>"></span-->
			<ul class="navbar-nav ml-auto">
				<li class="nav-item d-md-down-none">
					<a onclick="$(document).toggleFullScreen()" id="fullscreen" title="Toggle Fullscreen" class="cursor-pointer"><i class="icon ion-android-expand" ></i></a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<img src="<?=site_url('assets/img/avatar-1.png');?>" class="avatar avatar-xs" alt="avatar">
						<span class="small ml-1 d-md-down-none"><?=ucfirst($user->first_name .' '.$user->last_name);?></span>
					</a>
					<div class="dropdown-menu dropdown-menu-right">
						<a href="<?=site_url('profile');?>" class="dropdown-item"><i class="icon ion-user-circle"></i> Profile</a>
						<a href="<?=site_url('logout');?>" class="dropdown-item"><i class="icon ion-power-off"></i> Logout</a>
					</div>
				</li>
			</ul>
		</nav>
		<!--// Header Nav -->

		<!-- Main Container -->
		<div class="main-container">
			
			<!-- Header Text -->
			<?php
				if($this->load->get_section('text_header') != '') {
					echo '<h1>'.$this->load->get_section('text_header').'</h1>';
				}
			?>
			<!--// Header Text -->

			<!-- Sidebar -->
			<div class="sidebar">
				<nav class="sidebar-nav">
					<ul class="nav">
						<li class="nav-title mt-2">Menu Navigasi</li>
						<li class="nav-item">
							<a href="<?=site_url('dashboard');?>" class="nav-link"><i class="icon ion-home"></i> Dashboard</a>
						</li>
						
						<?php 
							if (file_exists(dirname(__FILE__).'/sidenav.php')) {
								include dirname(__FILE__).'/sidenav.php';
							}
						?>

						<li class="nav-item nav-dropdown">
							<a href="#" class="nav-link nav-dropdown-toggle"><i class="icon ion-ios-gear"></i> Pengaturan <i class="icon ion-ios-arrow-down"></i></a>
							<ul class="nav-dropdown-items">
								<li class="nav-item"><a href="<?=site_url('users');?>" class="nav-link"><i class="icon ion-ios-arrow-thin-right"></i> Pengguna</a></li>
								<li class="nav-item"><a href="<?=site_url('options');?>" class="nav-link"><i class="icon ion-ios-arrow-thin-right"></i> Pengaturan Umum</a></li>
								<li class="nav-item"><a href="<?=site_url('backup');?>" class="nav-link"><i class="icon ion-ios-arrow-thin-right"></i> Backup Restore Data</a></li>
							</ul>
						</li>
						
						<li class="nav-title mt-4">Informasi</li>
						<li class="nav-item"><a href="#" class="nav-link sorry"><i class="icon ion-help-circled"></i> Informasi Aplikasi</a></li>
						<li class="nav-item"><a href="#" class="nav-link sorry"><i class="icon ion-ios-book"></i> Panduan Penggunaan</a></li>
						<li class="nav-item"><a href="#" class="nav-link sorry"><i class="icon ion-email"></i> Hubungi Pengembang</a></li>
					</ul>
				</nav>
			</div>
			<!--// Sidebar -->
			
			<!-- Content -->
			<div class="content">
				<?php echo $output; //echo $this->load->get_section('sidebar'); ?>
			</div>
			<!--// Content -->
		</div>
		<!--// Main Container -->
		<footer class="main-footer small dfn">
			Loaded in {elapsed_time} seconds. <?=APP_NAME.' v'.APP_VERSION?>
		</footer>
	</div>
	<!--// Page Wrapper -->


	<!-- Modal Confirm -->
	<div class="modal fade" id="confirm-get" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Confirmation</h5>
				</div>
				<div class="modal-body">Are you sure to do this action?</div>
				<div class="modal-footer">
					<a class="btn btn-primary btn-ok">Yes, I'm sure!</a>
					<button type="button" class="btn btn-danger" data-dismiss="modal">No, Cancel</button>
				</div>
			</div>
		</div>
	</div>
	<!--// Modal Confirm -->

	<!-- Javascript Libraries -->
	<script src="<?=site_url('assets/js/jquery.min.js');?>"></script>
	<script src="<?=site_url('assets/js/jquery.validate.min.js');?>"></script>
	<script src="<?=site_url('assets/js/bootstrap.bundle.min.js');?>"></script>
	<script src="<?=site_url('assets/js/toastr.min.js');?>"></script>
	<script src="<?=site_url('assets/js/jquery.fullscreen-min.js');?>"></script>
	<?php foreach($js as $file){ echo "\n\t\t<script src='$file'></script>"; } ?>
	<script src="<?=site_url('assets/js/dante.js');?>"></script>

	<?php if (!empty($this->session->flashdata('message'))): ?>
	<script>toastr.info('<?=$this->session->flashdata("message");?>');</script>
	<?php endif; ?>
	
</body>
</html>
