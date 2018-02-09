<div class="container-fluid">
	<div class="row">
		<div class="col-md-8">
            <?php echo form_open(uri_string());?>
            <?php //echo form_open('user/edit/'.$user->id, 'class="form-horizontal" id="form"');?>
            <?php echo form_hidden('id', $user->id); echo form_hidden($csrf); ?>
			<div class="card">
				<div class="card-header bg-light"><?=$title?></div>
				<div class="card-body">
                              <div class="row">
                                    <div class="col-md-6">
                                    <div class="form-group">
                                          <label>First Name</label>
                                          <?=form_input($first_name,'','class="form-control" placeholder="Nama Depan" required');?>
                                    </div>
                                    </div>

                                    <div class="col-md-6">
                                    <div class="form-group">
                                          <label>Last Name</label>
                                          <?=form_input($last_name,'','class="form-control" placeholder="Nama Belakang" required');?>
                                    </div>
                                    </div>
                              </div>
                              <div class="row mt-2">
                                    <div class="col-md-6">
                                    <div class="form-group">
                                          <label>User Name</label>
                                          <?=form_error('identity');?>
                                          <?=form_input($identity,'','class="form-control" placeholder="Nama Pengguna" required');?>
                                    </div>
                                    </div>

                                    <div class="col-md-6">
                                    <div class="form-group">
                                          <label>Phone Number</label>
                                          <?=form_input($phone,'','class="form-control" placeholder="Nomor telepon" required');?>
                                    </div>
                                    </div>
                              </div>

                              <div class="row mt-2">
                                    <div class="col-md-6">
                                          <div class="form-group">
                                                <label>Email Address</label>
                                                <?=form_input($email,'','class="form-control" placeholder="Alamat email" required');?>
                                                <small class="form-text">Digunakan untuk mengirim password jika lupa.</small>
                                          </div>
                                    </div>
                                    <div class="col-md-6 invisible">
                                          <div class="form-group">
                                                <label>Company Name</label>
                                                <?=form_input($company,'','class="form-control" placeholder="Nama instansi"');?>
                                                <small class="form-text">Optional, tidak wajib diisi.</small>
                                          </div>
                                    </div>
                              </div>

                              <div class="row mt-2">
                                    <div class="col-md-6">
                                    <div class="form-group">
                                          <label>Password</label>
                                          <?=form_password($password,'','class="form-control" placeholder="Kata sandi"');?>
                                          <small class="form-text">Kosongkan jika tidak ingin mengubah kata sandi.</small>
                                    </div>
                                    </div>

                                    <div class="col-md-6">
                                    <div class="form-group">
                                          <label>Confirm Password</label>
                                          <?=form_password($password_confirm,'','class="form-control" placeholder="Konfirmasi kata sandi"');?>
                                    </div>
                                    </div>
                              </div>
                              
                              <?php if (($this->ion_auth->is_admin())): ?>
                              <div class="row mt-2">
                                    <div class="col-md-12">
                                    <div class="form-group">
                                          <label>Member of groups</label>
                                          <?php foreach ($groups as $group):?>
                                                <label class="checkbox form-control">
                                                <?php
                                                      $gID=$group['id']; $checked=null; $item=null;
                                                      foreach($currentGroups as $grp) {
                                                            if ($gID == $grp->id) {$checked= ' checked="checked"'; break;}
                                                      }
                                                      $disabled = (($user->id == 1) && ($gID == 1)) ? ' disabled' : '';
                                                ?>
                                                <input type="checkbox" name="groups[]" value="<?$group['id'];?>"<?php echo $checked.$disabled;?>>
                                                <?=htmlspecialchars(ucfirst($group['name']),ENT_QUOTES,'UTF-8');?> &nbsp;&ndash;&nbsp;
                                                <?=htmlspecialchars(ucfirst($group['description']),ENT_QUOTES,'UTF-8');?>
                                                </label>
                                          <?php endforeach?>
                                    </div>
                                    </div>
                              </div>
                              <?php endif ?>
                        </div>
                        <div class="card-footer bg-light">
                              <a href="<?=$this->agent->referrer()?>" class="btn btn-danger"><i class="fa fa-arrow-left"></i> &nbsp; Kembali</a>
                              <button type="submit" id="btnSave" class="btn btn-primary float-right">
                                    <i class="fa fa-save"></i> &nbsp; Simpan
                              </button>
                        </div>
                  </div>
		</div>
            <?php echo form_close();?>
		<div class="col-md-4">
                  <div class="card">
                        <div class="card-body text-center">
                             <img src="<?=site_url('assets/img/avatar-1.png');?>" class="avatar img-fluid p-2 border" alt="avatar">
                        </div>
                        <div class="card-footer bg-light">
                              <a href="#" class="btn btn-danger btn-block sorry">Ubah Foto</a>                 
                        </div>
                  </div>
            </div>
	</div>
</div>
