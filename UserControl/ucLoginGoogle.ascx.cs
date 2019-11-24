using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ASPSnippets.GoogleAPI;
using System.Web.Script.Serialization;
using CodeUtility;

public partial class ucLoginGoogle : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            GoogleConnect.ClientId = "26728516306-arum3r36l9i5v17vg81pgtgs316dmb04.apps.googleusercontent.com";
            GoogleConnect.ClientSecret = "K10Nw9GCXN8nt2tsRLwsqXPh";
            GoogleConnect.RedirectUri = Request.Url.AbsoluteUri.Split('?')[0];
            string code = Request.QueryString["code"];
            if (!code.IsNullOrEmpty())
            {
                DBEntities db = new DBEntities();
                string json = GoogleConnect.Fetch("me", code);
                LoginGoogle profileGoogle = new JavaScriptSerializer().Deserialize<LoginGoogle>(json);

                if (profileGoogle.ID != null)
                {
                    User user       = new User();
                    user.FullName   = profileGoogle.displayName;
                    user.UserID     = profileGoogle.ID;
                    user.GoogleID   = profileGoogle.ID;
                    user.Avatar     = profileGoogle.Image.Url.Replace("sz=50", "sz=300");
                    user.Status     = true;
                    user.StatusJob  = false;
                    user.CreateTime = DateTime.Now;

                    //Lưu vào session
                    string googleID = profileGoogle.ID.ToString();
                    var data = db.Users.Where(x => x.GoogleID == googleID).FirstOrDefault();
                    //Nếu chưa có trong db thì add vào user mới
                    if (data == null)
                    {
                        db.Users.Add(user);
                        db.SaveChanges();

                        data = db.Users.Where(x => x.GoogleID == googleID).FirstOrDefault();
                        SessionUtility.User = data;
                    }
                    //Ngược lại thì đăng nhập
                    else
                    {
                        SessionUtility.User = data;
                    }

                    Response.Redirect("~/Default.aspx");
                }

            }

            if (Request.QueryString["error"] == "access_denied")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('User has denied access.')", true);
                return;
            }
        }

    }

    protected void LinkButton_LoginGoogle_Click(object sender, EventArgs e)
    {
        GoogleConnect.Authorize("profile");
    }
}