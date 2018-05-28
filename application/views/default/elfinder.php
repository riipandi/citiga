<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>CodeIgniter3 with elFinder - Aris Ripandi</title>
	<style type="text/css">
		::selection{background-color:#E13300;color:#fff}
		::moz-selection{background-color:#E13300;color:#fff}
		::webkit-selection{background-color:#E13300;color:#fff}
		body{background-color:#fff;margin:40px;font:13px/20px normal Helvetica,Arial,sans-serif;color:#4F5155}
		a{color:#039;background-color:transparent;font-weight:400}
		h1{color:#444;background-color:transparent;border-bottom:1px solid #D0D0D0;font-size:19px;font-weight:400;margin:0 0 14px;padding:14px 15px 10px}
		code{font-family:Consolas,Monaco,Courier New,Courier,monospace;font-size:12px;background-color:#f9f9f9;border:1px solid #D0D0D0;color:#002166;display:block;margin:14px 0;padding:12px 10px}
		#body{margin:0 15px}
		p.footer{text-align:right;font-size:11px;border-top:1px solid #D0D0D0;line-height:32px;padding:0 10px;margin:20px 0 0}
		#container{margin:10px;border:1px solid #D0D0D0;-webkit-box-shadow:0 0 8px #D0D0D0}
	</style>
	<link rel="stylesheet" type="text/css" href="<?=site_url('assets/css/jquery-ui.min.css'); ?>" />
	<link rel="stylesheet" type="text/css" href="<?=site_url('assets/elfinder/css/theme.css'); ?>" />
	<link rel="stylesheet" type="text/css" href="<?=site_url('assets/elfinder/css/elfinder.min.css'); ?>" />
</head>
<body>
	<div id="container">
		<h1>CodeIgniter3 with elFinder <span style="float:right">Aris Ripandi</span></h1>
		<div id="body">
			<div id="elfinder-tag"></div>
		</div>
		<p class="footer">Page rendered in <strong>{elapsed_time}</strong> seconds</p>
	</div>

	<!-- Javascript Library -->
	<script src="<?=site_url('assets/js/jquery.min.js'); ?>"></script>
	<script src="<?=site_url('assets/js/jquery-ui.min.js'); ?>"></script>
	<script src="<?=site_url('assets/elfinder/js/elfinder.min.js'); ?>"></script>
	<script src="<?=site_url('assets/js/toastr.min.js'); ?>"></script>
	<script src="<?=site_url('assets/js/arci3.js'); ?>"></script>
	
	<!-- Custom Application Script -->
	<script>
		var url_connector = '<?=$connector?>';
		$('#elfinder-tag').elfinder({
			url: url_connector,
			commandsOptions : {
				quicklook : {googleDocsMimes : ['application/pdf', 'image/tiff', 'application/vnd.ms-office', 'application/msword', 'application/vnd.ms-word', 'application/vnd.ms-excel', 'application/vnd.ms-powerpoint', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet']},
				help : { view : ['about', 'shortcuts'] },
			},
			ui: ['toolbar','tree','stat'],
			uiOptions : {
				toolbar : [
					['home'], ['back','forward','up'],
					['mkfile','mkdir','upload','rm'],
					['reload','view','info'], ['fullscreen'],
				],
				tree : { openRootOnLoad : true, syncTree : true },
				navbar : { minWidth : 160, maxWidth :480 },
				cwd : { oldSchool : false }
			},
			resizable: false, width: 'auto', sort: 'nameDirsFirst', cssClass: '',
		}).elfinder('instance');
	</script>
</body>
</html>