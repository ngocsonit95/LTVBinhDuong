$(function () {
    $("#send_Report").click(function () {
        var txtMess = $(".txt_Mess").val();
        var txtName = $(".txt_Name").val();
        var txtMobi = $(".txt_Mobi").val();
        var txtEmail = $(".txt_Email").val();
        if (txtMess=="") {
            alertify.notify('Vui lòng nhập nội dung!', 'error', 5);
            return;
        }
        if (txtName == "") {
            alertify.notify('Vui lòng nhập đầy đủ họ tên!', 'error', 5);
            return;
        }
        if (txtMobi == "") {
            alertify.notify('Vui lòng nhập số điện thoại!', 'error', 5);
            return;
        }

        if (!validateEmail(txtEmail)) {
            alertify.notify('Vui lòng nhập Email đúng định dạng!', 'error', 5);
            return;
        }


        var idReport = getParameterByName("id", window.location.href);
        var data = "{message: '{0}', fullName: '{1}', mobi: '{2}', email: '{3}', reportID: '{4}'}"
            .replace("{0}", txtMess)
            .replace("{1}", txtName)
            .replace("{2}", txtMobi)
            .replace("{3}", txtEmail)
            .replace("{4}", idReport);

        $.ajax({
            url: '/ServiceUtility.asmx/AddReport',
            data: data,
            dataType: "json",
            type: "POST",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                if (data.d == true) {
                    alertify.notify('Thêm báo cáo thành công!', 'success', 5);
                }
                else if (data.d == false) {
                    $("#mess").attr("class", "alert alert-danger");
                    $("#mess").css("display", "block");
                    $("#mess").text("Không thành công vui lòng thử lại");
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("Error");
            }
        });
    });
});



function getParameterByName(name, url) {

    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}

function validateEmail(Email) {
    var pattern = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

    return $.trim(Email).match(pattern) ? true : false;
}