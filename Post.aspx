<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Post.aspx.cs" Inherits="Post" %>

<%@ Register Src="~/UserControl/ucMessage.ascx" TagPrefix="uc1" TagName="ucMessage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
       <title>Chỉnh sửa thông tin cá nhân - Lập trình viên Bình Dương</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <main id="main">
        <section id="post">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h3>Xin vui lòng nhập đầy đủ thông tin</h3>
                    </div>
                    <div class="col-12 col-md-4 avatar">
                        <div class="upload-avatar image-preview" style="background-image: url('/images/NotFound/notfound.png');"
                            runat="server" id="div_Avatar">
                            <div class="avatarTop"></div>
                            <div class="avatarBottom"></div>
                        </div>
                        <div class="choose-file">
                            <label for="image-upload" runat="server" class="image-label" id="label_Image">Chọn hình</label>
                            <asp:FileUpload runat="server" class="image-upload" ID="FileUpload_Avatar" />
                        </div>
                    </div>
                    <div class="col-12 col-md-8">
                        <div class="form-wrapper">
                            <div class="container">
                                <div class="row">
                                    <div class="form-group col-12 col-md-4">
                                        <label>Họ và tên</label>
                                        <input class="form-control form-custumer" type="text" runat="server" id="input_FullName" autocomplete="off" />
                                    </div>
                                    <div class="form-group col-12 col-md-4">
                                        <label>Số điện thoại</label>
                                        <input class="form-control form-custumer" type="text" runat="server" id="input_Mobi" autocomplete="off">
                                    </div>
                                    <div class="form-group col-12 col-md-4">
                                        <label>Năm tốt nghiệp</label>
                                        <input class="form-control form-custumer" type="text" runat="server" id="input_GraduationYear" autocomplete="off" />
                                    </div>
                                    <div class="form-group col-12 col-md-6">
                                        <label>Địa chỉ Email</label>
                                        <input class="form-control form-custumer" type="text" runat="server" id="input_Email" autocomplete="off" />
                                    </div>
                                    <div class="form-group col-12 col-md-6">
                                        <label>Địa chỉ Facebook</label>
                                        <input class="form-control form-custumer" type="text" runat="server" id="input_Facebook" autocomplete="off" />
                                    </div>
                                    <div class="form-group col-12">
                                        <label>Nơi ở hiện tại</label>
                                        <input class="form-control form-custumer" type="text" runat="server" id="input_Address" autocomplete="off" />
                                    </div>
                                    <div class="form-group col-12">
                                        <label>Sở trường</label>
                                        <asp:ListBox runat="server" ID="ListBox_Skill"
                                            SelectionMode="Multiple" class="js-multiple-skill" name="states[]" multiple="multiple" />
                                        <%--SelectionMode="Multiple" cho phép chọn nhiều--%>
                                        <small class="form-text text-muted">Ví dụ: Asp.Net, C, C++, C#, SQL Server, HTML5, Javascript ...</small>
                                    </div>
                                    <div class="form-group col-12">
                                        <label>Trường đại học</label>
                                        <input class="form-control form-custumer" type="text" runat="server" id="input_School" autocomplete="off" placeholder="Vui lòng nhập trường bạn đã học" />
                                    </div>
                                    <div class="form-group col-12">
                                        <label>Tình trạng: </label>
                                        <label class="label-Job">
                                            <input runat="server" id="radio_GotJob" name="status_Job" type="radio" class="radio-job" clientidmode="static" />
                                            Đã đi làm
                                        </label>
                                        <label class="label-Job">
                                            <input runat="server" id="radio_NotJob" name="status_Job" type="radio" class="radio-job" checked clientidmode="static" />
                                            Chưa đi làm
                                        </label>
                                    </div>
                                    <%-- Chỉ hiện khi StatusJob == true --%>
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

                                                <div class="form-group mt-0">
                                                    <label>Tên công ty đang làm</label>
                                                    <input class="form-control form-custumer" runat="server" id="input_CompanyName" clientidmode="static"
                                                        autocomplete="off" type="text" placeholder="Vui lòng nhập công ty của bạn" />
                                                </div>
                                                <div class="form-group mt-0">
                                                    <label>Địa chỉ công ty đang làm</label>
                                                    <input class="form-control form-custumer" runat="server" id="input_CompanyAddress" autocomplete="off" clientidmode="static" type="text" placeholder="Vui lòng nhập địa chỉ công ty" />
                                                </div>
                                                <div class="form-group mt-0">
                                                    <label>Website công ty đang làm</label>
                                                    <input class="form-control form-custumer" runat="server" id="input_CompanyWeb" autocomplete="off" clientidmode="static" type="text" placeholder="Vui lòng nhập địa chỉ website công ty" />
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="company-Avatar image-previewCompany" runat="server" id="Company_Avatar" clientidmode="static" style="background-image: url('/images/NotFound/notfound.png');">
                                                    <div class="companyTop"></div>
                                                    <div class="companyBottom"></div>
                                                </div>
                                                <div class="choose-file">
                                                    <label for="image-uploadCompany" runat="server" class="image-labelCompany" clientidmode="static" id="label_ImageCompany">Chọn hình</label>
                                                    <asp:FileUpload runat="server" class="image-uploadCompany" clientidmode="static" ID="FileUpload_AvatarCompany" />
                                                </div>
                                            </div>

                                        </div>

                                        <div class="" runat="server" id="div_PositionWork" clientidmode="static">
                                            <label>Vị trí làm việc</label>
                                            <textarea runat="server" id="textarea_PositionWork" class="form-control" rows="3"></textarea>
                                            <small class="form-text text-muted">Ví dụ: Lập trình viên, Leader, Tester, ...</small>
                                        </div>
                                    </div>


                                    <div class="form-group col-12">
                                        <asp:LinkButton runat="server" ID="LinkButton_Post" OnClick="LinkButton_Post_Click" class="btn btn-primary">
                                            <i class="fa fa-share-square"></i>&nbsp;Đăng bài
                                        </asp:LinkButton>
                                        <asp:LinkButton runat="server" class="btn btn-outline-primary" ID="LinkButton_Reset" OnClick="LinkButton_Reset_Click">
                                             <i class="fa fa-refresh"></i>
                                            Nhập lại
                                        </asp:LinkButton>
                                    </div>
                                    <div class="form-group col-12">
                                        <%--ucMessage--%>
                                        <uc1:ucMessage runat="server" ID="ucMessage" />
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
    <link href="Content/jquery-ui.css" rel="stylesheet" />
    <script src="Scripts/jquery-ui.js"></script>
    <script src="Scripts/AjaxAutoComplete.js"></script>
</asp:Content>

