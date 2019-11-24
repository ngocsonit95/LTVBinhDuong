
$(function () {
    if (getCookie('cuser') !== "" && getCookie('cpass') !== "") {
        $('.text-username').val(getCookie('cuser'));
        $('.text-password').val(getCookie('cpass'));
    }

    $('.btn_login').click(function (event) {

        event.preventDefault();
        var username = $('.text-username').val();
        var password = $('.text-password').val();

        if (username === "") {
            alertify.notify('Vui lòng nhập tài khoản!', 'error', 5);
            return;
        }

        if (password === "") {
            alertify.notify('Vui lòng nhập mật khẩu!', 'error', 5);
            return;
        }

        //Khởi chạy preload
        $('.preloader').show();

        var data = "{username: '{0}' , password: '{1}'}".replace("{0}", username).replace("{1}", password);
        $.ajax({
            url: '/ServiceUtility.asmx/Login',
            async: true,
            dataType: "json",
            type: "POST",
            contentType: "application/json; charset=utf-8",
            data: data,
            success: function (data) {
                if (data.d === true) {
                    if ($('.note').is(':checked')) {
                        setCookie('cuser', username, 1);
                        setCookie('cpass', password, 1);
                    }
                    else {
                        setCookie('cuser', username, -1);
                        setCookie('cpass', password, -1);
                    }
                    window.location = "/";

                    setTimeout(function () {
                        $('.preloader').hide();
                    }, 500)
                }
                else {
                    setTimeout(function () {
                        $('.preloader').hide();
                    }, 500)
                    alertify.notify('Đăng nhập không thành công!', 'error', 5);
                }
            },
            error: function () {
                setTimeout(function () {
                    $('.preloader').hide();
                }, 500)
                alertify.notify('Lỗi hệ thống!', 'error', 5);
            }
        });
    });

});

// Hàm thiết lập Cookie
function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = "expires=" + d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}

// Hàm lấy Cookie
function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) === ' ') c = c.substring(1);
        if (c.indexOf(name) === 0) return c.substring(name.length, c.length);
    }
    return "";
}