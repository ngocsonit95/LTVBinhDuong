<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucForgotPassword.ascx.cs" Inherits="ucForgotPassword" %>
<%@ Register Src="~/UserControl/ucMessage.ascx" TagPrefix="uc1" TagName="ucMessage" %>
<script type="text/javascript">
    function openModalForGotPassword() {
        $('#modal-forgotpassword').modal({ show: true });
    }
</script>
<div class="modal fade" id="modal-forgotpassword">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <h5 class="modal-title">Quên mật khẩu</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <asp:Panel runat="server" DefaultButton="Button_ForGotPassword" class="modal-body p-5">

                        <div class="form-group">
                            <input type="text"
                                class="form-control form-control-lg"
                                placeholder="Email"
                                id="input_Email"
                                autocomplete="off"
                                runat="server" />
                        </div>

                        <div class="form-group">
                        <uc1:ucMessage runat="server" ID="ucMessage" />

                        </div>
                        <div class="form-group text-center">
                            <asp:Button Text="Quên mật khẩu"
                                class="btn btn-primary"
                                runat="server"
                                OnClick="Button_ForGotPassword_Click"
                                id="Button_ForGotPassword"/>
                        </div>
                        <div class="form-group text-center">
                            <span class="text-muted">Bạn đã có tài khoản?
                            <a href="#" class="text-primary link-login">Đăng nhập</a>
                            </span>
                        </div>

                    </asp:Panel>
                </div>
            </div>
        </div>