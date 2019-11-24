
//Biến khởi tạo số lượng sản phẩm trên một trang
var pageSize = 5;

//Khi trang load lên gán trang hiện tại là 1
var pageCurrent = 1;

//Teamplate mẫu danh sách
var templates = (
    `<li class="row">
        <div class="col-12 col-md-2 avatar">
            <div class="hexagon" style=" background-image: url({0});">
                <div class="hexTop"></div>
                <div class="hexBottom"></div>
            </div>
            <p class="job-status {6}">{7}</p>
        </div>
        <div class="col-12 col-md-7 info">
            <p class="name">{1}</p>

            <small class="skill">{2}</small><br />
            <p class="info-bottom">
                <span class="address">
                    <i class="fa fa-map-marker"></i>
                   {3}
                </span>
                <br />
                 <span class="address">
                  <i class="fa fa-laptop"></i>
                 Làm việc tại: {8}
                </span>
                <span class="time" >
                    <i class="fa fa-calendar"></i>
                    Năm tốt nghiệp:
                    {4}
                </span >
            </p >
        </div >
        <div class="col-12 col-md-3">
            <a href="/InfoEdit.aspx?id={5}" class="btn btn-outline-danger btn-view flat form-control" data-href="{6}"   data-fancybox >
                <i class="fa fa-eye"></i>
                Xem thông tin
            </a>
        </div>
    </li>
`);

//Model chứa thuộc tính search
var model = {
    'Type': 0,
    'KeySearch': 0
};

//Hàm sẳn sàng
$(function () {
    var urlCurrent = window.location.url;
    var keySearch = getParameterByName("keyword", urlCurrent);
    if (keySearch != null) {
        model = {
            'Type': "keyname",
            'KeySearch': keySearch
        };
        LoadData(model);
    }
    else {
        LoadData(model);
    }
})

//Hàm click khi nhấn vào xem thêm
$("#load-more").click(function () {
    $(this).hide();
    $(".loading").show();

    pageCurrent++;
    LoadData(model);
})

//Hàm load dữ liệu
function LoadData(model) {
    $("#load-more").hide();
    $(".loading").show();

    setTimeout(function () {
        $.ajax({
            type: "POST",
            url: "/ServiceUtility.asmx/GetUser",
            data: '{page: ' + pageCurrent + ',pageSize:' + pageSize + ',modelSearch:' + JSON.stringify(model) + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            cache: false,
            success: OnSuccess,
            failure: function (response) {
                console.log(response);
            },
            error: function (response) {
                console.log(response);
            }
        });
    }, 500)
}

//Hàm được gọi khi dữ liệu từ server trả về thành công
function OnSuccess(response) {
    var flag = true;
    if (response.d.length == 0) {
        alertify.notify('Rất tiếc! Danh mục này chưa có danh sách thành viên', 'error', 4);
        flag = false;
    }
    $.map(response.d, function (item) {
        var date = parseJsonDate(item.CreateTime);
        var avatar = "";
        if (item.Avatar == "")
            avatar = "/images/NotFound/notfound.png";
        else
            avatar = item.Avatar.replace("/", "\/");
        var temp = templates
            .replace("{0}", avatar)
            .replace("~", "")
            .replace("{1}", item.FullName)
            .replace("{2}", item.Skill == "" ? "Chưa cập nhật kỹ năng" : item.Skill)
            .replace("{3}", item.NameSchool == "" ? "Chưa cập nhật trường đại học" : item.NameSchool)
            .replace("{5}", item.UserID);
        if (item.GraduationYear == 0) {
            temp = temp.replace("{4}", "Chưa cập nhật");
        }
        else {
            temp = temp.replace("{4}", item.GraduationYear);
        }
        if (item.JobStatus == true) {
            temp = temp
                .replace("{6}", "job-success")
                .replace("{7}", "Đã có việc")
        }
        else {
            temp = temp
                .replace("{6}", "job-danger")
                .replace("{7}", "Chưa có việc")
        }

        if (item.TitleCompany == "") {
            temp = temp.replace("{8}", "Chưa đi làm");
        }
        else
            temp = temp.replace("{8}", item.TitleCompany)


        $("#list-dev").append(temp);
        if (item.FlagPage == true) {
            flag = false;
            $("#load-more").hide();
        }
    })
    //Hiên thị button
    $(".loading").hide();
    if (flag) {
        $("#load-more").show();
    }
}

//Xử lý search left
function SerchToUrl(typeSearch, idSearch) {
    model = {
        'Type': typeSearch,
        'KeySearch': idSearch
    };
    pageSize = 5;
    pageCurrent = 1;
    $("#list-dev li").remove();

    if (typeSearch == "sk") {
        $(".js-multiple-skill-search").select2('val', idSearch);
    }
    else {
        $(".js-multiple-skill-search").select2('val', 0);
    }
    LoadData(model);
}

//Hàm fortmat thời gian Json trả về
function parseJsonDate(jsonDate) {
    var offset = new Date().getTimezoneOffset() * 60000;
    var parts = /\/Date\((-?\d+)([+-]\d{2})?(\d{2})?.*/.exec(jsonDate);
    if (parts[2] == undefined) parts[2] = 0;
    if (parts[3] == undefined) parts[3] = 0;
    d = new Date(+parts[1] + offset + parts[2] * 3600000 + parts[3] * 60000);
    date = d.getDate();
    date = date < 10 ? "0" + date : date;
    mon = d.getMonth() + 1;
    mon = mon < 10 ? "0" + mon : mon;
    year = d.getFullYear();
    return (date + "/" + mon + "/" + year);
};

