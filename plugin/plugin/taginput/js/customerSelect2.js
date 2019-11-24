$(function () {
    //select box
    SelectCustumer('.js-multiple-skill', " kĩ năng", 3)
    SelectCustumer('.js-multiple-skill-search', " kĩ năng", 1)
    SelectCustumer('.js-multiple-school', " trường đại học", 3)
    SelectCustumer('.js-multiple-school-search', " trường đại học", 1)

    function SelectCustumer(target, type, selectLength) {
        $(target).select2({
            width: '100%',
            maximumSelectionLength: selectLength,
            placeholder: "Chọn " + type,
            "language": {
                'noResults': function () {
                    return "Không tìm thấy " + type + " bạn chọn";
                },
                'maximumSelected': function () {
                    return "Xin lỗi! Cho phép chọn tối đa " + selectLength + type;
                }
            }
        });
    }


    ////Search ajax
    //$('.js-data-example-ajax').select2({
    //    ajax: {
    //        url: '/ServiceUtility.asmx/GetSchool',
    //        dataType: 'xml',
    //        type: "GET",
    //        quietMillis: 50,
    //        data: function (term) {
    //            return {
    //                term: term
    //            };
    //        },
    //        results: function (data) {
    //            return {
    //                results: $.map(data, function (item) {
    //                    debugger;
    //                    return {
    //                        text: item.Title,
    //                        id: item.SchoolID
    //                    }

    //                })
    //            };
    //        }
    //    }
    //});
});