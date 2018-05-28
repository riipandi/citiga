<div class="login-message">
  <?=(!empty($this->session->flashdata('message'))) ? $this->session->flashdata('message') : '';?>
</div>
<script>var login_url = '<?=site_url('signin')?>';</script>
<?=form_open('signin', 'class="login-form" id="login-form"');?>
  <?php if (!empty($return_url)):?>
  <input type="hidden" name="return_url" value="<?=$return_url?>" id="return_url" />
  <input type="hidden" name="<?=$csrf_name?>" value="<?=$csrf_hash?>" />
  <?php endif;?>
  <div class="input-container">
    <i class="icon ion-person"></i>
    <?=form_input('identity','','class="input" id="identity" placeholder="Username" autocomplete="off" autofocus');?>
  </div>
  <small class="validation" id="identity_validate"></small>
  <div class="input-container">
    <i class="icon ion-lock-combination"></i>
    <?=form_password('password','','class="input" id="password" placeholder="Password" autocomplete="off"');?>
    <i id="show-password" class="icon ion-eye"></i>
  </div>
  <small class="validation" id="password_validate"></small>
  <?php if (!empty($captcha)) { echo '<div class="rememberme-container">'.$captcha->render().'</div>'; } ?>
  <!-- <div class="rememberme-container">
    <input type="checkbox" name="rememberme" id="rememberme" />
    <label for="rememberme" class="rememberme">
      <span>Ingatkan saya</span>
    </label>
    <a class="forgot-password" href="<?=site_url('lostpass')?>">Lupa Password?</a>
  </div> -->
  <?=form_submit('submit', 'Log in', 'class="button" id="login-button"');?>
    <!--a href="#" class="register">Register</a-->
    <?=form_close();?>
      <!-- <div class="resend-activation">
        Sudah terdaftar tapi belum menerima link aktivasi? <br/><a href="#">Kirim ulang link aktivasi</a>
      </div> -->

      <!-- <?php if (!empty($social_login)):?>
    <div class="separator">
        <span class="separator-text">atau login dengan</span>
    </div>
    <div class="socmed-login">
      <a href="<?=site_url('oauth2/facebook')?>" title="Login dengan akun Facebook" class="socmed-btn facebook-btn">
        <i class="icon-18 ion-social-facebook"></i>
      <a>
      <a href="<?=site_url('oauth2/google')?>" title="Login dengan akun Google" class="socmed-btn google-btn">
        <i class="icon-18 ion-social-googleplus"></i>
      </a>
      <a href="<?=site_url('oauth2/github')?>" title="Login dengan akun Github" class="socmed-btn github-btn">
        <i class="icon-18 ion-social-github"></i>
      <a>
      <a href="<?=site_url('oauth2/telegram')?>" title="Login dengan Telegram" class="socmed-btn telegram-btn">
        <i class="icon-18 ion-paper-airplane"></i>
      <a>
    </div>
  <?php endif;?> -->
    