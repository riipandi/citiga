<div class="container-fluid">
	<div class="row">
            <div class="col-md-8">
            <?php echo form_open(uri_string(), 'class="form-horizontal" id="form"');?>
            <?=form_hidden('id', $user->getUsername())?>
			<div class="card">
				<div class="card-header bg-light"><?=$title?></div>
				<div class="card-body">
                              <div class="row">
                                    <div class="col-md-6 form-group">
                                          <label>First Name</label>
                                          <?=form_input('firstname',$firstname,'class="form-control" placeholder="Nama Depan" required');?>
                                    </div>
                                    <div class="col-md-6 form-group">
                                          <label>Last Name</label>
                                          <?=form_input('lastname',$lastname,'class="form-control" placeholder="Nama Belakang" required');?>
                                    </div>
                              </div>
                              <div class="row mt-2">
                                    <div class="col-md-6 form-group">
                                          <label>User Name</label>
                                          <?=form_input('username',$username,'class="form-control" placeholder="Nama Pengguna" required');?>
                                    </div>
                                    <div class="col-md-6 form-group">
                                          <label>Email Address</label>
                                          <?=form_input('mailaddress',$mailaddress,'class="form-control" placeholder="Alamat Email" required');?>
                                    </div>
                              </div>

                              <div class="row mt-2">
                                    <div class="col-md-6 form-group">
                                          <label>Password</label>
                                          <?=form_password('password1','','class="form-control" placeholder="Kata sandi"');?>
                                          <small class="form-text">Kosongkan jika tidak ingin mengubah kata sandi.</small>
                                    </div>
                                    <div class="col-md-6 form-group">
                                          <label>Confirm Password</label>
                                          <?=form_password('password2','','class="form-control" placeholder="Konfirmasi kata sandi"');?>
                                    </div>
                              </div>
                        </div>
                        <div class="card-footer bg-light">
                              <a href="<?=$this->agent->referrer()?>" class="btn btn-danger"><i class="icon ion-arrow-left"></i> &nbsp; Kembali</a>
                              <button type="submit" id="btnSave" class="btn btn-primary float-right">
                                    <i class="icon ion-save"></i> &nbsp; Simpan
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
