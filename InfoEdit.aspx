<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InfoEdit.aspx.cs" Inherits="InfoEdit" %>

<%@ Register Src="~/UserControl/ucMessage.ascx" TagPrefix="uc1" TagName="ucMessage" %>
<%@ Register Src="~/UserControl/ucCSS.ascx" TagPrefix="uc1" TagName="ucCSS" %>

<%@ Register Src="~/UserControl/ucJS.ascx" TagPrefix="uc1" TagName="ucJS" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chỉnh sủa thông tin cá nhân- Lập trình viên Bình Dương</title>
    <%-- ucCSS --%>
    <uc1:ucCSS runat="server" ID="ucCSS" />
    <link href="Content/jquery-ui.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <main>
            <section id="edit-info">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12 text-center info-user">
                            <h3 class="text-uppercase">Thông Tin Cá Nhân</h3>
                            <hr class="mt-sm" />
                        </div>
                        <div class="col-md-4">
                            <div class="form-group col-12">
                                <div class="upload-avatar image-preview" runat="server" id="div_Avatar">
                                    <div class="avatarTop"></div>
                                    <div class="avatarBottom"></div>
                                </div>
                                <div class="text-muted user-profile-info">
                                    <h3 runat="server" id="h3_FullName">Nguyễn Ngọc Sơn</h3>
                                    <hr />
                                    <p>
                                        <i class="fa fa-university"></i>&nbsp;Trường đại học:&nbsp;
                                        <span class="text-info text-nowrap" runat="server" id="span_School">Chưa cập nhật</span>
                                    </p>
                                    <p>
                                        <i class="fa fa-graduation-cap"></i>&nbsp;Năm tốt nghiệp:&nbsp;
                                        <span class="text-info" runat="server" id="span_GraduationYear">Chưa cập nhật</span>
                                    </p>
                                    <p class="skill">
                                        <i class="fa fa-wikipedia-w"></i>&nbsp;Kỹ năng:&nbsp;
                                        <span class="text-info text-nowrap" runat="server" id="span_Skill">Chưa cập nhật</span>
                                    </p>
                                    <p class="company">
                                        <i class="fa fa-building"></i>&nbsp;Đang làm tại:&nbsp;
                                        <span class="text-info text-nowrap" runat="server" id="span_Company">Chưa cập nhật</span>
                                    </p>
                                    <p>
                                        <i class="fa fa-edit"></i>&nbsp;Cập nhật cuối:&nbsp;
                                        <span class="text-info" runat="server" id="span_Update">Chưa cập nhật</span>
                                    </p>
                                </div>
                                <div class="choose-file">
                                    <label for="image-upload" runat="server" class="image-label" id="label_Image">Chọn hình</label>
                                    <asp:FileUpload runat="server" class="image-upload" ID="FileUpload_Avatar" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="form-row">
                                <div class="col-12">
                                    <%--ucMessage--%>
                                    <uc1:ucMessage runat="server" ID="ucMessage" />
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Họ và tên</label>
                                    <input runat="server" id="input_FullName"
                                        type="text" class="form-control" placeholder="Vui lòng nhập tên của bạn" disabled="disabled" />
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Số điện thoại</label>
                                    <input runat="server" id="input_Mobi"
                                        type="text" class="form-control" placeholder="Vui lòng nhập SĐT" disabled="disabled" />
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>Email</label>
                                    <input runat="server" id="input_Email"
                                        type="text" class="form-control" placeholder="Vui lòng nhập địa chỉ email" disabled="disabled" />
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Địa chỉ Facebook</label>
                                    <input runat="server" id="input_Facebook"
                                        type="text" class="form-control" placeholder="Vui lòng nhập địa facebook" disabled="disabled" />
                                </div>
                            </div>
                            <div class="form-group">
                                <uc1:ucMessage runat="server" ID="ucMessage_ActiveEmail" />
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>Trường đại học</label>
                                    <input class="form-control" type="text" runat="server" id="input_School" placeholder="Vui lòng nhập trường bạn đã học" disabled="disabled" />
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Năm tốt nghiệp</label>
                                    <input runat="server" id="input_GraduationYear"
                                        type="text" class="form-control" placeholder="Vui lòng nhập năm TN" disabled="disabled" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Địa chỉ</label>
                                <input runat="server" id="input_Address"
                                    type="text" class="form-control" placeholder="Vui lòng nhập địa chỉ của bạn" disabled="disabled" />
                            </div>
                            <div class="form-group">
                                <label>Sở trường</label>
                                <asp:ListBox runat="server" ID="ListBox_Skill"
                                    SelectionMode="Multiple" class="js-multiple-skill" name="states[]" multiple="multiple" disabled="disabled" />
                                <%--SelectionMode="Multiple" cho phép chọn nhiều--%>
                                <small class="form-text text-muted">Ví dụ: Asp.Net, C, C++, C#, SQL Server, HTML5, Javascript ...</small>
                            </div>
                            <div class="form-group">
                                <label>Tình trạng: </label>
                                <label class="label-Job">
                                    <input runat="server" id="radio_GotJob" name="status_Job" type="radio" class="radio-job" disabled="disabled" />
                                    Đã đi làm
                                </label>
                                <label class="label-Job">
                                    <input runat="server" id="radio_NotJob" name="status_Job" type="radio" class="radio-job" disabled="disabled" />
                                    Chưa đi làm
                                </label>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div runat="server" id="div_CompanyForm" class="form-group col-12 company-form">
                                <div class="col-12 text-center" runat="server" id="div_Header" clientidmode="static">
                                    <h3 class="text-uppercase">Thông Tin Công Ty</h3>
                                    <hr class="mt-sm" />
                                </div>
                                <div class="row">
                                    <div class="col-md-8" runat="server" id="div_CompanyInfo" clientidmode="static">
                                        <%-- Đổ dữ liệu ẩn khi load ajax --%>
                                        <input type="text" runat="server" id="input_IDCompanyAjax" value="0" clientidmode="static" style="display: none" />
                                        <input type="text" runat="server" id="input_AvatarCompanyAjax" value="" clientidmode="static" style="display: none" />

                                        <div class="form-row">
                                            <div class="form-group col-md-6 mt-0">
                                                <label>Tên công ty đang làm</label>
                                                <input class="form-control form-custumer" runat="server" id="input_CompanyName" disabled="disabled" clientidmode="static"
                                                    autocomplete="off" type="text" placeholder="Vui lòng nhập công ty của bạn" />
                                            </div>
                                            <div class="form-group col-md-6 mt-0">
                                                <label>Website công ty đang làm</label>
                                                <input class="form-control form-custumer" runat="server" id="input_CompanyWeb" disabled="disabled" autocomplete="off" clientidmode="static" type="text" placeholder="Vui lòng nhập địa chỉ website công ty" />
                                            </div>
                                        </div>
                                        <div class="form-group mt-0">
                                            <label>Địa chỉ công ty đang làm</label>
                                            <input class="form-control form-custumer" runat="server" id="input_CompanyAddress" disabled="disabled" autocomplete="off" clientidmode="static" type="text" placeholder="Vui lòng nhập địa chỉ công ty" />
                                        </div>

                                        <div class="form-group mt-0" runat="server" id="div_PositionWork" clientidmode="static">
                                            <label>Vị trí làm việc</label>
                                            <textarea runat="server" id="textarea_PositionWork" class="form-control" rows="3" disabled="disabled"></textarea>
                                            <small class="form-text text-muted">Ví dụ: Lập trình viên, Leader, Tester, ...</small>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="company-Avatar image-previewCompany" runat="server" id="Company_Avatar" clientidmode="static" style="background-image: url('/images/NotFound/notfound.png');">
                                            <div class="companyTop"></div>
                                            <div class="companyBottom"></div>
                                        </div>
                                        <div class="text-center">
                                            <h3 class="full-name">BKVx</h3>
                                        </div>
                                        <div class="choose-file">
                                            <label for="image-uploadCompany" runat="server" class="image-labelCompany" clientidmode="static" id="label_ImageCompany">Chọn hình</label>
                                            <asp:FileUpload runat="server" class="image-uploadCompany" ClientIDMode="static" ID="FileUpload_AvatarCompany" />
                                        </div>
                                    </div>

                                </div>


                            </div>
                        </div>

                        <div class="col-md-12 form-group text-right">
                            <asp:LinkButton ID="LinkButton_Save" OnClick="LinkButton_Save_Click"
                                class="btn btn-success col-md-4 mt-1" runat="server">
                                 <i class="fa fa-save"></i>
                                Lưu lại
                            </asp:LinkButton>
                            <asp:LinkButton class="btn btn-info col-md-4 mt-1"
                                OnClick="LinkButton_Edit_Click"
                                runat="server" ID="LinkButton_Edit">
                                   <i class="fa fa-pencil"></i>
                                Chỉnh sửa
                            </asp:LinkButton>
                            <a runat="server" id="a_report" href="#" class="btn btn-warning col-md-4 mt-1"
                                data-toggle="modal" data-target="#modal-reportStepOne"><i class="fa fa-flag"></i>
                                Báo cáo sai thông tin</a>
                        </div>
                    </div>
                </div>
            </section>

            <div class="modal fade" id="modal-reportStepOne">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header text-center">
                            <h5 class="modal-title">Tin này có vấn đề gì?</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body p-5">
                            <div class="form-group">
                                <a href="#"
                                    class="btn btn-outline-warning form-control form-control-lg report">Trùng nội dung
                                </a>
                            </div>
                            <div class="form-group">
                                <a href="#"
                                    class="btn btn-outline-warning form-control form-control-lg report">Lừa đảo
                                </a>
                            </div>
                            <div class="form-group">
                                <a href="#"
                                    class="btn btn-outline-warning form-control form-control-lg report">Không đúng sự thật
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="modal-reportStepTwo">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header text-center">
                            <h5 class="modal-title text-center">Vui lòng cung cấp thêm thông tin</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <textarea runat="server" id="textarea_ContentReport"
                                    class="form-control form-control-lg txt_Mess" placeholder="Mô tả dấu hiệu bạn muốn báo cáo" rows="3"></textarea>
                            </div>
                            <div class="form-group">
                                <small class="form-text text-muted">Thông tin để chúng tôi liên lạc với bạn khi cần thiết.
                                </small>
                            </div>
                            <div class="form-group">
                                <input runat="server" id="input_FullNameReport" type="text" class="form-control form-control-lg txt_Name" placeholder="Tên của bạn" />
                            </div>
                            <div class="form-group">
                                <input runat="server" id="input_MobiReport" type="text" class="form-control form-control-lg txt_Mobi" placeholder="Điện thoại của bạn" />
                            </div>
                            <div class="form-group">
                                <input runat="server" id="input_EmailReport" type="text" class="form-control form-control-lg txt_Email" placeholder="Emai thoại của bạn" />
                            </div>
                            <div class="form-group">
                                <%-- ucMessage_Report --%>
                                <uc1:ucMessage runat="server" ID="ucMessage_Report" />
                            </div>
                            <div class="form-group">
                                <%-- <asp:LinkButton
                                    runat="server"
                                    class="btn btn-warning form-control"
                                    ID="LinkButton_Report" OnClick="LinkButton_Report_Click">
                                Gửi báo cáo
                                </asp:LinkButton>--%>
                                <button type="button" class="btn btn-warning form-control" id="send_Report">Gửi báo cáo</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </form>
    <%--ucJS--%>
    <uc1:ucJS runat="server" ID="ucJS" />

    <script src="Scripts/jquery-ui.js"></script>
    <script src="Scripts/AjaxAutoComplete.js"></script>
</body>
</html>
