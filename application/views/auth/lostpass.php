<div class="login-message">
  <?=(!empty($message)) ? $message : '';?>
</div>
<script>var login_url = '<?=site_url('lostpass ')?>';</script>
<?php echo form_open('lostpass', 'class="login-form" id="lostpass-form"');?>
  <?php if (!empty($return_url)):?>
  <input type="hidden" name="return_url" value="<?=$return_url?>" id="return_url" />
  <?php endif;?>
  <div class="input-container">
    <i class="fa fa-user"></i>
    <?=form_input('identity','','class="input" id="identity" placeholder="Username" autocomplete="off" autofocus');?>
  </div>
  <small class="validation" id="identity_validate"></small>
  <?php if (!empty($captcha)) { echo '<div class="rememberme-container">'.$captcha->render().'</div>'; } ?>
  <?=form_submit('submit', 'Submit', 'class="button" id="login-button"');?>
    <a href="<?=site_url('login')?>" class="register">back to login</a>
    <?=form_close();?>
