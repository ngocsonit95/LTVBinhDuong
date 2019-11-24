<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucSearch.ascx.cs" Inherits="ucSearch" %>

<asp:Panel runat="server" DefaultButton="Button_Search" class="input-group mr-auto quick-search">
    <input runat="server" id="input_Search" type="text"
        class="form-control search-placehoder br-0" placeholder="Tìm kiếm nhanh" aria-label="Recipient's username" aria-describedby="basic-addon2" />
    <div class="input-group-prepend">
        <asp:LinkButton runat="server" ID="Button_Search" OnClick="Button_Search_Click"
            class="input-group-text bt-search">
                        <i class="fa fa-search"></i>
        </asp:LinkButton>
    </div>
</asp:Panel>
