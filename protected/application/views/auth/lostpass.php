<div class="row justify-content-center">
  <div class="col-md-5">
      <div class="card p-4">
        <?php echo form_open('lostpass', 'class="login-form" id="login-form"');?>
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
                <button type="submit" class="btn btn-primary px-5">Reset Password</button>
                <a href="<?=site_url('login');?>" class="btn btn-link float-right">Back to login</a>
              </div>
          </div>
          <?php echo form_close();?>
        </div>
  </div>
</div>