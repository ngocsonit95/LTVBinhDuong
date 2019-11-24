using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeUtility;

public partial class ucContact : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            LoadData();
            ucMessage.HideAll();
        }
    }

    public void LoadData()
    {
        if (SessionUtility.User != null)
        {
            input_FullName.Value = SessionUtility.User.FullName;
            input_Email.Value    = SessionUtility.User.Email;
            input_Mobi.Value    = SessionUtility.User.Mobi;
            input_Address.Value  = SessionUtility.User.Address;

            input_FullName.Attributes.Add("disabled", "disabled");
            input_Email.Attributes.Add("disabled", "disabled");
            input_Mobi.Attributes.Add("disabled", "disabled");
            input_Address.Attributes.Add("disabled", "disabled");

        }
    }

    protected void LinkButton_Send_Click(object sender, EventArgs e)
    {
        string fullName = input_FullName.Value.Trim();
        string email    = input_Email.Value.Trim();
        string phone     = input_Mobi.Value.Trim();
        string address  = input_Address.Value.Trim();
        string content  = textarea_Content.Value.Trim();

        // Kiểm tra tính hợp lệ
        if (!ValidData())
        {
            return;
        }

        Opinion item  = new Opinion();
        if (SessionUtility.User != null)
        {
            item.UserID = SessionUtility.User.UserID;
        }

        item.FullName   = fullName;
        item.Email      = email;
        item.Phone      = phone;
        item.Content    = content;
        item.CreateTime = DateTime.Now;
        item.Type       = true;

        DBEntities db = new DBEntities();
        db.Opinions.Add(item);
        db.SaveChanges();

        #region Gửi thư liên hệ
        //MailUtility mail = new MailUtility();
        //mail.Host = "smtp.gmail.com";
        //mail.Port = 587;
        //mail.EnableSSL = true;
        //mail.IsBodyHtml = true;

        //mail.From = "laptrinhvien2015@gmail.com";
        //mail.Password = "2015@VienLapTrinh";
        //mail.To = "demo@gmail.com";
        //mail.Subject = "Thư liên hệ";

        //string url = Server.MapPath("~/MailTemplate/default.html");
        //mail.Body = FileUtility.ReadFile(url);

        //mail.Body = mail.Body.Replace("{admin}", "Sếp");
        //mail.Body = mail.Body.Replace("{date}"
        //    , DateTime.Now.ToSafetyString("dd/MM/yyyy HH:mm:ss"));
        //mail.Body = mail.Body.Replace("{name}", fullName);
        //mail.Body = mail.Body.Replace("{email}", email);
        //mail.Body = mail.Body.Replace("{mobil}", phone);
        //mail.Body = mail.Body.Replace("{content}", content);

        //Exception error = null;
        //mail.SendMail(ref error);

        //if (error != null)
        //{
        //    ucMessage.ShowError("Gửi thư thất bại, vui lòng thử lại...");
        //    return;
        //}
        #endregion

        ucMessage.ShowSuccess("Chúc mừng, thư liên hệ của bạn đã được gửi thành công...!");
        Reset();


    }

    //Hàm kiểm tra đầu vào
    public bool ValidData()
    {
        string fullName = input_FullName.Value.Trim();
        string email = input_Email.Value.Trim();
        string phone = input_Mobi.Value.Trim();
        string address = input_Address.Value.Trim();
        string content = textarea_Content.Value.Trim();

        if (fullName.IsEmpty())
        {
            ucMessage.ShowError("Vui lòng nhập họ tên");
            return false;
        }

        if (email.IsEmpty() && phone.IsEmpty())
        {
            ucMessage.ShowError("Vui lòng nhập email hoặc số điện thoại");
            return false;
        }

        if (!email.IsEmpty() && !email.IsEmailFormat())
        {
            ucMessage.ShowError("Vui lòng nhập email đúng định dạng hoặc bỏ trống nếu chưa có");
            return false;
        }

        if (content.IsEmpty())
        {
            ucMessage.ShowError("Vui lòng nhập nội dung");
            return false;
        }
        return true;
    }

    //Hàm reset form
    public void Reset()
    {
        input_FullName.Value   = string.Empty;
         input_Email.Value     = string.Empty;
        input_Mobi.Value      = string.Empty;
        input_Address.Value    = string.Empty;
        textarea_Content.Value = string.Empty; ;
    }
}