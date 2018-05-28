<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title><?php echo APP_NAME ." v". APP_VERSION . " :: Homepage";?></title>
    <link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Merriweather:300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
    <link href="<?=site_url();?>assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="<?=site_url();?>assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="<?=site_url();?>assets/css/landing.css" rel="stylesheet">
  </head>
  <body>
    <div class="overlay"></div>
    <div class="masthead">
      <div class="masthead-bg"></div>
      <div class="container h-100">
        <div class="row h-100">
          <div class="col-12 my-auto">
            <div class="masthead-content text-white py-5 py-md-0">
              <h1 class="mb-3">Sampurasun!</h1>
              <p class="mb-5">
                Selamat datang di aplikasi <strong><?=APP_NAME;?></strong>
                Silahkan klik tombol dibawah ini untuk mulai menggunakan aplikasi ini.
              </p>
              <!--div class="input-group input-group-newsletter">
                <input type="email" class="form-control" placeholder="Enter email..." aria-label="Search for...">
                <span class="input-group-btn">
                  <button class="btn btn-secondary" type="button">Notify Me!</button>
                </span>
              </div-->
              <a href="<?=site_url('login');?>" class="btn btn-secondary btn-lg float-right">Login Sistem</a>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="social-icons">
      <ul class="list-unstyled text-center mb-0">
        <li class="list-unstyled-item">
          <a href="#">
            <i class="fa fa-twitter"></i>
          </a>
        </li>
        <li class="list-unstyled-item">
          <a href="#">
            <i class="fa fa-facebook"></i>
          </a>
        </li>
        <li class="list-unstyled-item">
          <a href="#">
            <i class="fa fa-instagram"></i>
          </a>
        </li>
      </ul>
    </div>

    <!-- Bootstrap core JavaScript -->
    <script src="<?=site_url();?>assets/js/jquery.min.js"></script>
    <script src="<?=site_url();?>assets/js/bootstrap.bundle.min.js"></script>
    <script src="<?=site_url();?>assets/js/jquery.vide.min.js"></script>
    <script>
      (function($) { "use strict"; $('body').vide({ mp4: "assets/mp4/bg.mp4", poster: "assets/img/bg-mobile-fallback.jpg" }, { posterType: 'jpg' }); })(jQuery);
    </script>

  </body>
</html>
