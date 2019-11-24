<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/UserControl/ucContact.ascx" TagPrefix="uc1" TagName="ucContact" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <title>Trang chủ- Lập trình viên Bình Dương</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <main id="main">
        <div id="particles-js"></div>

        <div class="container-fluid">
            <div class="col-12">
                <div class="honeycombs">
                    <h1 class="title">Top Lập Trình Viên</h1>
                    <div class="line-gradient"></div>
                    <asp:Repeater runat="server" ID="Repeater_Main">
                        <ItemTemplate>
                            <div class="comb">
                                <img runat="server" src='<%#Eval("Avatar").ToSafetyString() != string.Empty ? Eval("Avatar") : "/images/NotFound/notfound.png" %>' />
                                <span>
                                    <p>
                                        <%#Eval("FullName") %>
                                    </p>
                                    <p>
                                        Sở trường:
                                <%# MyUtility.LoadSkill(Eval("ID")) %>
                                    </p>
                                    <p>
                                        <a class="btn btn-primary btn-sm" runat="server"
                                            href='<%# Eval("ID","/InfoEdit.aspx?id={0}") %>' data-fancybox ="">Xem thông tin</a>
                                    </p>
                                </span>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </main>

    <%--ucContact--%>
    <uc1:ucContact runat="server" ID="ucContact" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
    <script src="/Scripts/particles.min.js"></script>
    <script src="/plugin/particles/js/index.js"></script>
</asp:Content>

