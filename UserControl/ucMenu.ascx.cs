using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeUtility;
using System.IO;
using System.Threading.Tasks;
using System.Threading;

public partial class ucMenu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
        }
    }

    public void LoadData()
    {
        if (SessionUtility.User != null)
        {
            a_Link.HRef = "/InfoEdit.aspx?id=" + SessionUtility.User.UserID;

            if (SessionUtility.User.FullName.ToSafetyString().Trim() == string.Empty || SessionUtility.User.FullName == null)
            {
                span_FullName.InnerHtml = "Cập nhật tên";
            }
            else
            {
                span_FullName.InnerHtml = SessionUtility.User.FullName.Left(25, true, true);
            }

            if (SessionUtility.User.Avatar.ToSafetyString().Trim() == string.Empty || SessionUtility.User.Avatar == null)
                img_Avatar.Src = "/images/NotFound/notfound.png";

            else
                img_Avatar.Src = SessionUtility.User.Avatar;

            ul_Login.Visible = false;
            div_Info.Visible = true;

            //Thay đổi tên button
            LinkButton_Post.Text = " <i class='fa fa-cloud-upload'></i>&nbsp;Chỉnh sửa trang cá nhân";
        }
    }

    protected void LinkButton_LogOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("~/");
    }

    protected void LinkButton_Post_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Post.aspx");
    }

    public string GetActiveClass(string pageName)
    {
        //Lấy URL hiện tại
        string url = Request.Url.AbsolutePath;

        //Tách lấy tên trang, chuyển về chữ thường
        string currentPageName = Path.GetFileNameWithoutExtension(url).ToLower();

        //So sánh với pageName
        if (currentPageName.Contains(pageName))
            return "active";
        else
            return string.Empty;
    }

}