$(function () {
    $(document).bind("fullscreenchange", function (e) {
        console.log('Full screen changed');
        $("#fullscreen").attr('title', $(document).fullScreen() ? "Exit Fullscreen" : "Toggle Fullscreen");
    });
    $(document).bind("fullscreenerror", function (e) {
        console.log("Full screen error.");
        toastr.warning("Browser won't enter full screen mode for some reason.");
    });
});

$(document).ready(function () {

    // Fitur Belum Tersedia
    $(".sorry").click(function () {
        toastr['warning']('Sayangnya fitur ini belum tersedia!');
    });

    /**
     * Sidebar Dropdown
     */
    $('.nav-dropdown-toggle').on('click', function (e) {
        e.preventDefault();
        $(this).parent().toggleClass('open');
    });

    // open sub-menu when an item is active.
    $('ul.nav').find('a.active').parent().parent().parent().addClass('open');

    /**
     * Sidebar Toggle
     */
    $('.sidebar-toggle').on('click', function (e) {
        e.preventDefault();
        $('body').toggleClass('sidebar-hidden');
    });

    /**
     * Mobile Sidebar Toggle
     */
    $('.sidebar-mobile-toggle').on('click', function () {
        $('body').toggleClass('sidebar-mobile-show');
    });

    // Return the url with modal
    $('#confirm-get').on('show.bs.modal', function (e) {
        $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
    });

    // Show Password
    $('#show-password').click(function () {
        if ($(this).hasClass('fa-eye')) {
            $('#password').attr('type', 'text');
            $(this).removeClass('fa-eye');
            $(this).addClass('fa-eye-slash');
        } else {
            $('#password').attr('type', 'password');
            $(this).removeClass('fa-eye-slash');
            $(this).addClass('fa-eye');
        }
    })

    // Ajax Login
    $("#login-form").validate({
        rules: {
            password: { required: true },
            identity: { required: true, email: false },
        },
        messages: {
            password: 'Masukan Password Anda',
            identity: 'Masukan Username Anda',
        },
        errorPlacement: function (error, element) {
            var name = $(element).attr('name');
            error.appendTo($('#' + name + '_validate'));
        },
        submitHandler: validateLogin
    });

    // Ajax Login
    function validateLogin() {
        var data = $('#login-form').serialize();
        $.ajax({
            type: 'POST',
            url: login_url,
            data: data,
            beforeSend: function () { $('#login-button').val('Memvalidasi ...'); },
            success: function (response) {
                if (response == "ok") {
                    var return_url = $('#return_url').val();
                    $('#login-button').val('Login berhasil, tunggu sebentar ...');
                    if (return_url) {
                        setTimeout('window.location.href = "' + return_url + '";', 2000);
                    } else {
                        setTimeout('window.location.href = "dashboard";', 2000);
                    }
                } else {
                    $('#login-button').val('Log in');
                    location.reload();
                }
            }
        });
        return false;
    }

    // Ajax Lostpass
    $("#lostpass-form").validate({
        rules: { identity: { required: true, email: false }, },
        messages: { identity: 'Masukan Username Anda', },
        errorPlacement: function (error, element) {
            var name = $(element).attr('name');
            error.appendTo($('#' + name + '_validate'));
        },
        submitHandler: validateLostpass
    });

    function validateLostpass() {
        var data = $('#lostpass-form').serialize();
        $.ajax({
            type: 'POST',
            url: login_url,
            data: data,
            beforeSend: function () { $('#login-button').val('Memvalidasi ...'); },
            success: function (response) {
                if (response == "ok") {
                    $('#login-button').val('Pengguna ditemukan, tunggu sebentar ...');
                    setTimeout('window.location.href = "login";', 2000);
                } else {
                    $('#login-button').val('Submit');
                    location.reload();
                }
            }
        });
        return false;
    }

    /* DataTable
    $('#table-data').DataTable({
        lengthMenu: [[10, 50, 100, 500], [10, 50, 100, 500]],
        language: {searchPlaceholder: "Cari data / record ..."},
        autoWidth: !1, responsive: !0, dom: 'Blfrtip', ordering: false,
    });

    function reload_table() { $('#table-data').DataTable().ajax.reload(); }
    table = $('#table-data').DataTable({
        lengthMenu: [[10, 50, 100, 500], [10, 50, 100, 500]],
        language: {searchPlaceholder: "Cari data / record"},
        autoWidth: !1, responsive: !0, dom: 'Blfrtip',
        processing: true, serverSide: true,
        ajax: { "url": "<?=site_url('user/ajax_list')?>", "type": "POST" },
    });
    */
});
