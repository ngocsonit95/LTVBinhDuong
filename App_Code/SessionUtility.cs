using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CodeUtility;
public class SessionUtility
{
    public static User User
    {
        get
        {
            return HttpContext.Current.Session["User"] as User;
        }
        set
        {
            HttpContext.Current.Session["User"] = value;
        }
    }

}