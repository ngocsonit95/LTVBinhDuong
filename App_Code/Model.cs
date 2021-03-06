﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

public partial class Admin
{
    public Admin()
    {
        this.Skills = new HashSet<Skill>();
        this.Users = new HashSet<User>();
    }

    public string Username { get; set; }
    public string Password { get; set; }
    public string FullName { get; set; }
    public string Avatar { get; set; }
    public string Mobi { get; set; }
    public string Email { get; set; }
    public string Address { get; set; }
    public Nullable<int> Position { get; set; }
    public Nullable<bool> Status { get; set; }
    public Nullable<System.DateTime> CreateTime { get; set; }

    public virtual ICollection<Skill> Skills { get; set; }
    public virtual ICollection<User> Users { get; set; }
}

public partial class Company
{
    public Company()
    {
        this.Users = new HashSet<User>();
    }

    public int CompanyID { get; set; }
    public string Title { get; set; }
    public string Avatar { get; set; }
    public string Mobi { get; set; }
    public string Email { get; set; }
    public string Address { get; set; }
    public Nullable<int> Position { get; set; }
    public Nullable<bool> Status { get; set; }
    public Nullable<System.DateTime> CreateTime { get; set; }
    public string Website { get; set; }

    public virtual ICollection<User> Users { get; set; }
}

public partial class Opinion
{
    public int OpinionID { get; set; }
    public string Content { get; set; }
    public Nullable<System.DateTime> CreateTime { get; set; }
    public string FullName { get; set; }
    public string Email { get; set; }
    public string Phone { get; set; }
    public string UserID { get; set; }
    public Nullable<bool> Type { get; set; }

    public virtual User User { get; set; }
}

public partial class Report
{
    public int ReportID { get; set; }
    public string UserID { get; set; }
    public string FullName { get; set; }
    public string Email { get; set; }
    public string Mobi { get; set; }
    public string Content { get; set; }
    public Nullable<System.DateTime> CreateTime { get; set; }
    public string ReportedUser { get; set; }

    public virtual User User { get; set; }
}

public partial class School
{
    public int SchoolID { get; set; }
    public string Title { get; set; }
    public string Avatar { get; set; }
    public string Mobi { get; set; }
    public string Email { get; set; }
    public string Address { get; set; }
    public Nullable<int> Position { get; set; }
    public Nullable<bool> Status { get; set; }
    public Nullable<System.DateTime> CreateTime { get; set; }
}

public partial class Skill
{
    public int SkillID { get; set; }
    public string Title { get; set; }
    public string Avatar { get; set; }
    public string Description { get; set; }
    public Nullable<int> Position { get; set; }
    public Nullable<System.DateTime> CreateTime { get; set; }
    public Nullable<bool> Status { get; set; }
    public string CreateBy { get; set; }

    public virtual Admin Admin { get; set; }
}

public partial class sysdiagram
{
    public string name { get; set; }
    public int principal_id { get; set; }
    public int diagram_id { get; set; }
    public Nullable<int> version { get; set; }
    public byte[] definition { get; set; }
}

public partial class User
{
    public User()
    {
        this.Opinions = new HashSet<Opinion>();
        this.Reports = new HashSet<Report>();
    }

    public string UserID { get; set; }
    public string FacebookID { get; set; }
    public string GoogleID { get; set; }
    public string Password { get; set; }
    public string FullName { get; set; }
    public string Avatar { get; set; }
    public string Mobi { get; set; }
    public string Email { get; set; }
    public string Facebook { get; set; }
    public string Address { get; set; }
    public Nullable<bool> Status { get; set; }
    public Nullable<bool> StatusJob { get; set; }
    public string PositionWork { get; set; }
    public Nullable<int> GraduationYear { get; set; }
    public Nullable<int> Position { get; set; }
    public string NameSchool { get; set; }
    public string CreateBy { get; set; }
    public Nullable<System.DateTime> CreateTime { get; set; }
    public string TagSkill { get; set; }
    public Nullable<int> CompanyID { get; set; }

    public virtual Admin Admin { get; set; }
    public virtual Company Company { get; set; }
    public virtual ICollection<Opinion> Opinions { get; set; }
    public virtual ICollection<Report> Reports { get; set; }
}
