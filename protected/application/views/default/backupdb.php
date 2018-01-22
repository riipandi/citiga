<div class="container-fluid">
	<div class="row">
		<div class="col-md-6">
			<div class="card">
				<div class="card-header bg-light">Backup / Restore</div>
				<div class="card-body">
					<form method="POST" action="<?=site_url('backup/restore_from_upload');?>" enctype="multipart/form-data">
						<div class="row mt-0">
							<div class="col-md-8 mt-0">
								<div class="form-group">
									<div class="input-group">
										<span class="form-control"></span>
										<span class="input-group-btn">
											<span class="btn btn-secondary" onclick="$(this).parent().find('input[type=file]').click();">Pilih file</span>
											<input name="berkas" accept=".sql" class="d-none" type="file" onchange="$(this).parent().parent().find('.form-control').html($(this).val().split(/[\\|/]/).pop());" required>
										</span>
									</div>
								</div>
							</div>
							<div class="col-md-4 mt-0">
								<div class="input-group">
									<button type="submit" class="btn btn-danger btn-block"><i class="fa fa-database"></i> Restore</button>
								</div>
							</div>
						</div>
					</form>
					<div class="row mt-2">
						<div class="col-md-12">
							<div class="input-group">
								<a href="<?=site_url('backup/doBackup');?>" class="btn btn-primary btn-block float-right">
									<i class="fa fa-align-center"></i> &nbsp; Backup Data
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-md-6">
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
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-header bg-light">Backup files
					<?php if (!empty($backup_files)): ?>
						<span class="float-right">
							<a href="#" data-href="<?=site_url('backup/delete_all');?>" data-toggle="modal" data-target="#confirm-get">Delete all</a>
						</span>
					<?php endif; ?>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<?php if (empty($backup_files)){ echo "Tidak ada file backup tersedia."; } else { ?>
						<table class="table table-hover">
                            <thead>
                                <tr>
                                    <th class="text-center">#</th>
                                    <th>Nama File</th>
                                    <th>Tanggal Backup</th>
                                    <th>Ukuran</th>
                                    <th class="text-center">Aksi</th>
                                </tr>
                            </thead>
							<tbody>
								<?php $i=1; foreach(array_reverse($backup_files) as $row): ?>
								<tr>
									<td class="text-center"><?=$i;?></td>
									<td class="text-nowrap"><?=$row;?></td>
									<td class="text-nowrap"><?=human_mydate($row,3);?></td>									
									<td><?php echo human_filesize(filesize($backup_path.$row)); ?></td>
									<td class="text-nowrap text-center">
										<a href="#" data-href="<?=site_url('backup/restore_from_file/'.$row);?>" data-toggle="modal" data-target="#confirm-get">Restore</a> &nbsp;&ndash;&nbsp;
										<a href="<?=site_url('files/backup/'.$row);?>">Download</a>
									</td>
								</tr>
								<?php $i++; endforeach; ?>
							</tbody>
						</table>
						<?php } ?>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
