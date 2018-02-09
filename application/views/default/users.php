<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-header bg-light">
                    <span class="font-weight-bold">Data Pengguna</span>
                    <div class="card-actions">
                        <a onclick="reload_table()" title="Reload Data" class="btn"><i class="fa fa-lg fa-retweet"></i></a>
                        <a onclick="add_group()" title="Buat Grup" class="btn"><i class="fa fa-lg fa-users"></i></a>
                        <a onclick="add_person()" title="Buat Pengguna" class="btn"><i class="fa fa-lg fa-user"></i></a>
                    </div>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table id="table-data" class="table table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Nama Lengkap</th>
                                    <th>Alamat Email</th>
                                    <th>Status</th>
                                    <th>Tindakan</th>
                                </tr>
                            </thead>
							<tbody>
                                <?php $i=1; foreach($users as $user): ?>
								<tr>
									<td><?=$i;?></td>
									<td class="text-nowrap"><?=htmlspecialchars($user->first_name.' '.$user->last_name,ENT_QUOTES,'UTF-8');?></td>
                                    <td class="text-nowrap"><?=htmlspecialchars($user->email,ENT_QUOTES,'UTF-8');?></td>
                                    <td><?php echo ($user->active) ? 'Aktif' : 'Nonaktif';?></td>
                                    <td>
                                        <?=anchor("auth/edit_user/".$user->id, 'Edit') ;?> &nbsp;&ndash;&nbsp;
                                        <?php $act_user = ($user->active) ? 'deactivate' : 'activate'; ?>
                                        <a href="#" data-href="<?=site_url('auth/'.$act_user.'/'.$user->id);?>" data-toggle="modal" data-target="#confirm-get"><?=($user->active) ? 'Nonaktifkan' : 'Aktifkan';?></a>
									</td>
								</tr>
								<?php $i++; endforeach; ?>
                            </tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Bootstrap modal -->
<div class="modal fade" id="modal_form" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title">Person Form</h3>
            </div>
            <div class="modal-body form">
                <form action="#" id="form" class="form-horizontal">
                    <input type="hidden" value="" name="id"/> 
                    <div class="form-body">
                        <div class="form-group">
                            <label class="control-label col-md-3">First Name</label>
                            <div class="col-md-9">
                                <input name="firstName" placeholder="First Name" class="form-control" type="text">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Last Name</label>
                            <div class="col-md-9">
                                <input name="lastName" placeholder="Last Name" class="form-control" type="text">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Gender</label>
                            <div class="col-md-9">
                                <select name="gender" class="form-control">
                                    <option value="">--Select Gender--</option>
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                </select>
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Address</label>
                            <div class="col-md-9">
                                <textarea name="address" placeholder="Address" class="form-control"></textarea>
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Date of Birth</label>
                            <div class="col-md-9">
                                <input name="dob" placeholder="yyyy-mm-dd" class="form-control datepicker" type="text">
                                <span class="help-block"></span>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="btnSave" onclick="save()" class="btn btn-primary">Save</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- End Bootstrap modal -->

<script>

var save_method;
var table;

$(document).ready(function() {
    /*
    table = $('#table-data').DataTable({
        lengthMenu: [[10, 50, 100, 500], [10, 50, 100, 500]],
        language: {searchPlaceholder: "Cari data / record"},
        autoWidth: !1, responsive: !0, dom: 'Blfrtip',
        processing: true, serverSide: true,
        ajax: { "url": "<?=site_url('user/ajax_list')?>", "type": "POST" },
    });
    */
    
    $('.datepicker').datepicker({
        autoclose: true,
        format: "yyyy-mm-dd",
        todayHighlight: true,
        orientation: "top auto",
        todayBtn: true,
        todayHighlight: true,  
    });
});

function add_person()
{
    save_method = 'add';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string
    $('#modal_form').modal('show'); // show bootstrap modal
    $('.modal-title').text('Add Person'); // Set Title to Bootstrap modal title
}

function edit_person(id)
{
    save_method = 'update';
    $('#form')[0].reset(); // reset form on modals
    $('.form-group').removeClass('has-error'); // clear error class
    $('.help-block').empty(); // clear error string

    //Ajax Load data from ajax
    $.ajax({
        url : "<?=site_url('user/ajax_edit/')?>" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
            $('[name="id"]').val(data.id);
            $('[name="firstName"]').val(data.firstName);
            $('[name="lastName"]').val(data.lastName);
            $('[name="gender"]').val(data.gender);
            $('[name="address"]').val(data.address);
            $('[name="dob"]').datepicker('update',data.dob);
            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Person'); // Set title to Bootstrap modal title

        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

function reload_table() { $('#table-data').DataTable().ajax.reload(); }

function save()
{
    $('#btnSave').text('saving...'); //change button text
    $('#btnSave').attr('disabled',true); //set button disable 
    var url;

    if(save_method == 'add') {
        url = "<?=site_url('user/ajax_add')?>";
    } else {
        url = "<?=site_url('user/ajax_update')?>";
    }

    // ajax adding data to database
    $.ajax({
        url : url,
        type: "POST",
        data: $('#form').serialize(),
        dataType: "JSON",
        success: function(data)
        {
            if(data.status) //if success close modal and reload ajax table
            {
                $('#modal_form').modal('hide');
                reload_table();
            }

            $('#btnSave').text('save'); //change button text
            $('#btnSave').attr('disabled',false); //set button enable
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error adding / update data');
            $('#btnSave').text('save'); //change button text
            $('#btnSave').attr('disabled',false); //set button enable 

        }
    });
}

function delete_person(id)
{
    if(confirm('Are you sure delete this data?'))
    {
        // ajax delete data to database
        $.ajax({
            url : "<?=site_url('user/ajax_delete')?>/"+id,
            type: "POST",
            dataType: "JSON",
            success: function(data)
            {
                $('#modal_form').modal('hide');
                reload_table();
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert('Error deleting data');
            }
        });

    }
}
</script>