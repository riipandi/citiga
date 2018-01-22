<div class="row justify-content-center">
  <div class="col-md-5">
      <div class="card p-4">
      <div class="card-header text-center text-uppercase h4 font-weight-light"><?=$title?></div>
        <?=form_open('login', 'class="login-form" id="login-form"');?>
        <?php if (!empty($return_url)):?>
          <input type="hidden" name="return_url" value="<?=$return_url?>" id="return_url" />
        <?php endif;?>
        <div class="card-body py-3">
            <div class="text-center font-weight-light" id="infoMessage"><?=(!empty($message)) ? '<p>'.$message.'</p>' : '';?></div>
              <div class="form-group">
                <div class="input-group mb-0">
                  <div class="input-group-prepend">
                      <span class="input-group-text"><i class="fa fa-user"></i></span>
                  </div>
                  <?=form_input('identity','','class="form-control" id="identity" placeholder="Username" autocomplete="off" autofocus required');?>
                </div>
                <small class="form-text" id="identity_validate"></small>
              </div>
              <div class="form-group">
                 <div class="input-group mb-0">
                      <div class="input-group-prepend">
                          <span class="input-group-text"><i class="fa fa-key"></i></span>
                      </div>
                      <?=form_password('password','','class="form-control" id="password" placeholder="Password" autocomplete="off" required');?>
                  </div>
                <small class="form-text" id="password_validate"></small>                  
              </div>
              <?php if (!empty($captcha)) { echo '<div class="mb-3 p-0">'.$captcha->render().'</div>'; } ?>
              <div class="custom-control custom-checkbox">
                  <?=form_checkbox('remember','1',FALSE,'class="custom-control-input cursor-pointer" id="login"');?>
                  <label class="custom-control-label cursor-pointer" for="login">Remember Me</label>
                  <a href="<?=site_url('lostpass');?>" class="float-right">Forgot password?</a>
              </div>
              <div class="form-group">
                <?=form_submit('submit', 'Log in', 'class="btn btn-primary btn-block mt-3" id="login-button"');?>
              </div>
          </div>
          <?=form_close();?>
        </div>
  </div>
</div>
<script>var login_url = '<?=site_url('login')?>';</script>