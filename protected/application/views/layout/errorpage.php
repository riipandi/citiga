<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title><?=$heading?></title>
	<style>
		div.logo{height:200px;width:155px;display:inline-block;opacity:.08;position:absolute;top:2rem;left:50%;margin-left:-73px}
		body{height:100%;background:#fafafa;font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;color:#777;font-weight:300}
		h1{font-weight:bold;letter-spacing:.8px;font-size:3rem;margin-top:40px;margin-bottom:0;color:#222}
		.wrap{max-width:768px;margin:8% auto;padding:2rem;background:#fff;text-align:center;border:1px solid #efefef;border-radius:.5rem;position:relative}
		.version{margin-top:10px;color:#999} .guide{margin-top:2rem;text-align:left} pre{white-space:normal;margin-top:1.5rem}
		code{background:#fafafa;border:1px solid #efefef;padding:.5rem 1rem;border-radius:5px;display:block}
		p{margin-top:1rem; line-height:1.4rem;} .text-center {text-align: center;} a:active,a:link,a:visited{color:#dd4814;text-decoration:none;}
		.footer{margin-top:2rem;border-top:1px solid #efefef;padding:2em 2em 0;font-size:85%;color:#999} .previous {padding-top: 1.4em;}
		@media (max-width: 768px) { .wrap{max-width:400px;} }
	</style>
</head>
<body>
<div class="wrap">
	<h1><?=$heading?></h1>
	<div class="logo">
		<svg version="1.0" xmlns="http://www.w3.org/2000/svg"
			 width="155.000000px" height="200.000000px" viewBox="0 0 155.000000 200.000000"
			 preserveAspectRatio="xMidYMid meet">
		<g transform="translate(0.000000,200.000000) scale(0.100000,-0.100000)" fill="#000000" stroke="none">
		<path d="M737 1963 c22 -79 -7 -185 -78 -290 -18 -26 -107 -122 -197 -213
			  -239 -240 -336 -371 -403 -544 -79 -206 -78 -408 5 -582 64 -134 212 -264 361
			  -314 l60 -20 -30 22 c-210 152 -229 387 -48 588 25 27 48 50 51 50 4 0 7 -27
			  7 -61 0 -57 2 -62 37 -95 30 -27 46 -34 78 -34 56 0 99 24 116 65 29 69 16
			  120 -50 205 -105 134 -117 233 -43 347 l31 48 7 -47 c13 -82 58 -129 250 -258
			  209 -141 306 -261 328 -405 11 -72 -1 -161 -31 -218 -27 -53 -112 -143 -165
			  -174 -24 -14 -43 -26 -43 -28 0 -2 24 4 53 14 241 83 427 271 482 486 19 76
			  19 202 -1 285 -35 152 -146 305 -299 412 l-70 49 -6 -33 c-8 -48 -26 -76 -59
			  -93 -45 -23 -103 -19 -138 10 -67 57 -78 146 -37 305 30 116 32 206 5 291 -27
			  89 -104 206 -162 247 -17 13 -18 12 -11 -15z"/>
		</g>
		</svg>
	</div>

	<div class="guide text-center">
		<p><?=$message?></p>
		<p>You can try again later, or you can contact the system administrator or site owner.</p>
		<p class="previous">&laquo;&nbsp;<a href="javascript:window.history.back();">back to previous page</a>&nbsp;&raquo;</p>
	</div>
	<div class="footer">
		CodeIgniter version <?=CI_VERSION?>. Environment: <?=ENVIRONMENT?>
	</div>
</div>
</body>
</html>
