<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucModalRegister.ascx.cs" Inherits="ucModalRegister" %>
<%@ Register Src="~/UserControl/ucMessage.ascx" TagPrefix="uc1" TagName="ucMessage" %>

<div class="modal fade" id="modal-register">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h5 class="modal-title">Đăng ký</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <asp:Panel runat="server" DefaultButton="LinkButton_register" class="modal-body p-5">
                <div class="form-group">
                    <input type="text" autofocus class="form-control form-control-lg text_FullName" placeholder="Họ và tên" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control form-control-lg text_Username" placeholder="Tên đăng nhập" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control form-control-lg text_Email" placeholder="Email" />
                </div>
                <div class="form-group">
                    <input type="password" class="form-control form-control-lg text_Password" placeholder="Mật khẩu" />
                </div>
                <div class="form-group">
                    <input type="password" class="form-control form-control-lg text_Repassword" placeholder="Nhập lại mật khẩu" />
                </div>
                <div class="form-group">
                    <div class="checkbox checkbox-info p-1">
                        <input id="radio_Rule" class="styled rule" name="rule" type="checkbox" />
                        <label for="radio_Rule">
                            Đồng ý với điều khoản
                        </label>
                    </div>
                </div>
                <div class="form-group text-center">
                    <asp:LinkButton ID="LinkButton_register" runat="server" class="btn btn-primary btn_Register" Text="Đăng ký" />
                </div>
                <div class="form-group text-center">
                    <span class="text-muted">Bạn đã có tài khoản?
                            <a href="#" id="link-login" class="text-primary link-login">Đăng nhập</a>
                    </span>
                </div>

            </asp:Panel>
        </div>
    </div>
</div>