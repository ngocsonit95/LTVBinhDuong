$(function () {
    //select box
    SelectCustumer('.js-multiple-skill', " kĩ năng", 3)
    SelectCustumer('.js-multiple-school', " trường đại học", 3)

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

});