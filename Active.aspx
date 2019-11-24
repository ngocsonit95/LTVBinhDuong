<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Active.aspx.cs" Inherits="Active" %>

<%@ Register Src="~/UserControl/ucMessage.ascx" TagPrefix="uc1" TagName="ucMessage" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <title>Kích hoạt tài khoản - Lập trình viên Bình Dương</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <div class="container my-5">
        <div class="row">
            <div class="col-md-12 my-5">
            <uc1:ucMessage runat="server" ID="ucMessage" />
                <div class="bg-active">
                    <h2>Lập trình viên Bình Dương</h2>
                    <p>
                        Chào mừng bạn đã gia nhập Cộng Đồng Lập Trình Viên Bình Dương.
                    </p>
                    <p>
                       Hãy kết nối mối quan hệ giữa các lập trình viên Bình Dương với nhau,
                       cùng nhau góp phần xây dựng lên một cộng đồng IT Bình Dương phát triển lớn mạnh.
                    </p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
</asp:Content>

