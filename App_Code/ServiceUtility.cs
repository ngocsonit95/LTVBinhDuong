using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using CodeUtility;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService]
public class ServiceUtility : System.Web.Services.WebService
{
    [WebMethod(EnableSession = true)]
    public bool AddReport(string message, string fullName, string mobi, string email, string reportID)
    {
        DBEntities db = new DBEntities();
        var item = db.Users.Where(x => x.UserID == reportID).FirstOrDefault();
        if (item == null)
        {
            return false;
        }

        Report report = new Report();

        if (SessionUtility.User == null)
            report.UserID = null;
        else
            report.UserID = SessionUtility.User.UserID;

        report.ReportedUser = reportID;
        report.FullName = fullName;
        report.Content = message;
        report.CreateTime = DateTime.Now;
        report.Email = email;
        report.Mobi = mobi;
        db.Reports.Add(report);
        db.SaveChanges();

        return true;
    }

    public class TypeSearchModel
    {
        public string Type { get; set; }
        public string KeySearch { get; set; }
    }

    [WebMethod]
    public List<DataUser> GetUser(int page, int pageSize, TypeSearchModel modelSearch)
    {
        int skip = (page - 1) * pageSize;
        int take = pageSize;

        DBEntities db = new DBEntities();
        var data = db.Users
             .OrderBy(x => x.Position)
             .Select(x => new DataUser
             {
                 Avatar = x.Avatar != null ? x.Avatar : string.Empty,
                 FullName = x.FullName != null ? x.FullName : string.Empty,
                 UserID = x.UserID != null ? x.UserID : string.Empty,
                 NameSchool = x.NameSchool != null ? x.NameSchool : string.Empty,
                 JobStatus = x.StatusJob == null ? false : x.StatusJob.Value,
                 CreateTime = x.CreateTime.Value,
                 Tag = x.TagSkill != null ? x.TagSkill : string.Empty,
                 IDCompany = x.CompanyID == null ? 0 : x.CompanyID.Value,
                 TitleCompany = x.Company.Title != null ? x.Company.Title : string.Empty,
                 GraduationYear = x.GraduationYear == null ? 0: x.GraduationYear.Value,
                 Skill = string.Empty,
                 FlagPage = false
             });

        string keySearch = modelSearch.KeySearch.ToSafetyString();

        if (modelSearch.Type == "muti")
        {
            foreach (var item in modelSearch.KeySearch.SplitToTextValueArray(";", ":", StringSplitOptions.RemoveEmptyEntries))
            {
                if (item.Text == "sk")
                {
                    data = data.Where(x => x.Tag != null && x.Tag.Contains(item.Value));
                }

                if (item.Text == "sc")
                {
                    data = data.Where(x => x.NameSchool.Contains(item.Value));
                }
            }
        }

        if (modelSearch.Type == "sk")
        {
            data = data.Where(x => x.Tag != null && x.Tag.Contains(keySearch));
        }
        if (modelSearch.Type == "sc")
        {
            data = data.Where(x => x.NameSchool.Contains(keySearch));
        }
        if (modelSearch.Type == "cp")
        {
            int idCompany = keySearch.ToInt();
            data = data.Where(x => x.IDCompany == idCompany);
        }
        if (modelSearch.Type == "job")
        {
            if (modelSearch.KeySearch == "1")
            {
                data = data.Where(x => x.JobStatus == true);
            }
            if (modelSearch.KeySearch == "2")
            {
                data = data.Where(x => x.JobStatus == false);
            }
        }
        if (modelSearch.Type == "keyname")
        {
            data = data.Where(x => x.FullName.Contains(modelSearch.KeySearch));
        }

        List<DataUser> listUser = new List<DataUser>();

        int coutData = data.Count();
        int demFist = 0;
        foreach (var item in data)
        {
            demFist++;

            item.Skill = MyUtility.LoadSkill(item.UserID);
            if (demFist == coutData)
            {
                item.FlagPage = true;
            }
            listUser.Add(item);
        }


        return listUser.Skip(skip).Take(take).ToList();
    }

