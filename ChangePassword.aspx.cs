using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeUtility;
public partial class ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ucMessage.ShowInfo("Vui lòng nhập mật khẩu mới và nhấn đổi!");
            CheckValidity();
        }
    }

    public void CheckValidity()
    {
        //Lấy giá trị trên Url
        string username = Request.QueryString["id"].ToSafetyString();
        string email = Request.QueryString["email"].ToSafetyString();

        //Giải mã
        string usernameDecrypt = string.Empty;
        string emailDecrypt = string.Empty;

        usernameDecrypt = username.AES256Decrypt("TamGiacVuong");
        emailDecrypt = email.AES256Decrypt("TamGiacVuong");

        //Nếu không có điều kiện thì trở về trang chủ
        if (emailDecrypt.IsEmpty() || !emailDecrypt.IsEmailFormat())
        {
            Response.Redirect("~/");
        }

        //Gán Email và Username vào input
        input_Username.Value = usernameDecrypt.ToString();
        input_Email.Value = emailDecrypt.ToString();
    }

    protected void Button_ChangePassword_Click(object sender, EventArgs e)
    {
        //Lấy giá trị từ nhập
        string username = input_Username.Value.Trim();
        string password = input_Password.Value.Trim();
        string repassword = input_Repassword.Value.Trim();

        //Nếu password không khớp thì thông báo lỗi
        if (password.IsEmpty())
        {
            ucMessage.ShowError("Vui lòng nhập mật khẩu mới");
            return;
        }

        if (password.IsEmpty() || password != repassword)
        {
            ucMessage.ShowError("Vui lòng nhập mật khẩu 2 lần giống nhau!");
            return;
        }

        //Nếu không có trong DB thì trở về trang chủ
        DBEntities db = new DBEntities();
        var item = db.Users.FirstOrDefault(x => x.UserID == username);
        if (item == null)
        {
            Response.Redirect("~/");
        }

        //Mã hóa password
        password = password.SHA256Hash("tamgiacvuong");

        //Cập nhật mật khẩu
        item.Password = password;
        db.SaveChanges();

        ucMessage.ShowSuccess("Đã mổi mật khẩu thành công!");
    }
}