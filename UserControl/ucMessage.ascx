<%@ Control Language="C#" AutoEventWireup="true" Inherits="CodeUtility.MessageUtility" %>

<div runat="server" id="SuccessBox" class="alert alert-success alert-dismissible fade show" role="alert">
    <b runat="server" id="SuccessTitle"></b>
    <span runat="server" id="SuccessMessage" class="message">Cập nhật thành công</span>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close" title="Ẩn thông báo">
        <span aria-hidden="true">&times;</span>
    </button>
</div>

<div runat="server" id="InfoBox" class="alert alert-info alert-dismissible fade show" role="alert">
    <b runat="server" id="InfoTitle"></b>
    <span runat="server" id="InfoMessage" class="message">Xin mời cập nhật dữ liệu</span>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close" title="Ẩn thông báo">
        <span aria-hidden="true">&times;</span>
    </button>
</div>

<div runat="server" id="WarningBox" class="alert alert-warning alert-dismissible fade show" >
    <b runat="server" id="WarningTitle"></b>
    <span runat="server" id="WarningMessage" class="message">Xin mời nhập đầy đủ thông tin</span>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close" title="Ẩn thông báo">
        <span aria-hidden="true">&times;</span>
    </button>
</div>

<div runat="server" id="ErrorBox"  class="alert alert-danger alert-dismissible fade show" >
    <b runat="server" id="ErrorTitle"></b>
    <span runat="server" id="ErrorMessage" class="message">Cập nhật thất bại</span>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close" title="Ẩn thông báo">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
