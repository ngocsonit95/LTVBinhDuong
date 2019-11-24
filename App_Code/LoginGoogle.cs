using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class LoginGoogle
{
        public string ID { get; set; }
        public string displayName{ get; set; }
        public Image Image{get; set; }
}

public class Image
{
    public string Url { get; set; }
}
