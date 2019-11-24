<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucContact.ascx.cs" Inherits="ucContact" %>
<%@ Register Src="~/UserControl/ucMessage.ascx" TagPrefix="uc1" TagName="ucMessage" %>


<section id="contact">
    <div class="container">
        <div class="row">
            <div class="col-md-12" name="contact">
                <h1 class="title">Liên hệ với chúng tôi</h1>
                <div class="line-gradient"></div>
                <div class="pb-100"></div>
            </div>
            <div class="col-md-6 col-12">
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label>Họ và tên</label>
                        <input type="text" class="form-control" runat="server" id="input_FullName" placeholder="Vui lòng nhập tên của bạn">
                    </div>
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <input type="text" class="form-control" runat="server" id="input_Email" placeholder="Vui lòng nhập địa chỉ email">
                </div>
                <div class="form-group">
                    <label>Số điện thoại</label>
                    <input type="text" class="form-control" runat="server" id="input_Mobi" placeholder="Vui lòng nhập SĐT">
                </div>
                <div class="form-group">
                    <label>Địa chỉ</label>
                    <input type="text" class="form-control" runat="server" id="input_Address" placeholder="Vui lòng nhập địa chỉ của bạn">
                </div>

                <div class="form-group">
                    <label>Nội dung</label>
                    <textarea class="form-control" runat="server" id="textarea_Content" placeholder="Vui lòng nhập nội dung bạn muốn liên hệ" rows="3"></textarea>
                </div>
                <div class="form-group">
                    <%-- ucMessage --%>
                    <uc1:ucMessage runat="server" ID="ucMessage" />

                </div>
                <asp:LinkButton runat="server" class="btn btn-primary"
                    ID="LinkButton_Send" OnClick="LinkButton_Send_Click">
                    <i class="fa fa-paper-plane"></i>&nbsp;Gửi liên hệ
                </asp:LinkButton>
            </div>
            <div class="col-md-6 col-12 p-3">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15668.236061460939!2d106.70743170000001!3d10.9589148!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x20b3f9b4c8fdc732!2zVHLGsOG7nW5nIMSR4bqhaSBo4buNYyBraW5oIHThur8ga-G7uSB0aHXhuq10IELDrG5oIETGsMahbmcgKEPGoSBz4bufIDJBKQ!5e0!3m2!1svi!2s!4v1538183525119" width="100%" height="450" frameborder="0" style="border: 0" allowfullscreen></iframe>
            </div>
        </div>
    </div>
</section>
