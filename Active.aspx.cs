using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeUtility;
public partial class Active : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ActiveUser();
        }
    }

    public void ActiveUser()
    {
        string passwordEncript = "tamgiacvuong";
        string email = Request.QueryString["id"].ToSafetyString();

        email = email.AES256Decrypt(passwordEncript);

        if (email.IsEmpty() || !email.IsEmailFormat())
        {
            ucMessage.ShowError("Liên kết không tồn tại. Vui lòng về trang chủ");
            return;
        }

        //Vào DB để kiểm tra sự tồn tại
        DBEntities db = new DBEntities();
        var item = db.Users.Where(q => q.Email == email).FirstOrDefault();

        if (item == null)
        {
            ucMessage.ShowError("Tài khoản không tồn tại. Vui lòng về đăng ký");
            return;
        }

        if (item.Status == true)
        {
            ucMessage.ShowError("Tài khoản đã được kích hoạt trước đó. Vui lòng đăng nhập");
            return;
        }

        //Kích hoạt tài khoản
        item.Status = true;
        db.SaveChanges();

        //Thông báo thành công
        ucMessage.ShowSuccess("Xin chúc mừng đã kích hoạt tài khoản. Vui lòng đăng nhập");
        return;
    }
}