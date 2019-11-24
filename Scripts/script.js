
//Hàm sẵn sàng
$(function () {

    //Load trang
    $('.preloader').fadeOut(700);
    //Xử lý modal report
    $(".report").click(function () {
        $('#modal-reportStepOne').modal('hide');
        $('#modal-reportStepTwo').modal('show');
    });

    //====Hex========
    $('.honeycombs').honeycombs();

    //=====Placehoder=====\\
    /* Placeholder Typewriter */
    var placeholderText = [
        "Tìm ứng ứng viên...",
        "Nhập tên ứng viên...",
        "Tên lập trình viên..."
    ];

    $('.search-placehoder').placeholderTypewriter({ text: placeholderText });

    //Đóng góp ý kiến
    $('.btn-contact').click(function (e) {
        e.preventDefault();
        //scoll to focus
        var urlCurrent = window.location.pathname.toLowerCase();
        if (urlCurrent == "/default.aspx") {
            var position = $("#contact").offset().top;
            $("html, body").animate({ scrollTop: position }, 400);
        }
        else {
            window.location.href = "/Default.aspx#contact";
        }

    });

    //Back top
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $('#btn-back-top').css("right", "15px");
            //Hiện menu
            $("#main-nav").addClass("show-to-top");
            $("#main-nav").css("padding", "0 15px");
        } else {
            $('#btn-back-top').css("right", "-40px");
            $("#main-nav").removeClass("show-to-top");
            $("#main-nav").css("padding", "0.5rem 1rem");
        }
    });
    $('#btn-back-top').click(function () {
        $("html, body").animate({ scrollTop: 0 }, 600);
        return false;
    });


    //Link login và register
    $("#link-register").click(function () {
        $('#modal-login').modal('hide');
        $('#modal-register').modal('show');
    });

    //Xác nhận đăng nhập trang post
    var urlCurrent = window.location.pathname.toLowerCase();
    if (urlCurrent == "/post.aspx") {
        $('#modal-login').on('hide.bs.modal', function (e) {
            var answer = confirm('Bạn vui lòng đăng nhập để sử dụng được chức năng này. Muốn về trang chủ vui lòng nhấn OK');
            if (answer) {
                window.location.href = "/Default.aspx";
            }
            else {
                return false;
            }
        })
    }



    $(".link-login").click(function () {
        $('#modal-forgotpassword').modal('hide');
        $('#modal-register').modal('hide');
        $('#modal-login').modal('hide');
        $('#modal-login').modal('show');
    });
    $("#link-forgotpassword").click(function () {
        $('#modal-login').modal('hide');
        $('#modal-forgotpassword').modal('show');
    });

    //Load lại trang khi close fancybox cho trang DevList
    $("#list-dev").on("focusin", function () {
        LoadFancybox("[data-fancybox]");
    }); // on

    //Xử lý Fancybox dùng chung
    LoadFancybox("[data-fancybox]");

    //Xử lý khi nhấn nút Report

    //Xử lý modal report
    $(".report").click(function () {
        var text = $(this).text().trim() + ": ";
        $(".txt_Mess").val(text);
        $(".txt_Name").focus();
        $('#modal-reportStepOne').modal('hide');
        $('#modal-reportStepTwo').modal('show');
        $(".txt_Name").focus();
    });

    //Xử lý sự kiện radio job
    if ($("#radio_NotJob").is(':checked')) {
        $(".company-form").fadeOut();
    }
    $('#radio_GotJob').on('change', function () {
        if ($(this).is(":checked")) {
            $(".company-form").fadeIn(1000);
        }
    });

    $('#radio_NotJob').on('change', function () {
        if ($(this).is(":checked")) {
            $(".company-form").fadeOut(1000);
        }
    });
});

//Xử lý Fancybox dùng chung
function LoadFancybox(target) {
    //$(target).fancybox({
    //    type: "iframe",
    //    iframe: {
    //        preload: false,
    //        css: {
    //            width: "1200px",
    //        },
    //    },
    //    afterClose: function () {
    //        console.log($(this).attr('href'));
    //    },
    //});

    $(target).each(function () {
        var url = $(this).attr('href');
        var id = url.split('=')[1];
        $(this).fancybox({
            type: "iframe",
            iframe: {
                preload: false,
                css: {
                    width: "1200px",
                },
            },
            afterClose: function () {
                var session = $("#input_Session").val();
                if (session == id) {
                    location.reload();
                }
            },
        });

    });
};

