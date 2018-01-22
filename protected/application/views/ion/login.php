<div class="row justify-content-center">
  <div class="col-md-5">
      <div class="card p-4">
        <?php echo form_open('login', 'class="login-form" id="login-form"');?>
        <div class="card-body py-5">
            <div class="text-center font-weight-light" id="infoMessage"><?php echo $message;?></div>
              <div class="form-group">
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                      <span class="input-group-text"><i class="fa fa-user"></i></span>
                  </div>
                  <input class="form-control" type="text" name="identity" id="identity" placeholder="<?php echo lang('login_identity_label');?>" autocomplete="off" autofocus required>
                </div>
              </div>
              <div class="form-group">
                <div class="input-group mb-3">
                      <div class="input-group-prepend">
                          <span class="input-group-text"><i class="fa fa-key"></i></span>
                      </div>
                      <input class="form-control" type="password" name="password" id="password" placeholder="<?php echo lang('login_password_label');?>" autocomplete="off" required>
                  </div>
              </div>
              <div class="form-group">
                <button type="submit" class="btn btn-primary px-5">Login</button>
                <a href="<?=site_url('forgot_password');?>" class="btn btn-link float-right">Forgot password?</a>
              </div>
          </div>
          <?php echo form_close();?>
        </div>
  </div>
</div>