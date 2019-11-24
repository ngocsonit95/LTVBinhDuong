$(function () {
    $('.btn_Register').click(function (event) {
        event.preventDefault();


        var fullName = $('.text_FullName').val();
        var username = $('.text_Username').val();
        var password = $('.text_Password').val();
        var repassword = $('.text_Repassword').val();
        var email = $('.text_Email').val();

        var rule = $('.rule').is(':checked') ? true : false;

        var validData = ValidateData(fullName, username, email, password, repassword, rule);
        if (!validData)
            return;

        var data = "{fullName: '{0}' , email: '{1}' , username: '{2}' , password: '{3}'}"
            .replace("{0}", fullName)
            .replace("{1}", email)
            .replace("{2}", username)
            .replace("{3}", password);


        //Khởi chạy preload
        $('.preloader').show();

        $.ajax({
            url: '/ServiceUtility.asmx/Register',
            async: true,
            dataType: "json",
            type: "POST",
            contentType: "application/json; charset=utf-8",
            data: data,
            success: function (data) {
                if (data.d === 1) {
                    $('.preloader').fadeOut(500);
                    alertify.notify('Email đã tồn tại!', 'error', 5);
                }
                if (data.d === 2) {
                    $('.preloader').fadeOut(500);
                    alertify.notify('Tài khoản đã tồn tại!', 'error', 5);
                }
                if (data.d === 3) {+
                    $('.preloader').fadeOut(500);
                    alertify.notify('Vui lòng thử lại!', 'error', 5);
                }
                if (data.d === 4) {
                    ClearForm();
                    $('.preloader').fadeOut(500);
                    alertify.notify('Đăng ký thành công. Vui lòng đăng nhập!', 'success', 5);
                }

            },
            error: function () {
                $('.preloader').fadeOut(500);
                alertify.notify('Lỗi hệ thống. Vui lòng thử lại!', 'error', 5);
            }
        });
    });

});

function ValidateData(fullName, username, email, password, repassword, rule) {
    if (fullName === "") {
        alertify.notify('Vui lòng nhập tên đầy đủ!', 'error', 5);
        return;
    }
    if (username === "") {
        alertify.notify('Vui lòng nhập tài khoản!', 'error', 5);
        return;
    }
    if (!validateEmail(email)) {
        alertify.notify('Vui lòng nhập đúng định dạng email!', 'error', 5);
        return;
    }
    if (password === "") {
        alertify.notify('Vui lòng nhập mật khẩu!', 'error', 5);
        return;
    }
    if (password !== repassword) {
        alertify.notify('Vui lòng nhập mật khẩu 2 lần giống nhau!', 'error', 5);
        return;
    }
    if (rule === false) {
        alertify.notify('Vui lòng đồng ý với điều khoản của trang web!', 'error', 5);
        return;
    }

    return true;
}

function validateEmail(Email) {
    var pattern = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

    return $.trim(Email).match(pattern) ? true : false;
}

function ClearForm() {
    $('.text_FullName').val("");
    $('.text_Username').val("");
    $('.text_Password').val("");
    $('.text_Repassword').val("");
    $('.text_Email').val("");

    $('.rule').removeAttr('checked');
}

