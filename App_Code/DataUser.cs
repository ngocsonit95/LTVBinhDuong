using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DataUser
/// </summary>
public class DataUser
{
    public string UserID { get; set; }
    public string FullName { get; set; }
    public string Avatar { get; set; }
    public string NameSchool { get; set; }
    public int IDCompany { get; set; }
    public bool JobStatus { get; set; }
    public string Skill { get; set; }
    public string Tag { get; set; }
    public string TitleCompany { get; set; }
    public int GraduationYear { get; set; }
    public DateTime CreateTime { get; set; }
    public bool FlagPage { get; set; }

}