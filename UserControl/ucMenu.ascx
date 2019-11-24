<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucMenu.ascx.cs" Inherits="ucMenu" %>
<%@ Register Src="~/UserControl/ucSearch.ascx" TagPrefix="uc1" TagName="ucSearch" %>

<nav id="main-nav" class="navbar navbar-expand-lg navbar-dark bg-red fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" runat="server" href="~/Default.aspx">
            <img runat="server" class="img-fluid" src="~/Content/images/logo.png" />
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="<%= GetActiveClass("default") %> nav-item">
                    <a class="nav-link" runat="server" href="~/Default.aspx">Trang chủ
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="<%= GetActiveClass("devlist") %> nav-item">
                    <a class="nav-link" runat="server" href="~/DevList.aspx">Danh sách DEV
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="<%= GetActiveClass("introduce") %> nav-item">
                    <a class="nav-link" runat="server" href="~/introduce.aspx">Giới thiệu
                    </a>
                </li>
                <li class="nav-item btn-contact">
                    <a class="nav-link" href="#">Đóng góp ý kiến
                            <span id="dot" class="d-none d-sm-none d-md-block">
                                <span class="ping"></span>
                            </span>
                    </a>
                </li>
            </ul>

            <%-- ucSearch --%>
            <uc1:ucSearch runat="server" ID="ucSearch" />

            <asp:LinkButton runat="server" class="btn btn-light btn-post"
                ID="LinkButton_Post" OnClick="LinkButton_Post_Click" >
                 <i class="fa fa-cloud-upload"></i>&nbsp;
                    Đăng ứng viên
            </asp:LinkButton>

            <!-- ======Cái này để lập trình====== -->
            <ul class="account" runat="server" id="ul_Login" visible="true">

                <li>
                    <a href="#" data-toggle="modal" data-target="#modal-login">
                        <i class="fa fa-sign-in"></i>
                        &nbsp;
                            Đăng nhập
                    </a>

                </li>
                <li>
                    <a href="#" data-toggle="modal" data-target="#modal-register">
                        <i class="fa fa-key"></i>
                        &nbsp;
                            Đăng kí
                    </a>
                </li>
            </ul>

            <div class="user-mini" runat="server" id="div_Info" visible="false">
                <a runat="server" id="a_Link" data-fancybox=""
                    class="name">
                    <img runat="server" id="img_Avatar" src="~/images/NotFound/notfound.png" />
                    <span id="span_FullName" runat="server">Name</span>
                    &nbsp;
                </a>
                <asp:LinkButton Text="text" class="log-out" ID="LinkButton_LogOut" OnClick="LinkButton_LogOut_Click" runat="server">
                    <i class="fa fa-sign-out"></i>
                    Đăng xuất
                </asp:LinkButton>
            </div>
        </div>
    </div>
</nav>
