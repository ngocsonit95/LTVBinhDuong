<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucModalLogin.ascx.cs" Inherits="ucModalLogin" %>
<%@ Register Src="~/UserControl/ucMessage.ascx" TagPrefix="uc1" TagName="ucMessage" %>
<%@ Register Src="~/UserControl/ucLoginFacebook.ascx" TagPrefix="uc1" TagName="ucLoginFacebook" %>
<%@ Register Src="~/UserControl/ucLoginGoogle.ascx" TagPrefix="uc1" TagName="ucLoginGoogle" %>
<script type="text/javascript">
    function openModalLogin() {
        $('#modal-login').modal({ show: true });
    }
</script>
<div class="modal fade" id="modal-login">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h5 class="modal-title">Đăng nhập</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <asp:Panel runat="server" DefaultButton="LinkButton_login" class="modal-body p-5">
                <div class="form-group">
                    <%-- ajax --%>
                    <input type="text" autofocus id="input_Username" class="form-control form-control-lg text-username" placeholder="Tên đăng nhập" autocomplete="off" />
                </div>
                <div class="form-group">
                    <%-- ajax --%>
                    <input type="password" id="input_Password" class="form-control form-control-lg text-password" placeholder="Mật khẩu" autocomplete="off" />
                </div>
                <div class="form-group">
                    <div class="checkbox checkbox-info p-1">
                        <input id="radio_remember" class="styled note" type="checkbox">
                        <label for="radio_remember">
                            Ghi nhớ
                        </label>

                    </div>

                </div>
              <div class="form-group text-center form-row">
                    <%-- ajax --%>
                    <div class="col-md-4 col-12 mt-2">
                        <asp:LinkButton id="LinkButton_login" runat="server" type="button" class="btn btn-primary form-control btn_login" Text="Đăng nhập" />
                    </div>
                    <%--ucLoginFacebook--%>
                    <uc1:ucLoginFacebook runat="server" ID="ucLoginFacebook" />
                    <%--ucLoginGoogle--%>
                    <uc1:ucLoginGoogle runat="server" ID="ucLoginGoogle" />
                </div>
                <div class="form-group text-center">
                    <a href="#" id="link-forgotpassword" class="text-info font-italic">
                        <i class="fa fa-question-circle"></i>
                        Quên mật khẩu
                    </a>
                </div>

                <div class="form-group text-center">
                    <span class="text-muted">Bạn chưa có tài khoản?
                            <a href="#" id="link-register" class="text-primary">Đăng kí tại đây</a>
                    </span>
                </div>

            </asp:Panel>
        </div>
    </div>
</div>

