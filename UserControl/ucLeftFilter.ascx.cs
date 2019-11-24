using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeUtility;

public partial class ucLeftFilter : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadSkill();
            LoadSchool();
            LoadCompany();
        }

    }

    public void LoadCompany()
    {
        DBEntities db = new DBEntities();
        var data = db.Companies.Where(x => x.Status == true).Select(x => new
        {
            ID = x.CompanyID,
            x.Title,
            x.Avatar
        });

        Repeater_Company.DataSource = data.ToList();
        Repeater_Company.DataBind();

    }

    public void LoadSchool()
    {
        DBEntities db = new DBEntities();
        var data = db.Schools.Where(x => x.Status == true).Select(x => new
        {
            ID = x.SchoolID,
            x.Title
        });

        Repeater_School.DataSource = data.ToList();
        Repeater_School.DataBind();
    }

    public void LoadSkill()
    {
        DBEntities db = new DBEntities();
        var data = db.Skills.Where(x => x.Status == true).Select(x => new
        {
            ID = x.SkillID,
            x.Title
        });

        Repeater_Skill.DataSource = data.ToList();
        Repeater_Skill.DataBind();
    }

    public string CheckedLeft(string type, int id)
    {
        string valueType = Request.QueryString[type].ToSafetyString();

        if (valueType.Contains("-"))
        {
            string[] skillArr = valueType.Split('-');

            if (valueType.Contains(id.ToSafetyString()))
            {
                return "checked";
            }
            return string.Empty;
        }
        else
        {
            if (valueType != string.Empty && valueType.ToInt() == id)
            {
                return "checked";
            }
            else
                return string.Empty;
        }
    }

    public string AvatarCompany(string avatar)
    {
        if(avatar.IsNullOrEmpty())
        {
            return "/images/NotFound/noimage.jpg";
        }
        return avatar;
    }
}