    //Service Company
    public class DataCompany
    {
        public int ID { get; set; }
        public string Title { get; set; }
        public string Website { get; set; }
        public string Avatar { get; set; }
        public string Address { get; set; }
    }

    [WebMethod]
    public List<DataCompany> GetCompanyName(string title)
    {
        DBEntities db = new DBEntities();
        var query = db.Companies
            .Where(x => x.Title.Contains(title))
            .Select(x => new DataCompany
            {
                ID = x.CompanyID,
                Title = x.Title == null ? string.Empty : x.Title,
                Website = x.Website == null ? string.Empty : x.Website,
                Avatar = x.Avatar == null ? string.Empty : x.Avatar,
                Address = x.Address == null ? string.Empty : x.Address

            }).ToList();


        return query;
    }

    //Login Facebook
    [WebMethod(EnableSession = true)]
    public bool LoginFacebook(string email, string avatar, string fullName, string idFacebook)
    {
        DBEntities db = new DBEntities();
        var item = db.Users.Where(x => x.Email == email && x.FacebookID == idFacebook).FirstOrDefault();
        if (item == null)
        {
            User user = new User();
            user.UserID = idFacebook;
            user.Email = email;
            user.Avatar = avatar;
            user.FullName = fullName;
            user.Status = true;
            user.FacebookID = idFacebook;
            user.StatusJob = false;

            user.CreateTime = DateTime.Now;

            try
            {
                db.Users.Add(user);
                db.SaveChanges();
                SessionUtility.User = user;
                return true;
            }
            catch (Exception ex)
            {

                return false;
            }

        }
        else
        {

            //Lưu thông tin đăng nhập vào Session
            SessionUtility.User = item;
            return true;
        }

    }

    [WebMethod(EnableSession = true)]
    public bool Login(string username, string password)
    {
        string passwordEncript = "tamgiacvuong";
        password = password.SHA256Hash(passwordEncript);
        DBEntities db = new DBEntities();
        var item = db.Users.Where(x => x.UserID == username && x.Password == password).FirstOrDefault();
        if (item != null)
        {
            //Lưu thông tin đăng nhập vào Session
            SessionUtility.User = item;
            return true;
        }
        return false;
    }

    [WebMethod]
    public int Register(string fullName, string email, string username, string password)
    {

        //Kiểm tra Email
        DBEntities db = new DBEntities();
        if (db.Users.FirstOrDefault(x => x.Email == email) != null)
        {
            return 1;
        }
        if (db.Users.FirstOrDefault(x => x.UserID == username) != null)
        {
            return 2;
        }
        //Tạo thành viên mới
        User item = new User();
        item.Email = email;
        item.FullName = fullName;
        string passwordEncript = "tamgiacvuong";
        item.Password = password.SHA256Hash(passwordEncript);

        item.UserID = username;
        item.StatusJob = false;
        item.CreateTime = DateTime.Now;
        item.Status = false;

        //Gửi mail thông báo và yêu cầu kích hoạt
        MailUtility mail = new MailUtility();
        mail.Host = "smtp.gmail.com";
        mail.Port = 587;
        mail.EnableSSL = true;
        mail.IsBodyHtml = true;

        mail.From = "laptrinhvienbd2018@gmail.com";
        mail.Password = "laptrinhvien2018";

        mail.To = email;
        mail.Subject = "Kích hoạt tài khoản";

        string template = Server.MapPath("~/MailTemplate/active.html");
        mail.Body = FileUtility.ReadFile(template);

        string domain = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority);

        string emailEncript = string.Empty;
        emailEncript = email.AES256Encrypt(passwordEncript);

        string url = "{0}/Active.aspx?id={1}".StringFormat(domain, emailEncript);
        mail.Body = mail.Body.Replace("~name~", username);
        mail.Body = mail.Body.Replace("~url~", url);

        Exception error = null;
        mail.SendMail(ref error);

        if (error != null)
        {
            return 3;
        }

        //Lưu vào DB
        db.Users.Add(item);
        db.SaveChanges();

        return 4;
    }


}
