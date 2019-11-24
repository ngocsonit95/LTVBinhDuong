<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="introduce.aspx.cs" Inherits="introduce" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
      <title>Giới thiệu - Lập trình viên Bình Dương</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <main>
        <div class="header-page">
            <div class="gradient">
                <svg width="100%" height="100%">
                    <defs>
                        <linearGradient id="fade" y2="1" x2="0">
                            <stop offset="0" stop-color="white" stop-opacity="0"></stop>
                            <stop offset="1" stop-color="white" stop-opacity="1"></stop>
                        </linearGradient>
                        <linearGradient id="gradient" y2="0" x2="1">
                            <stop offset="0" stop-color="#ff0000" stop-opacity="1"></stop>
                            <stop offset="1" stop-color="#5a98ca" stop-opacity="1"></stop>
                        </linearGradient>
                        <mask id="mask" maskContentUnits="objectBoundingBox">
                            <rect width="1" height="1" fill="url(#fade)"></rect>
                        </mask>
                    </defs>
                    <rect width="100%" height="100%" fill="url(#gradient)" mask="url(#mask)"></rect>
                </svg>
            </div>
            <div class="page pagenewprofile">
                <div class="page-content head">
                    <h1 id="change-header">Fix bug là chuyện dễ tìm đoạn code gây ra bug mới là chuyện khó
                    </h1>
                </div>
            </div>
        </div>
        <div class="profileshow">
            <div class="header-about">
                <h2 class="text-center text-uppercase">Kết nối</h2>
                <p>
                    Với mong muốn mở rộng kết nối giữa các lập trình viên Bình Dương với nhà tuyển dụng,
                    chúng tôi tạo ra website làm cầu nối để tạo sự thuận tiện trong việc tìm kiếm nhân lực.
                    Đồng thời đây còn là nơi giao lưu học hỏi giữa các lập trình viên Bình Dương với nhau, nhằm tạo
                    ra sự THÂN THIỆN - ĐOÀN KẾT
                </p>
                <h4>LẬP TRÌNH VIÊN BÌNH DƯƠNG</h4>
            </div>
            <div class="main-founder pb-5">
                <div class="container">
                    <div class="row">
                        <h2 class="col-md-12 text-center text-uppercase">Đồng sáng lập</h2>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-12">
                            <div class="avatar-hex">
                                <div class="hexagon" style="background-image: url('images/6.jpg');">

                                    <div class="hexTop"></div>
                                    <div class="hexBottom"></div>
                                </div>
                            </div>
                            <div class="content-info text-center">
                                <b style="font-size: 20px;">Lê Minh Hiếu</b><br />
                                <b style="font-size: 16px; color: rgb(255, 106, 0)">Phương châm sống</b><br />
                                <span>Hãy theo đuổi đam mê, và thành công sẽ theo đuổi bạn..!</span><br />
                                <b style="font-size: 16px; color: rgb(255, 106, 0)">Sở trường</b><br />
                                <p>
                                    C#, MVC Core, Jquery, Angular
                                </p>
                                <b style="font-size: 16px; color: rgb(255, 106, 0)">Liên hệ</b><br />
                                <p>
                                    <a target="_blank" href="https://www.facebook.com/mrhieuit">
                                        <i class="fa fa-facebook-official" style="font-size: 24px"></i>
                                    </a>
                                    &nbsp; hoặc &nbsp;

                                    <a href="tel:0979876033">
                                        <i class="fa fa-mobile-phone" style="font-size: 24px"></i>:&nbsp;0979876033
                                    </a>

                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-12">
                            <div class="avatar-hex">
                                <div class="hexagon" style="background-image: url('images/1.jpg');">

                                    <div class="hexTop"></div>
                                    <div class="hexBottom"></div>
                                </div>
                            </div>
                            <div class="content-info text-center">
                                <b style="font-size: 20px;">Nguyễn Văn Quyền</b><br />
                                <b style="font-size: 16px; color: rgb(255, 106, 0)">Phương châm sống</b><br />
                                <span>Hãy theo đuổi đam mê, và thành công sẽ theo đuổi bạn..!</span><br />
                                <b style="font-size: 16px; color: rgb(255, 106, 0)">Sở trường</b><br />
                                <p>
                                    C#, MVC Core, Jquery, Angular
                                </p>
                                <b style="font-size: 16px; color: rgb(255, 106, 0)">Liên hệ</b><br />
                                <p>
                                    <a target="_blank" href="https://www.facebook.com/QuyenIT">
                                        <i class="fa fa-facebook-official" style="font-size: 24px"></i>
                                    </a>
                                    &nbsp; hoặc &nbsp;

                                    <a href="tel:0987233803">
                                        <i class="fa fa-mobile-phone" style="font-size: 24px"></i>:&nbsp;0987233803
                                    </a>

                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-12">
                            <div class="avatar-hex">
                                <div class="hexagon" style="background-image: url('images/2.jpg');">

                                    <div class="hexTop"></div>
                                    <div class="hexBottom"></div>
                                </div>
                            </div>
                            <div class="content-info text-center">
                                <b style="font-size: 20px;">Nguyễn Ngọc Sơn</b><br />
                                <b style="font-size: 16px; color: rgb(255, 106, 0)">Phương châm sống</b><br />
                                <span>Hãy theo đuổi đam mê, và thành công sẽ theo đuổi bạn..!</span><br />
                                <b style="font-size: 16px; color: rgb(255, 106, 0)">Sở trường</b><br />
                                <p>
                                    C#, MVC Core, Jquery, Angular
                                </p>
                                <b style="font-size: 16px; color: rgb(255, 106, 0)">Liên hệ</b><br />
                                <p>
                                    <a target="_blank" href="https://www.facebook.com/ngocsonit195">
                                        <i class="fa fa-facebook-official" style="font-size: 24px"></i>
                                    </a>
                                    &nbsp; hoặc &nbsp;

                                    <a href="tel:01648539913">
                                        <i class="fa fa-mobile-phone" style="font-size: 24px"></i>:&nbsp;01648539913
                                    </a>

                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-12">
                             <div class="avatar-hex">
                                <div class="hexagon" style="background-image: url('images/7.jpg');">
                                    <div class="hexTop"></div>
                                    <div class="hexBottom"></div>
                                </div>
                            </div>
                            <div class="content-info text-center">
                                <b style="font-size: 20px;">Phạm Tiến Sỹ</b><br />
                                <b style="font-size: 16px; color: rgb(255, 106, 0)">Phương châm sống</b><br />
                                <span>Hãy theo đuổi đam mê, và thành công sẽ theo đuổi bạn..!</span><br />
                                <b style="font-size: 16px; color: rgb(255, 106, 0)">Sở trường</b><br />
                                <p>
                                    C#, MVC Core, Jquery, Angular
                                </p>
                                <b style="font-size: 16px; color: rgb(255, 106, 0)">Liên hệ</b><br />
                                <p>
                                    <a target="_blank" href="https://www.facebook.com/sy.betu">
                                        <i class="fa fa-facebook-official" style="font-size: 24px"></i>
                                    </a>
                                    &nbsp; hoặc &nbsp;

                                    <a href="tel:01648539913">
                                        <i class="fa fa-mobile-phone" style="font-size: 24px"></i>:&nbsp;01648539913
                                    </a>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
</asp:Content>

