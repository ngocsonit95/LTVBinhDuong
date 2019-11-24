using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Gán dữ liêu cho session ẩn
        if (SessionUtility.User != null)
        {
            input_Session.Value = SessionUtility.User.UserID;
        }
    }
}
