using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CodeUtility;

/// <summary>
/// Summary description for MyUtility
/// </summary>
public static class MyUtility
{
    public static string LoadSkill(object userID)
    {
        string ID = userID.ToSafetyString();
        DBEntities db = new DBEntities();
        var data = db.Users.Where(x => x.UserID == ID).Select(x => x.TagSkill).FirstOrDefault();

        if (data != null && data != string.Empty)
        {
            string result = string.Empty;
            string[] tagSkillArray = data.Split(";");
            foreach (var item in tagSkillArray)
            {
                int itemSkill = item.ToInt();
                var titleSkill = db.Skills.Where(x => x.SkillID == itemSkill).Select(x => x.Title).FirstOrDefault();
                result += titleSkill + " - ";
            }
            return result.Remove(result.Length - 2, 2);
        }

        return string.Empty;
    }
}