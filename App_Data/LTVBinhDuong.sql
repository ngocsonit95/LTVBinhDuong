
CREATE DATABASE [LTVBinhDuong]
GO
USE [LTVBinhDuong]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 10/30/2018 10:18:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](255) NULL,
	[FullName] [nvarchar](50) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Mobi] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](255) NULL,
	[Position] [int] NULL,
	[Status] [bit] NULL,
	[CreateTime] [datetime] NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company]    Script Date: 10/30/2018 10:18:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Mobi] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](255) NULL,
	[Position] [int] NULL,
	[Status] [bit] NULL,
	[CreateTime] [datetime] NULL,
	[Website] [nvarchar](50) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Opinion]    Script Date: 10/30/2018 10:18:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opinion](
	[OpinionID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [ntext] NULL,
	[CreateTime] [datetime] NULL,
	[FullName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[UserID] [nvarchar](50) NULL,
	[Type] [bit] NULL,
 CONSTRAINT [PK_Opinion] PRIMARY KEY CLUSTERED 
(
	[OpinionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Report]    Script Date: 10/30/2018 10:18:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](50) NULL,
	[FullName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Mobi] [nvarchar](50) NULL,
	[Content] [ntext] NULL,
	[CreateTime] [datetime] NULL,
	[ReportedUser] [nvarchar](50) NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[School]    Script Date: 10/30/2018 10:18:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[School](
	[SchoolID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Mobi] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](255) NULL,
	[Position] [int] NULL,
	[Status] [bit] NULL,
	[CreateTime] [datetime] NULL,
 CONSTRAINT [PK_School] PRIMARY KEY CLUSTERED 
(
	[SchoolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Skill]    Script Date: 10/30/2018 10:18:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skill](
	[SkillID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[Position] [int] NULL,
	[CreateTime] [datetime] NULL,
	[Status] [bit] NULL,
	[CreateBy] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Skill] PRIMARY KEY CLUSTERED 
(
	[SkillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/30/2018 10:18:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [nvarchar](50) NOT NULL,
	[FacebookID] [nvarchar](255) NULL,
	[GoogleID] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
	[FullName] [nvarchar](50) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Mobi] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Facebook] [nvarchar](50) NULL,
	[Address] [nvarchar](255) NULL,
	[Status] [bit] NULL,
	[StatusJob] [bit] NULL,
	[PositionWork] [nvarchar](255) NULL,
	[GraduationYear] [int] NULL,
	[Position] [int] NULL,
	[NameSchool] [nvarchar](50) NULL,
	[CreateBy] [nvarchar](50) NULL,
	[CreateTime] [datetime] NULL,
	[TagSkill] [nvarchar](255) NULL,
	[CompanyID] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Admin] ([Username], [Password], [FullName], [Avatar], [Mobi], [Email], [Address], [Position], [Status], [CreateTime]) VALUES (N'admin', N'123456', N'Nguyễn Văn A', NULL, N'0123456789', N'abc@gmail.com', N'Bình Dương', 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([CompanyID], [Title], [Avatar], [Mobi], [Email], [Address], [Position], [Status], [CreateTime], [Website]) VALUES (1, N'FPT Software', N'/images/Company/images.png', N'123456789', N'fpt@gmail.com', N'Nguyễn Thị Thập- Q7 - Thành Phố Hồ Chí Minh', 1, 1, NULL, N'fptshopware.com')
INSERT [dbo].[Company] ([CompanyID], [Title], [Avatar], [Mobi], [Email], [Address], [Position], [Status], [CreateTime], [Website]) VALUES (3, N'BDS SLUTION', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Company] ([CompanyID], [Title], [Avatar], [Mobi], [Email], [Address], [Position], [Status], [CreateTime], [Website]) VALUES (5, N'Computing', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Company] ([CompanyID], [Title], [Avatar], [Mobi], [Email], [Address], [Position], [Status], [CreateTime], [Website]) VALUES (6, N'KFC Solution', N'/images/Company/kfc.png', N'12345648', NULL, N'Bình Dương', NULL, 1, NULL, N'kfc.com')
INSERT [dbo].[Company] ([CompanyID], [Title], [Avatar], [Mobi], [Email], [Address], [Position], [Status], [CreateTime], [Website]) VALUES (7, N'Lập trinh A', N'~/fileuploads/Company/Avatar/10a4bcbe7af34ec288a8fba1545c04a9.png', NULL, NULL, N'Hà Nội', NULL, 1, NULL, N'hanoilab.com')
INSERT [dbo].[Company] ([CompanyID], [Title], [Avatar], [Mobi], [Email], [Address], [Position], [Status], [CreateTime], [Website]) VALUES (8, N'BKAV', N'~/fileuploads/Company/Avatar/7e9f46a8231541f6be52a88cd91db973.png', NULL, NULL, N'Quận 1- Thành phố hồ chí minh', NULL, 1, NULL, N'bkav.com')
INSERT [dbo].[Company] ([CompanyID], [Title], [Avatar], [Mobi], [Email], [Address], [Position], [Status], [CreateTime], [Website]) VALUES (13, N'Công ty phần mềm Quang Trubg', N'~/fileuploads/Company/Avatar/a4b1b070cf4b4ea086c79bbb3ed4839a.png', NULL, NULL, N'Quận 12 - Thành Phố Hồ Chí Minh', NULL, 1, NULL, N'quangtrung.com')
INSERT [dbo].[Company] ([CompanyID], [Title], [Avatar], [Mobi], [Email], [Address], [Position], [Status], [CreateTime], [Website]) VALUES (14, N'Công ty VNG Game', N'~/fileuploads/Company/Avatar/35866bb932ea427f8dec5459c4af030d.png', NULL, NULL, N'Quận Tân Phú', NULL, 1, NULL, N'vng.com')
INSERT [dbo].[Company] ([CompanyID], [Title], [Avatar], [Mobi], [Email], [Address], [Position], [Status], [CreateTime], [Website]) VALUES (15, N'Công ty phần mềm Á Âu', N'~/fileuploads/Company/Avatar/216afe1d26384c9b8c62584b606ed097.jpg', NULL, NULL, N'Hà Nội', NULL, 1, NULL, N'ok.com')
INSERT [dbo].[Company] ([CompanyID], [Title], [Avatar], [Mobi], [Email], [Address], [Position], [Status], [CreateTime], [Website]) VALUES (16, N'Công ty Điện Máy Xanh', N'~/fileuploads/Company/Avatar/57a4ca0412f048fb8c65a6094bf2a958.png', NULL, NULL, N'Ngã tư hòa lân', NULL, 1, NULL, N'dienmayxanh.com')
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Opinion] ON 

INSERT [dbo].[Opinion] ([OpinionID], [Content], [CreateTime], [FullName], [Email], [Phone], [UserID], [Type]) VALUES (13, N'Báo cáo sai tin', CAST(N'2018-10-09 09:42:35.797' AS DateTime), NULL, N'mrsonit95@gmail.com', N'0348539913', N'thanhit', 0)
INSERT [dbo].[Opinion] ([OpinionID], [Content], [CreateTime], [FullName], [Email], [Phone], [UserID], [Type]) VALUES (14, N'Nội dung liên hệ', CAST(N'2018-10-09 09:46:57.467' AS DateTime), N'Nguyễn Ngọc Sơn', N'mrsonit95@gmail.com', N'0348539913', NULL, 1)
INSERT [dbo].[Opinion] ([OpinionID], [Content], [CreateTime], [FullName], [Email], [Phone], [UserID], [Type]) VALUES (15, N'Bị trùng tin nhé', CAST(N'2018-10-09 09:47:58.173' AS DateTime), NULL, N'quyenktktbd@gmail.com', N'097233803', N'ngocsonit', 0)
INSERT [dbo].[Opinion] ([OpinionID], [Content], [CreateTime], [FullName], [Email], [Phone], [UserID], [Type]) VALUES (16, N'Lừa đảo', CAST(N'2018-10-09 09:51:56.933' AS DateTime), N'Nguyễn Thành Luân', N'luan@gmail.com', N'0987654321', N'vanquyenktktbd', 0)
INSERT [dbo].[Opinion] ([OpinionID], [Content], [CreateTime], [FullName], [Email], [Phone], [UserID], [Type]) VALUES (21, N'báo cáo tin 1', CAST(N'2018-10-09 10:31:19.647' AS DateTime), N'Nguyễn Thành Luân', N'vanquyenktktbd@gmail.cm', N'0348539913', N'vanquyenktktbd', 0)
SET IDENTITY_INSERT [dbo].[Opinion] OFF
SET IDENTITY_INSERT [dbo].[Report] ON 

INSERT [dbo].[Report] ([ReportID], [UserID], [FullName], [Email], [Mobi], [Content], [CreateTime], [ReportedUser]) VALUES (45, N'betusy', N'Sỹ BETU', N'sybetu@gmail.com', N'2332', N'Ok chưa', CAST(N'2018-10-12 14:39:28.507' AS DateTime), N'betusy')
INSERT [dbo].[Report] ([ReportID], [UserID], [FullName], [Email], [Mobi], [Content], [CreateTime], [ReportedUser]) VALUES (46, N'vanquyenktktbd', N'Văn Quyền', N'vanquyenktktbd@gmail.cm', N'0972332803', N'ok', CAST(N'2018-10-13 23:18:05.320' AS DateTime), N'vanquyen')
INSERT [dbo].[Report] ([ReportID], [UserID], [FullName], [Email], [Mobi], [Content], [CreateTime], [ReportedUser]) VALUES (47, N'quynhnhu', N'Nguyễn Thị Quỳnh', N'quynhnhu@gmail.com', N'0123456789', N'Trùng nội dung: ', CAST(N'2018-10-16 18:57:30.640' AS DateTime), N'vanquyenktktbd')
SET IDENTITY_INSERT [dbo].[Report] OFF
SET IDENTITY_INSERT [dbo].[School] ON 

INSERT [dbo].[School] ([SchoolID], [Title], [Avatar], [Mobi], [Email], [Address], [Position], [Status], [CreateTime]) VALUES (1, N'Đại học Kinh Tế- Kỹ Thuật Bình Dương', NULL, N'0123456', N'ktkt@gmail.com', N'Bình Dương', 1, 1, NULL)
INSERT [dbo].[School] ([SchoolID], [Title], [Avatar], [Mobi], [Email], [Address], [Position], [Status], [CreateTime]) VALUES (2, N'Đại học Kinh Tế- Kỹ Thuật Bình Dương', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[School] ([SchoolID], [Title], [Avatar], [Mobi], [Email], [Address], [Position], [Status], [CreateTime]) VALUES (3, N'Đại học Kinh Tế- Kỹ Thuật Bình Dương', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[School] ([SchoolID], [Title], [Avatar], [Mobi], [Email], [Address], [Position], [Status], [CreateTime]) VALUES (4, N'Đại học Kinh Tế- Kỹ Thuật Bình Dương', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[School] ([SchoolID], [Title], [Avatar], [Mobi], [Email], [Address], [Position], [Status], [CreateTime]) VALUES (5, N'Đại học Kinh Tế- Kỹ Thuật Bình Dương', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[School] ([SchoolID], [Title], [Avatar], [Mobi], [Email], [Address], [Position], [Status], [CreateTime]) VALUES (6, N'Đại học Kinh Tế- Kỹ Thuật Bình Dương', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[School] ([SchoolID], [Title], [Avatar], [Mobi], [Email], [Address], [Position], [Status], [CreateTime]) VALUES (7, N'Đại học Kinh Tế- Kỹ Thuật Bình Dương', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[School] ([SchoolID], [Title], [Avatar], [Mobi], [Email], [Address], [Position], [Status], [CreateTime]) VALUES (8, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[School] ([SchoolID], [Title], [Avatar], [Mobi], [Email], [Address], [Position], [Status], [CreateTime]) VALUES (9, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[School] ([SchoolID], [Title], [Avatar], [Mobi], [Email], [Address], [Position], [Status], [CreateTime]) VALUES (10, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[School] OFF
SET IDENTITY_INSERT [dbo].[Skill] ON 

INSERT [dbo].[Skill] ([SkillID], [Title], [Avatar], [Description], [Position], [CreateTime], [Status], [CreateBy]) VALUES (1, N'C#', NULL, N'C sharp', 1, CAST(N'2018-04-10 00:00:00.000' AS DateTime), 1, N'admin')
INSERT [dbo].[Skill] ([SkillID], [Title], [Avatar], [Description], [Position], [CreateTime], [Status], [CreateBy]) VALUES (2, N'SQL', NULL, N'Cơ sở dữ liệu ', 2, CAST(N'2018-04-10 00:00:00.000' AS DateTime), 1, N'admin')
INSERT [dbo].[Skill] ([SkillID], [Title], [Avatar], [Description], [Position], [CreateTime], [Status], [CreateBy]) VALUES (3, N'Android', NULL, N'Lập trình thiết bị di động', 3, CAST(N'2018-04-10 00:00:00.000' AS DateTime), 1, N'admin')
SET IDENTITY_INSERT [dbo].[Skill] OFF
INSERT [dbo].[Users] ([UserID], [FacebookID], [GoogleID], [Password], [FullName], [Avatar], [Mobi], [Email], [Facebook], [Address], [Status], [StatusJob], [PositionWork], [GraduationYear], [Position], [NameSchool], [CreateBy], [CreateTime], [TagSkill], [CompanyID]) VALUES (N'100356179605898715059', NULL, N'100356179605898715059', NULL, N'Vlog Sơn Nguyễn.Hôk', N'https://lh4.googleusercontent.com/-ltkfp2Nt1CI/AAAAAAAAAAI/AAAAAAAADEM/V3oHwTf6dpU/photo.jpg?sz=300', NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-10-30 21:34:47.260' AS DateTime), NULL, NULL)
INSERT [dbo].[Users] ([UserID], [FacebookID], [GoogleID], [Password], [FullName], [Avatar], [Mobi], [Email], [Facebook], [Address], [Status], [StatusJob], [PositionWork], [GraduationYear], [Position], [NameSchool], [CreateBy], [CreateTime], [TagSkill], [CompanyID]) VALUES (N'114786340536358590843', NULL, N'114786340536358590843', NULL, N'Vlog Bụi Đường', N'https://lh5.googleusercontent.com/-IoBqodEGQ9A/AAAAAAAAAAI/AAAAAAAAAA0/dSWIASMXchs/photo.jpg?sz=300', NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-10-30 22:15:54.937' AS DateTime), NULL, NULL)
INSERT [dbo].[Users] ([UserID], [FacebookID], [GoogleID], [Password], [FullName], [Avatar], [Mobi], [Email], [Facebook], [Address], [Status], [StatusJob], [PositionWork], [GraduationYear], [Position], [NameSchool], [CreateBy], [CreateTime], [TagSkill], [CompanyID]) VALUES (N'836659226521881', N'836659226521881', NULL, NULL, N'Nguyễn.Hôk Sơn', N'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=836659226521881&height=250&width=250&ext=1542899001&hash=AeSpS9uyt3pNHp1J', N'01648539913', N'ngocson9556@gmail.com', N'https://www.facebook.com/ngocsonit195', N'Bình Dương', 1, 0, NULL, 2019, 0, N'Đại học Kinh Tế- Kỹ Thuật Bình Dương', NULL, CAST(N'2018-10-28 00:47:27.477' AS DateTime), N'2', NULL)
INSERT [dbo].[Users] ([UserID], [FacebookID], [GoogleID], [Password], [FullName], [Avatar], [Mobi], [Email], [Facebook], [Address], [Status], [StatusJob], [PositionWork], [GraduationYear], [Position], [NameSchool], [CreateBy], [CreateTime], [TagSkill], [CompanyID]) VALUES (N'betusy', NULL, NULL, N'19791B16536DA96B6C2C162EF37002F9F0699CE06FE964A6F759AC75C9A8AAC2', N'Sỹ BETU', N'~/fileuploads/Dev/Avatar/67d5d04a856c4db3b262a87df522c10f.jpg', N'', N'sybetu@gmail.com', N'https://www.facebook.com/sy.betu', N'Bình Dương', 1, 0, N'Lập trình viên', 2019, 1, N'Đại học Kinh Tế- Kỹ Thuật Bình Dương', N'admin', CAST(N'2018-10-08 16:53:16.157' AS DateTime), N'1;3', 1)
INSERT [dbo].[Users] ([UserID], [FacebookID], [GoogleID], [Password], [FullName], [Avatar], [Mobi], [Email], [Facebook], [Address], [Status], [StatusJob], [PositionWork], [GraduationYear], [Position], [NameSchool], [CreateBy], [CreateTime], [TagSkill], [CompanyID]) VALUES (N'mrhieuit', NULL, NULL, N'19791B16536DA96B6C2C162EF37002F9F0699CE06FE964A6F759AC75C9A8AAC2', N'Lê Minh Hiếu', N'~/fileuploads/Dev/Avatar/3121f080514f46bda54131ad6ecae265.jpg', N'0979876003', N'mrhieuit@gmail.com', N'https://www.facebook.com/mrhieuit', N'Bình Dương', 1, 0, N'FullStack', 2000, 1, N'Đại học Kinh Tế- Kỹ Thuật Bình Dương', N'admin', CAST(N'2018-10-08 16:53:16.157' AS DateTime), N'2;3', 7)
INSERT [dbo].[Users] ([UserID], [FacebookID], [GoogleID], [Password], [FullName], [Avatar], [Mobi], [Email], [Facebook], [Address], [Status], [StatusJob], [PositionWork], [GraduationYear], [Position], [NameSchool], [CreateBy], [CreateTime], [TagSkill], [CompanyID]) VALUES (N'ngocsonit', NULL, NULL, N'19791B16536DA96B6C2C162EF37002F9F0699CE06FE964A6F759AC75C9A8AAC2', N'Nguyễn Ngọc Sơn', N'~/fileuploads/Dev/Avatar/143f712b42a8474495e475fe4b7c3af0.jpg', N'0348539913', N'ngocson9556@gmail.com', N'https://www.facebook.com/ngocsonit195', N'Ninh Thuận - Bình Dương', 1, 0, N'Dev', 2019, 1, N'Đại học Kinh Tế- Kỹ Thuật Bình Dương', N'admin', CAST(N'2018-10-28 02:04:26.490' AS DateTime), N'1;2', NULL)
INSERT [dbo].[Users] ([UserID], [FacebookID], [GoogleID], [Password], [FullName], [Avatar], [Mobi], [Email], [Facebook], [Address], [Status], [StatusJob], [PositionWork], [GraduationYear], [Position], [NameSchool], [CreateBy], [CreateTime], [TagSkill], [CompanyID]) VALUES (N'quynhnhu', NULL, NULL, N'8076AF8D2C4D91703732CD29D6E7EC6275994E84A71492715337CD8F22539111', N'Nguyễn Thị Quỳnh', N'~/fileuploads/Dev/Avatar/dca7ab6dc6dc41e19ca8218192f68825.jpg', N'0123456789', N'quynhnhu@gmail.com', N'Fb.com/quyenh', N'Bình Phước sadsads', 0, 1, N'Bán hàng', 2018, 0, N'Bách khoa TPHCM', NULL, CAST(N'2018-10-16 22:34:38.837' AS DateTime), N'1;3', 16)
INSERT [dbo].[Users] ([UserID], [FacebookID], [GoogleID], [Password], [FullName], [Avatar], [Mobi], [Email], [Facebook], [Address], [Status], [StatusJob], [PositionWork], [GraduationYear], [Position], [NameSchool], [CreateBy], [CreateTime], [TagSkill], [CompanyID]) VALUES (N'thanhit', NULL, NULL, N'19791B16536DA96B6C2C162EF37002F9F0699CE06FE964A6F759AC75C9A8AAC2', N'Đỗ Văn Thạnh', N'~/fileuploads/Dev/Avatar/37eb48eb5ef646d8a47f54beee8ebb04.jpg', N'0965766370', N'mrthanhit996@gmail.com', N'https://www.facebook.com/mrthanhit996', N'TP-HCM', 0, 1, N'Lập trình viên', 2018, 0, N'Đại học Kinh Tế- Kỹ Thuật Bình Dương', NULL, CAST(N'2018-10-08 16:50:35.943' AS DateTime), N'1;2;3', 1)
INSERT [dbo].[Users] ([UserID], [FacebookID], [GoogleID], [Password], [FullName], [Avatar], [Mobi], [Email], [Facebook], [Address], [Status], [StatusJob], [PositionWork], [GraduationYear], [Position], [NameSchool], [CreateBy], [CreateTime], [TagSkill], [CompanyID]) VALUES (N'vanquyen', NULL, NULL, N'19791B16536DA96B6C2C162EF37002F9F0699CE06FE964A6F759AC75C9A8AAC2', N'Quyền', NULL, N'0972332803', N'quyen@gmail.com', N'fb.com/QuyenIT', N'BD', 1, 1, N'Dev', 2019, 0, N'Đại học Kinh Tế- Kỹ Thuật Bình Dương', NULL, CAST(N'2018-10-15 09:29:02.063' AS DateTime), N'1', 1)
INSERT [dbo].[Users] ([UserID], [FacebookID], [GoogleID], [Password], [FullName], [Avatar], [Mobi], [Email], [Facebook], [Address], [Status], [StatusJob], [PositionWork], [GraduationYear], [Position], [NameSchool], [CreateBy], [CreateTime], [TagSkill], [CompanyID]) VALUES (N'vanquyenktktbd', NULL, NULL, N'19791B16536DA96B6C2C162EF37002F9F0699CE06FE964A6F759AC75C9A8AAC2', N'Văn Quyền', N'~/fileuploads/Dev/Avatar/1d7dfc0a28d147b5b6d69d948d53f2a5.jpg', N'0972332803', N'vanquyenktktbd@gmail.cm', N'fb.com/QuyenIT', N'Bình Phước', 1, 1, N'Lập trình viên', 2019, 1, N'Đại học Kinh Tế- Kỹ Thuật Bình Dương', N'admin', CAST(N'2018-10-14 09:45:37.167' AS DateTime), N'1;2;3', NULL)
ALTER TABLE [dbo].[Opinion]  WITH CHECK ADD  CONSTRAINT [FK_Opinion_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Opinion] CHECK CONSTRAINT [FK_Opinion_Users]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_Users] FOREIGN KEY([ReportedUser])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_Users]
GO
ALTER TABLE [dbo].[Skill]  WITH CHECK ADD  CONSTRAINT [FK_Skill_Admin] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Admin] ([Username])
GO
ALTER TABLE [dbo].[Skill] CHECK CONSTRAINT [FK_Skill_Admin]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Admin] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Admin] ([Username])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Admin]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Company]
GO
