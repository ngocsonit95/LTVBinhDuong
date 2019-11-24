<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucJS.ascx.cs" Inherits="ucJS" %>

<section id="script">
    <script src="/Scripts/jquery-3.0.0.js"></script>
    <script src="/Scripts/popper.js"></script>
    <script src="/Scripts/bootstrap.js"></script>
    <script src="/plugin/homeycombs/js/jquery.homeycombs.js"></script>
    <script src="/Scripts/jquery.fancybox.js"></script>

    <script src="/Scripts/jquery.uploadPreview.js"></script>
    <script src="/Scripts/placeholderTypewriter.js"></script>
    <script src="/plugin/taginput/js/select2.js"></script>
    <script src="/plugin/taginput/js/customerSelect2.js"></script>
    <script src="/Scripts/AjaxReport.js"></script>
    <script src="/plugin/alertifyjs/alertify.js"></script>
    <script src="/Scripts/LoginFacebook.js"></script>
    <script src="/Scripts/AjaxLogin.js"></script>
    <script src="/Scripts/AjaxRegister.js"></script>

    <script src="/Scripts/script.js"></script>
    <script type="text/javascript">
        //uploadPreview User
        $(document).ready(function () {
            $.uploadPreview({
                input_field: ".image-upload",   // Default: .image-upload
                preview_box: ".image-preview",  // Default: .image-preview
                label_field: ".image-label",    // Default: .image-label
                label_default: "Chọn hình",   // Default: Choose File
                label_selected: "Đổi hình",  // Default: Change File
                no_label: false                 // Default: false
            });
        });

        //uploadPreview Company
        $(document).ready(function () {
            $.uploadPreview({
                input_field: ".image-uploadCompany",   // Default: .image-upload
                preview_box: ".image-previewCompany",  // Default: .image-preview
                label_field: ".image-labelCompany",    // Default: .image-label
                label_default: "Chọn hình",   // Default: Choose File
                label_selected: "Đổi hình",  // Default: Change File
                no_label: false                 // Default: false
            });
        });
    </script>
</section>
