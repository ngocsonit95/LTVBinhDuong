using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeUtility;
public partial class ucForgotPassword : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            ucMessage.ShowInfo("Nhập email để lấy lại mật khẩu!");
        }
    }

    protected void Button_ForGotPassword_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalForGotPassword();", true);
        string email = input_Email.Value.Trim();

        if(email.IsEmpty()||!email.IsEmailFormat())
        {
            ucMessage.ShowError("Lỗi!", "Vui lòng nhập đúng định email của bạn.");
            return;
        }

        DBEntities db = new DBEntities();
        var item = db.Users.FirstOrDefault(x => x.Email == email);

        if (item == null)
        {
            ucMessage.ShowError("Lỗi!", "Email không tồn tại, vui lòng đăng ký tài khoản mới.");
            return;
        }

        //Gửi mail
        MailUtility mail = new MailUtility();
        mail.Host = "smtp.gmail.com";
        mail.Port = 587;
        mail.EnableSSL = true;
        mail.IsBodyHtml = true;

        mail.From = "laptrinhvienbd2018@gmail.com";
        mail.Password = "laptrinhvien2018";

        mail.To = email;
        mail.Subject = "Quên mật khẩu";

        string template = Server.MapPath("~/MailTemplate/active.html");
        mail.Body = FileUtility.ReadFile(template);

        string domain = Request.Url.GetLeftPart(UriPartial.Authority);
        string emailEncript = string.Empty;
        string usernameEncript = string.Empty;

        emailEncript = email.AES256Encrypt("TamGiacVuong");
        usernameEncript = item.UserID.AES256Encrypt("TamGiacVuong");

        string url = "{0}/ChangePassword.aspx?email={1}&&id={2}".StringFormat(domain, emailEncript, usernameEncript);
        mail.Body = mail.Body.Replace("~name~", item.FullName);
        mail.Body = mail.Body.Replace("~url~", url);

        Exception error = null;
        mail.SendMail(ref error);

        if (error != null)
        {
            ucMessage.ShowError("Vui lòng thử lại");
            return;
        }

        //Xóa trắng form
        input_Email.Value = string.Empty;

        //Báo thành công
        string message = "Xin chúc mừng {0} đã gửi yêu cầu thành công. Vui lòng kiểm tra mail để đi tới trang đổi mật khẩu".StringFormat(item.FullName);
        ucMessage.ShowSuccess(message);

        return;
    }
}