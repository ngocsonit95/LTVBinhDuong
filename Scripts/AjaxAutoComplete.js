$(function () {
    $("#input_CompanyName").autocomplete({
        source: function (request, response) {
            $.ajax({
                url: "/ServiceUtility.asmx/GetCompanyName",
                data: "{'title': '" + request.term + "'}",
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    console.log(data);
                    response($.map(data.d, function (item) {
                        return {
                            value: item.Title,
                            ID: item.ID,
                            Avatar: item.Avatar,
                            Address: item.Address,
                            Website: item.Website
                        }
                    }));



                },
                error: function (XMLHttpRequest, textStatus, errorThrow) {
                    alert(textStatus);
                }
            })
        },
        select: function (event, ui) {

            $("#input_CompanyAddress").val(ui.item.Address);
            $("#input_CompanyAddress").attr("readonly","readonly")

            $("#input_CompanyWeb").val(ui.item.Website);
            $("#input_CompanyWeb").attr("readonly", "readonly")

            $("#Company_Avatar").attr("style", "background-image: url('{0}');".replace("{0}", ui.item.Avatar.replace("~", "")));
            $("#label_ImageCompany").hide();
            $("#FileUpload_AvatarCompany").hide();
            $("#input_IDCompanyAjax").val(ui.item.ID);
            $("#input_AvatarCompanyAjax").val(ui.item.Avatar);
            //console.log(response);
        },
        classes: {
            "ui-autocomplete": "highlight"
        }

    });

});