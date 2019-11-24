using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeUtility;
using System.IO;

public partial class InfoEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Ẩn tất cả các thông báo
            ucMessage.HideAll();
            ucMessage_ActiveEmail.HideAll();
            ucMessage_Report.HideAll();

            LoadData();
        }
    }

    //Hàm LoadData
    public void LoadData()
    {
        LinkButton_Save.Visible = false;

        //Lấy ID từ Url xuống
        string ID = Request.QueryString["id"].ToSafetyString();
        DBEntities db = new DBEntities();
        var item = db.Users
              .Where(x => x.UserID == ID).FirstOrDefault();

        //Nếu ko có thì báo lỗi, kết thúc
        if (item == null)
        {
            ucMessage.ShowError("Dữ liệu này không còn tồn tại, vui lòng kiểm tra lại.");
            return;
        }


        //Hiển thị từng giá trị lên các control
        //==Avatar User==
        if (item.Avatar.ToSafetyString().Trim() == string.Empty || item.Avatar == null)
            div_Avatar.Attributes.Add("style", "background-image: url('/images/NotFound/notfound.png');");
        else
            div_Avatar.Attributes.Add("style", "background-image: url('{0}');".StringFormat(item.Avatar.Replace("~/", "/")));


        //Nếu có session thì gán các control lên cho form report
        if (SessionUtility.User != null && SessionUtility.User.UserID != ID)
        {
            input_FullNameReport.Value = SessionUtility.User.FullName;
            input_EmailReport.Value    = SessionUtility.User.Email;
            input_MobiReport.Value     = SessionUtility.User.Mobi;


        }

        if (SessionUtility.User != null && SessionUtility.User.UserID == ID)
            a_report.Visible = false;

        if (SessionUtility.User == null)
            a_report.Visible = true;

        //Ẩn nút chọn hình khi chưa nhấn chỉnh sửa
        label_Image.Visible        = false;
        label_ImageCompany.Visible = false;

        input_FullName.Value        = item.FullName;
        input_Mobi.Value            = item.Mobi;
        input_Email.Value           = item.Email;
        input_GraduationYear.Value  = item.GraduationYear.ToSafetyString();
        input_Address.Value         = item.Address;
        input_Facebook.Value        = item.Facebook;
        textarea_PositionWork.Value = item.PositionWork;
        input_School.Value          = item.NameSchool;

        //Load thông tin Profile Left
        h3_FullName.InnerHtml         = item.FullName;
        span_School.InnerHtml         = item.NameSchool;
        span_GraduationYear.InnerHtml = item.GraduationYear.ToSafetyString();
        span_Update.InnerHtml         = string.Format("{0:MM/dd/yy}", item.CreateTime);
        span_Skill.InnerHtml          = MyUtility.LoadSkill(ID);




        //Kiểm tra nếu chưa active email
        if (SessionUtility.User != null)
        {
            if (SessionUtility.User.UserID == ID && item.Status == false)
            {
                ucMessage_ActiveEmail.ShowWarning("Bạn chưa kích hoạt email, vui lòng kiểm tra email và kích hoạt");
            }
        }

        //Kiểm tra trạng thái đã đi làm hay chưa?
        if (item.StatusJob == false)
        {
            radio_GotJob.Checked = false;
            radio_NotJob.Checked = true;
        }
        else
        {
            radio_GotJob.Checked = true;
            radio_NotJob.Checked = false;

            var itemCompany = db.Companies.Where(x => x.CompanyID == item.CompanyID).FirstOrDefault();
            if (itemCompany != null)
            {
                input_CompanyName.Value    = itemCompany.Title;
                input_CompanyAddress.Value = itemCompany.Address;
                input_CompanyWeb.Value     = itemCompany.Website;

                Company_Avatar.Attributes.Add("style", "background-image: url('{0}');".Replace("{0}", itemCompany.Avatar.Replace("~", "")));

                //Load thông tin Profile Left
                span_Company.InnerHtml = itemCompany.Title;

            }
        }
        //Load sở trường
        LoadSkill(ID);
    }

    //Hàm Load Kỹ năng
    public void LoadSkill(string userID)
    {
        DBEntities db = new DBEntities();
        var dataAllSkill = db.Skills.Select(x => new
        {
            ID = x.SkillID,
            x.Title
        });

        ListBox_Skill.DataTextField = "Title";
        ListBox_Skill.DataValueField = "ID";

        ListBox_Skill.DataSource = dataAllSkill.ToList();
        ListBox_Skill.DataBind();

        var dataSkillUser = db.Users.Where(x => x.UserID == userID).Select(x => x.TagSkill).FirstOrDefault();
        if (dataSkillUser != null && dataSkillUser != string.Empty)
        {
            if (dataSkillUser.Contains(";"))
            {
                string[] skillArr = dataSkillUser.Split(";");
                foreach (var item in dataAllSkill)
                {
                    foreach (var itemSkill in skillArr)
                    {
                        if (itemSkill.ToInt() == item.ID)
                        {
                            ListBox_Skill.Items.FindByValue(item.ID.ToSafetyString()).Selected = true;
                        }
                    }
                }
            }
            else
                ListBox_Skill.Items.FindByValue(dataSkillUser).Selected = true;
        }
    }

    //Button chỉnh sửa thông tin
    protected void LinkButton_Edit_Click(object sender, EventArgs e)
    {
        //Ẩn tất cả các thông báo
        ucMessage.HideAll();

        string ID = Request.QueryString["id"].ToSafetyString();

        //Nếu mà nó là user đó thì cho phép chỉnh sửa
        if (SessionUtility.User != null)
        {
            if (SessionUtility.User.UserID == ID)
            {
                //ẩn nút chỉnh sủa
                LinkButton_Edit.Visible = false;
                //Hiển thị nút show
                LinkButton_Save.Visible = true;
                //Ẩn nút report
                a_report.Visible = false;
                //hiện nút chọn hình
                label_Image.Visible = true;
                label_ImageCompany.Visible = true;

                input_FullName.Attributes.Remove("disabled");
                input_Mobi.Attributes.Remove("disabled");
                input_Email.Attributes.Remove("disabled");
                input_GraduationYear.Attributes.Remove("disabled");
                input_Address.Attributes.Remove("disabled");
                input_Facebook.Attributes.Remove("disabled");
                textarea_PositionWork.Attributes.Remove("disabled");
                ListBox_Skill.Attributes.Remove("disabled");
                FileUpload_Avatar.Attributes.Remove("disabled");
                radio_GotJob.Attributes.Remove("disabled");
                radio_NotJob.Attributes.Remove("disabled");
                input_School.Attributes.Remove("disabled");

                input_CompanyName.Attributes.Remove("disabled");
                input_CompanyAddress.Attributes.Remove("disabled");
                input_CompanyWeb.Attributes.Remove("disabled");
                //Load sở trường
                LoadSkill(ID);
            }
            else
            {
                Response.Write("<script> alert('Rất tiếc, bạn không thể chỉnh sửa người này!');</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('Bạn chưa đăng nhập, vui lòng đăng nhập để thực hiện chức năng này!');</script>");
        }
    }

    //Button lưu lại thông tin
    protected void LinkButton_Save_Click(object sender, EventArgs e)
    {
        if (SessionUtility.User != null)
        {
            //Hiển thị nút chỉnh sửa
            LinkButton_Edit.Visible = true;

            DBEntities db = new DBEntities();
            //Ẩn các thông báo trước đó
            ucMessage.HideAll();

            //Tìm 1 item thích hợp để cập nhật
            var item = db.Users.Where(x => x.UserID == SessionUtility.User.UserID).FirstOrDefault();

            //Nếu không có thì báo lỗi kết thúc
            if (item == null)
            {
                ucMessage.ShowError("Dữ liệu này không còn tồn tại");
                return;
            }
            //Lấy ra giá trị người nhập
            string fullName = input_FullName.Value.Trim();
            string email = input_Email.Value.Trim();
            string mobi = input_Mobi.Value.Trim();
            string address = input_Address.Value.Trim();
            string facebook = input_Facebook.Value.Trim();
            bool statusJob = radio_GotJob.Checked ? true : false;
            string school = input_School.Value.Trim();

            int graduationYear = input_GraduationYear.Value.Trim().ToInt();

            if (IsValid(fullName, email, mobi, address, facebook, school, graduationYear))
            {
                //Upload hình
                string avatar = string.Empty;
                string thumb = string.Empty;
                //=====kiểm tra tính hợp lệ của hình ảnh=====
                if (FileUpload_Avatar.FileName != string.Empty)
                {
                    //Kiểm tra đuôi hình hợp lệ
                    string validExtension = ".jpg.jpeg.png.gif.bmp.ico";
                    //Lấy đuôi hình
                    string fileExtension = Path.GetExtension(FileUpload_Avatar.FileName.ToLower());
                    if (!validExtension.Contains(fileExtension))
                    {
                        ucMessage.ShowError("Hình không hợp lệ, loại hình cho phép là:jpg, jpeg, png, gif, bmp, ico");
                        return;
                    }

                    //Kiểm tra dung lượng file thích hợp (file <= 3MB)
                    int validSize = 1024 * 1024 * 3;
                    int fileSize = FileUpload_Avatar.FileBytes.Length;
                    if (fileSize > validSize)
                    {
                        ucMessage.ShowError("Dung lượng hình phải >= 3MB");
                        return;
                    }

                    Exception error = null;
                    UploadUtility uploadUtility = new UploadUtility();
                    uploadUtility.FileUpload = FileUpload_Avatar;
                    uploadUtility.FolderSave = "~/fileuploads/Dev/Avatar";
                    uploadUtility.FullMaxWidth = 1000;
                    uploadUtility.ThumbMaxWidth = 400;
                    uploadUtility.MaxFileSize = 1024 * 1024 * 3; //Với 3 là 3MB
                    uploadUtility.AutoGenerateFileName = true;
                    uploadUtility.UploadImage(ref avatar, ref thumb, ref error);//Tham số đầu ra ref

                    //Nếu có úp hình, thì mới cập nhật hình mới
                    div_Avatar.Attributes.Add("style", "background-image: url('{0}');".StringFormat(avatar));
                }

                //============UPLOAD AVATAR COMPANY===============\\
                string avatarCompany = string.Empty;
                string thumbCompany = string.Empty;

                if (FileUpload_AvatarCompany.FileName != string.Empty)
                {
                    //Kiểm tra đuôi hình hợp lệ
                    string validExtension = ".jpg.jpeg.png.gif.bmp.ico";
                    //Lấy đuôi hình
                    string fileExtension = Path.GetExtension(FileUpload_AvatarCompany.FileName.ToLower());
                    if (!validExtension.Contains(fileExtension))
                    {
                        ucMessage.ShowError("Hình không hợp lệ, loại hình cho phép là:jpg, jpeg, png, gif, bmp, ico");
                        return;
                    }

                    //Kiểm tra dung lượng file thích hợp (file <= 3MB)
                    int validSize = 1024 * 1024 * 3;
                    int fileSize = FileUpload_AvatarCompany.FileBytes.Length;
                    if (fileSize > validSize)
                    {
                        ucMessage.ShowError("Dung lượng hình phải >= 3MB");
                        return;
                    }

                    Exception error = null;
                    UploadUtility uploadUtility = new UploadUtility();
                    uploadUtility.FileUpload = FileUpload_AvatarCompany;
                    uploadUtility.FolderSave = "~/fileuploads/Company/Avatar";
                    uploadUtility.FullMaxWidth = 1000;
                    uploadUtility.ThumbMaxWidth = 400;
                    uploadUtility.MaxFileSize = 1024 * 1024 * 3; //Với 3 là 3MB
                    uploadUtility.AutoGenerateFileName = true;
                    uploadUtility.UploadImage(ref avatarCompany, ref thumbCompany, ref error);//Tham số đầu ra ref

                    //Nếu có úp hình, thì mới cập nhật hình mới
                    Company_Avatar.Attributes.Add("style", "background-image: url('{0}');".StringFormat(avatarCompany));
                }

                ///Nếu User có up hình thì mới cập nhật hình mới
                if (avatar != string.Empty)
                {
                    item.Avatar = avatar;
                }

                //Lấy ra danh sách chọn kĩ năng
                var listboxSelected = ListBox_Skill.Items.Cast<ListItem>().Where(i => i.Selected);
                string listSkill = string.Empty;
                foreach (var itemSelected in listboxSelected)
                {
                    listSkill += itemSelected.Value + ";";
                }
                if (listSkill.Contains(";"))
                {
                    listSkill = listSkill.Remove(listSkill.Length - 1, 1);
                }

                //===================>Thêm vào bảng công ty
                //Cập nhật lại các giá trị

                item.FullName = fullName;
                item.Email = email;
                item.Mobi = mobi;
                item.Address = address;
                item.Facebook = facebook;
                item.GraduationYear = graduationYear;
                item.StatusJob = statusJob;
                item.CreateTime = DateTime.Now;

                item.NameSchool = school;
                item.TagSkill = listSkill;


                //Nếu đã đi làm thì lấy thông tin lưu vào company trong tbl_user
                if (radio_GotJob.Checked)
                {
                    //lấy ra các danh sách công ty
                    string companyName = input_CompanyName.Value.Trim();
                    string companyAddress = input_CompanyAddress.Value.Trim();
                    string companyWeb = input_CompanyWeb.Value.Trim();
                    string positionWork = textarea_PositionWork.Value.Trim();

                    if (IsValidCompany(companyName, companyAddress, companyWeb, positionWork))
                    {

                        //lấy ra id nếu người dùng chọn từ gợi ý
                        item.PositionWork = positionWork;

                        int idCompany = input_IDCompanyAjax.Value.Trim().ToInt();
                        string avatarCompanyAjax = input_AvatarCompanyAjax.Value.Trim();

                        if (item.CompanyID == null && idCompany == 0)
                        {

                            if (avatarCompany.IsNullOrEmpty() && avatarCompanyAjax == string.Empty)
                            {
                                ucMessage.ShowError("Vui lòng up ảnh đại diện công ty");
                                return;
                            }

                            Company company = new Company();
                            company.Title = companyName;
                            company.Address = companyAddress;
                            company.Website = companyWeb;
                            company.Avatar = avatarCompany;
                            company.Status = true;


                            try
                            {
                                db.Companies.Add(company);
                                db.SaveChanges();

                                //Ánh xạ ID của compamy vừa thêm vào bảng user
                                item.CompanyID = company.CompanyID;
                            }
                            catch (Exception)
                            {

                                ucMessage.ShowError("Lỗi hệ thống! Vui lòng thử lại");
                                return;
                            }

                        }
                        if (idCompany != 0)
                        {
                            item.CompanyID = idCompany;
                        }

                        if (positionWork.IsNullOrEmptyOrWhiteSpaces())
                        {
                            ucMessage.ShowError("Đăng tin không thành công, vui lòng nhập vị trí công việc của bạn");
                            return;
                        }
                    }
                    else return;
                }

                //Nếu đã đi làm thì reset thông tin company trong tbl_user
                if (radio_NotJob.Checked)
                {
                    item.StatusJob = statusJob;
                    item.CompanyID = null;
                }

                //Lưu lại
                db.SaveChanges();
                //Cập nhật lại session
                SessionUtility.User = item;
                ucMessage.ShowSuccess("Cập nhật dữ liệu thành công");
                LoadData();
            }
        }

    }

    //Hàm khi người dùng báo cáo thông tin
    protected void LinkButton_Report_Click(object sender, EventArgs e)
    {
        string ID = Request.QueryString["id"].ToSafetyString();
        DBEntities db = new DBEntities();
        var item = db.Users.Where(x => x.UserID == ID).FirstOrDefault();

        if (item == null)
        {
            ucMessage_Report.ShowWarning("Dữ liệu này không còn tồn tại, vui lòng kiểm tra lại");
            return;
        }

        string fullNameReport = input_FullNameReport.Value.Trim();
        string emailReport = input_EmailReport.Value.Trim();
        string phoneReport = input_MobiReport.Value.Trim();
        string contentReport = textarea_ContentReport.Value.Trim();

        if (SessionUtility.User != null)
        {
            input_FullNameReport.Value = SessionUtility.User.FullName;
            input_EmailReport.Value = SessionUtility.User.Email;
            input_MobiReport.Value = SessionUtility.User.Mobi;
        }

        if (contentReport == string.Empty || contentReport.IsNullOrEmptyOrWhiteSpaces())
        {
            ucMessage_Report.ShowError("Vui lòng nhập nội bạn cần dung báo cáo");
            return;
        }

        if (fullNameReport == string.Empty || fullNameReport.IsNullOrEmptyOrWhiteSpaces())
        {
            ucMessage_Report.ShowError("Vui lòng tên của bạn");
            return;
        }

        if (emailReport == string.Empty || !emailReport.IsEmailFormat())
        {
            ucMessage_Report.ShowError("Vui lòng nhập email đúng định dạng");
            return;
        }
        else
        {
            Report report = new Report();

            report.UserID = SessionUtility.User.UserID;
            report.ReportedUser = item.UserID;
            report.FullName = fullNameReport;
            report.Content = contentReport;
            report.CreateTime = DateTime.Now;
            report.Email = emailReport;
            report.Mobi = phoneReport;
            db.Reports.Add(report);
            db.SaveChanges();
            ucMessage_Report.ShowSuccess("Cảm ơn bạn đã báo cáo nội dung vì cộng đồng lập trình viên Bình Dương.");
        }



    }

    //Hàm kiểm tra tính hợp lệ của dữ liệu người dùng
    public bool IsValid(string fullName, string email, string mobi, string address, string facebook, string school, int graduationYear)
    {


        if (fullName == string.Empty)
        {
            ucMessage.ShowError("Đăng tin không thành công, vui lòng nhập họ tên...");
            return false;
        }

        if (graduationYear == 0)
        {
            ucMessage.ShowError("Lưu không thành công, vui lòng nhập năm tốt nghiệp của bạn");
            return false;
        }

        if (email == string.Empty || !email.IsEmailFormat())
        {
            ucMessage.ShowError("Đăng tin không thành công, vui lòng nhập email đúng định dạng...");
            return false;
        }

        if (address.IsNullOrEmptyOrWhiteSpaces())
        {
            ucMessage.ShowError("Đăng tin không thành công, vui lòng nhập địa chỉ của bạn");
            return false;
        }


        return true;
    }

    public bool IsValidCompany(string companyName, string companyAddress, string companyWeb, string positionWork)
    {


        if (companyName.IsNullOrEmpty())
        {
            ucMessage.ShowError("Vui lòng nhập tên công ty");
            return false;
        }
        if (companyAddress.IsNullOrEmpty())
        {
            ucMessage.ShowError("Vui lòng nhập địa chỉ công ty");
            return false;
        }
        if (companyWeb.IsNullOrEmpty())
        {
            ucMessage.ShowError("Vui lòng nhập website công ty");
            return false;
        }

        if (positionWork.IsNullOrEmpty())
        {
            ucMessage.ShowError("Vui lòng nhập vi trí công việc");
            return false;
        }


        return true;

    }
}