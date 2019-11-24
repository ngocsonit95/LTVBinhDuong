using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeUtility;

public partial class ucSearch : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Lấy keyword trên Url xuống
            string keyword = Request.QueryString["keyword"].ToSafetyString();

            //Đổ vào ô Search
            input_Search.Value = keyword;
        }
    }

    protected void Button_Search_Click(object sender, EventArgs e)
    {
        //Lấy giá trị trong ô search
        string keyword = input_Search.Value.Trim();
        if (keyword.IsNullOrEmpty())
        {
            Response.Redirect("~/Devlist.aspx");
        }
        keyword = keyword.ToUrlEncode();

        //Khai báo Link trang đích
        string url = "~/Devlist.aspx?keyword={0}";

        //Định dạng Link trang đích
        url = url.StringFormat(keyword);

        //Chuyển đến trang đích
        Response.Redirect(url);
    }
}