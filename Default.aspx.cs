using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
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
        DBEntities db = new DBEntities();
        var query = db.Users
            .OrderByDescending(x=>x.CreateTime)
            .Select(x => new
            {
                ID = x.UserID,
                x.FullName,
                x.Facebook,
                x.Address,
                x.Avatar,
                x.Mobi,
                x.Email,
                x.StatusJob,
                x.NameSchool,
                x.Status,
            });
            //.Where(x => x.Status == true);
        var data = query.ToList();

        Repeater_Main.DataSource = data;
        Repeater_Main.DataBind();
    }
}