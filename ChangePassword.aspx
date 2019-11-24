<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<%@ Register Src="~/UserControl/ucMessage.ascx" TagPrefix="uc1" TagName="ucMessage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <title>Thay đổi mật khẩu - Lập trình viên Bình Dương</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <main>
        <div id="particles-js"></div>

        <section id="change-password">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-12 offset-md-2">
                        <div class="wraper">
                            <h2 class="text-center"><i class="fa fa-pencil"></i> Đổi mật khẩu mới</h2>
                            <div class="form-group">
                                <input type="text" runat="server" id="input_Username" readonly class="form-control form-control-lg" placeholder="Tên đăng nhập" />
                            </div>
                             <div class="form-group">
                                <input type="text" runat="server" id="input_Email" readonly class="form-control form-control-lg" placeholder="Địa chỉ email" />
                            </div>
                            <div class="form-group">
                                <input type="password" runat="server" id="input_Password" class="form-control form-control-lg" placeholder="Mật khẩu mới" />
                            </div>
                            <div class="form-group">
                                <input type="password" runat="server" id="input_Repassword" class="form-control form-control-lg" placeholder="Nhập lại mật khẩu mới" />
                            </div>
                            <div class="form-group">
                                <uc1:ucMessage runat="server" ID="ucMessage" />
                            </div>
                            <div class="form-group text-center">
                                <asp:Button Text="Đổi mật khẩu"  class="btn btn-dark" ID="Button_ChangePassword" OnClick="Button_ChangePassword_Click" runat="server" />
                            </div>

                            <div class="form-group text-center">
                                <span class="text-muted">
                                    <a href="~/" class="text-white">Trở về trang chủ</a>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

