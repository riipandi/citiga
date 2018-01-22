<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-header bg-light">
                    <span><?=$title?></span>
                    <div class="card-actions">
                        <a onclick="#" data-toggle="modal" data-target="#modal-add-user" class="btn"><i class="fa fa-lg fa-plus"></i> Tambah</a>
                        <a onclick="location.reload()" class="btn"><i class="fa fa-lg fa-retweet"></i> Refresh</a>
                    </div>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table id="table-data" class="table">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Nama Lengkap</th>
                                    <th>Username</th>
                                    <th>Alamat Email</th>
                                    <th>Telepon</th>
                                    <th>Status</th>
                                    <th>&nbsp;</th>
                                </tr>
                            </thead>
							<tbody>
                                <?php $i=1; foreach($users as $user): ?>
								<tr>
									<td><?=$i;?></td>
									<td class="text-nowrap"><?=htmlspecialchars($user->first_name.' '.$user->last_name,ENT_QUOTES,'UTF-8');?></td>
                                    <td class="text-nowrap"><?=htmlspecialchars($user->username,ENT_QUOTES,'UTF-8');?></td>
                                    <td class="text-nowrap"><?=htmlspecialchars($user->email,ENT_QUOTES,'UTF-8');?></td>
                                    <td class="text-nowrap"><?=htmlspecialchars($user->phone,ENT_QUOTES,'UTF-8');?></td>
                                    <td><?php echo ($user->active) ? 'Aktif' : 'Nonaktif';?></td>
                                    <td>
                                        <div class="dropdown show">
                                            <a class="btn btn-primary btn-sm btn-block dropdown-toggle" href="#" role="button" id="dropAction" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Tindakan</a>
                                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropAction">
                                                <?php $act_user = ($user->active) ? 'deactivate' : 'activate'; ?>
                                                <a href="<?=site_url("user/edit/".$user->id)?>" class="dropdown-item pt-1 pb-1">Edit Pengguna</a>
                                                <?php if ($user->id != 1): ?>
                                                <a href="#" data-href="<?=site_url('user/delete/'.$user->id);?>" class="dropdown-item pt-1 pb-1" data-toggle="modal" data-target="#confirm-get">Hapus Pengguna</a>
                                                <a href="#" class="dropdown-item pt-1 pb-1" data-href="<?=site_url('auth/'.$act_user.'/'.$user->id);?>" data-toggle="modal" data-target="#confirm-get"><?=($user->active) ? 'Nonaktifkan' : 'Aktifkan';?></a>
                                                <?php endif;?>
                                            </div>
                                        </div>
									</td>
								</tr>
								<?php $i++; endforeach; ?>
                            </tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
    </div> <!-- Row -->
    

	<div class="row">
		<div class="col-md-8">
			<div class="card">
				<div class="card-header bg-light">User Group</div>
                <div class="card-actions">
                    <a onclick="#" data-toggle="modal" data-target="#modal-add-group" class="btn"><i class="fa fa-lg fa-plus"></i> Buat Grup</a>
                </div>
				<div class="card-body">
                    <div class="table-responsive">
                        <table id="table-data" class="table">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Grup</th>
                                    <th>Deskripsi</th>
                                    <th>&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $i=1; foreach ($groups as $group):?>
                                <tr>
                                    <td><?=$i;?></td>
                                    <td class="text-nowrap"><?=htmlspecialchars(ucfirst($group['name']),ENT_QUOTES,'UTF-8')?></td>
                                    <td class="text-nowrap"><?=htmlspecialchars(ucfirst($group['description']),ENT_QUOTES,'UTF-8')?></td>
                                    <td>
                                        <div class="btn-group" role="group" aria-label="Actio Group">
                                            <button title="Edit" type="button" class="btn btn-sm btn-primary"><i class="fa fa-edit"></i></button>
                                            <button title="Aktifkan" type="button" class="btn btn-sm btn-success"><i class="fa fa-check"></i></button>
                                            <button title="Hapus" type="button" class="btn btn-sm btn-danger"><i class="fa fa-trash"></i></button>
                                        </div>
                                    </td>
                                </tr>
                                <?php $i++;endforeach;?>
                            </tbody>
                        </table>
                    </div>
				</div>
			</div>
		</div>

		<div class="col-md-4">
			<div class="card">
                <div class="card-header bg-light">Keterangan:</div>
				<div class="card-body">
					<p>
						Proses restorasi data akan menimpa data sebelumnya. Harap berhati-hati 
						karena proses ini tidak dapat dikembalikan, pastikan anda memahami apa 
						yang akan anda lakukan. 
					</p>
					<p>
						Silahkan klik tombol backup untuk membackup data atau pilih salah 
						satu dari file dibawah.
					</p>
				</div>
			</div>
		</div>
	</div> <!-- //row -->
</div>

<!-- Modal AddUser -->
<div class="modal fade" id="modal-add-user" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content">
            <?=form_open('user/add', 'class="form-horizontal" id="form"');?>
                <div class="modal-header">
                    <h5 class="modal-title">Add User</h5>
                </div>
                <div class="modal-body">
                    <input type="hidden" value="" name="id"/>
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
                        <?php if($identity_column!=='email'): ?>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>User Name</label>
                                <?=form_error('identity');?>
                                <?=form_input($identity,'','class="form-control" placeholder="Nama Pengguna" required');?>
                            </div>
                        </div>
                        <?php endif; ?>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Phone Number</label>
                                <?=form_input($phone,'','class="form-control" placeholder="Nomor telepon" required');?>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-2">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Email Address</label>
                                <?=form_input($email,'','class="form-control" placeholder="Alamat email" required');?>
                                <small class="form-text">Digunakan untuk mengirim password jika lupa.</small>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-2">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Password</label>
                                <?=form_password($password,'','class="form-control" placeholder="Kata sandi" required');?>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Confirm Password</label>
                                <?=form_password($password_confirm,'','class="form-control" placeholder="Konfirmasi kata sandi" required');?>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" id="btnSave" class="btn btn-primary">
                        <i class="fa fa-save"></i> &nbsp; Save
                    </button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        <i class="fa fa-times"></i> &nbsp; Cancel
                    </button>
                </div>
            <?=form_close();?>
        </div>
    </div>
</div>
<!--// Modal AddUser -->

<!-- Modal AddGroup -->
<div class="modal fade" id="modal-add-group" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content">
            <?=form_open('group/add', 'class="form-horizontal" id="form"');?>
                <div class="modal-header">
                    <h5 class="modal-title">Add Group</h5>
                </div>
                <div class="modal-body">
                    <input type="hidden" value="" name="id"/>
                    <div class="form-group">
                        <label>Group Name</label>
                        <?php //echo form_input($group_name);?>
                        <?=form_input($group_name,'','class="form-control" placeholder="Nama Grup" required');?>
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <?php //echo form_input($description);?>
                        <?=form_input($description,'','class="form-control" placeholder="Keterangan" required');?>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" id="btnSave" class="btn btn-primary">
                        <i class="fa fa-save"></i> &nbsp; Save
                    </button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        <i class="fa fa-times"></i> &nbsp; Cancel
                    </button>
                </div>
            <?=form_close();?>
        </div>
    </div>
</div>
<!--// Modal AddGroup -->
