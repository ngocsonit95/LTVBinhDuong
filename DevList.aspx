<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="DevList.aspx.cs" Inherits="DevList" %>

<%@ Register Src="~/UserControl/ucLeftFilter.ascx" TagPrefix="uc1" TagName="ucLeftFilter" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Danh sách lập trình viên - Lập trình viên Bình Dương</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <main id="main">



        <div class="container">
            <marquee>
                <span>Chào mừng bạn đến với Website <b>Lập Trình Viên Bình Dương</b>.</span>
                <span>Vui lòng tìm kiếm những ứng viên thích hợp</span>
                </marquee>
            <div class="row">
                <div class="col-12 col-md-3">
                    <%--ucLeftFilter  --%>
                    <uc1:ucLeftFilter runat="server" ID="ucLeftFilter" />

                </div>
                <div class="col-12 col-md-9">
                    <div id="main-wraper-dev">
                        <h3>Danh sách Developer <span id="span_Count_Search"></span></h3>
                        <ul id="list-dev">
                            <%-- ĐỔ dữ liệu từ Ajax --%>
                        </ul>
                        <div class="text-center">
                            <button id="load-more" type="button" class="btn bg-red">
                                Xem thêm
                            </button>
                            <div class="loading">
                                <div class="loading-bar"></div>
                                <div class="loading-bar"></div>
                                <div class="loading-bar"></div>
                                <div class="loading-bar"></div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
    <script src="/Scripts/AjaxLoadMore.js"></script>
</asp:Content>

