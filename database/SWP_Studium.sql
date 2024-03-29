USE [master]
GO
/****** Object:  Database [Studium]    Script Date: 1/20/2024 9:32:54 AM ******/
CREATE DATABASE [Studium]
GO
ALTER DATABASE [Studium] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Studium].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Studium] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Studium] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Studium] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Studium] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Studium] SET ARITHABORT OFF 
GO
ALTER DATABASE [Studium] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Studium] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Studium] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Studium] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Studium] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Studium] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Studium] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Studium] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Studium] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Studium] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Studium] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Studium] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Studium] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Studium] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Studium] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Studium] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Studium] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Studium] SET RECOVERY FULL 
GO
ALTER DATABASE [Studium] SET  MULTI_USER 
GO
ALTER DATABASE [Studium] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Studium] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Studium] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Studium] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Studium] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Studium] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Studium', N'ON'
GO
ALTER DATABASE [Studium] SET QUERY_STORE = ON
GO
ALTER DATABASE [Studium] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Studium]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 1/20/2024 9:32:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](30) NOT NULL,
	[HashedPassword] [char](64) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Phone] [char](11) NOT NULL,
	[Email] [nvarchar](30) NULL,
	[DateOfBirth] [date] NULL,
	[Gender] [bit] NULL,
	[UserType] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 1/20/2024 9:32:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[TutorID] [char](10) NULL,
	[ParentID] [int] NULL,
	[TutorGender] [tinyint] NOT NULL,
	[PayPerSession] [decimal](12, 3) NOT NULL,
	[SesPerWeek] [tinyint] NULL,
	[OpenDate] [date] NULL,
	[ClassDescription] [nvarchar](255) NULL,
	[ClassStatus] [tinyint] NULL,
	[LocationID] [int] NULL,
	[LocationDetail] [nvarchar](60) NULL,
	[SubjectID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 1/20/2024 9:32:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 1/20/2024 9:32:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[SubjectID] [int] IDENTITY(1,1) NOT NULL,
	[SubjectName] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tutor]    Script Date: 1/20/2024 9:32:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tutor](
	[TutorID] [int] NOT NULL,
	[School] [nvarchar](30) NOT NULL,
	[Major] [nvarchar](30) NOT NULL,
	[GraduationYear] [nvarchar](16) NOT NULL,
	[Introduction] [nvarchar](255) NOT NULL,
	[EducationLevel] [tinyint] NULL,
	[ProfilePic] [varchar](500) NULL,
	[IDCardPic1] [varchar](500) NULL,
	[IDCardPic2] [varchar](500) NULL,
	[TutorStatus] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[TutorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tutor_Location]    Script Date: 1/20/2024 9:32:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tutor_Location](
	[TutorID] [int] NOT NULL,
	[LocationID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TutorID] ASC,
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tutor_Subject]    Script Date: 1/20/2024 9:32:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tutor_Subject](
	[TutorID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TutorID] ASC,
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountID], [UserName], [HashedPassword], [Name], [Phone], [Email], [DateOfBirth], [Gender], [UserType]) VALUES (2, N'admin1', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'Phan Đức Vượng', N'123456789  ', N'vuong123@gmail.com', CAST(N'2002-06-19' AS Date), 1, 1)
INSERT [dbo].[Account] ([AccountID], [UserName], [HashedPassword], [Name], [Phone], [Email], [DateOfBirth], [Gender], [UserType]) VALUES (3, N'admin2', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'Hùng Phạm', N'1234567890 ', N'Hung123@gmail.com', CAST(N'2003-05-29' AS Date), 1, 1)
INSERT [dbo].[Account] ([AccountID], [UserName], [HashedPassword], [Name], [Phone], [Email], [DateOfBirth], [Gender], [UserType]) VALUES (4, N'admin3', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'Admin', N'0987654321 ', N'admin123@gmail.com', CAST(N'2003-06-10' AS Date), 1, 1)
INSERT [dbo].[Account] ([AccountID], [UserName], [HashedPassword], [Name], [Phone], [Email], [DateOfBirth], [Gender], [UserType]) VALUES (5, N'PhuongQuynh123', N'3a5fb5a6b1e6f2078df3450e0b9575a0590a9d52cf7cf66bfe98a28fa6a4f015', N'Trần Thị Phương Quỳnh', N'0312345678 ', N'PhuongQuynh0203@gmail.com', CAST(N'2004-02-02' AS Date), 0, 2)
INSERT [dbo].[Account] ([AccountID], [UserName], [HashedPassword], [Name], [Phone], [Email], [DateOfBirth], [Gender], [UserType]) VALUES (6, N'Huyen123', N'6daa8f24e6e6574e6aebf5846881d2a94ed32a4b7ef2e682142de4e85bb5a78e', N'Huyền Ngọc', N'13243546578', N'Huyen123@gmail.com', CAST(N'2003-11-20' AS Date), 0, 2)
INSERT [dbo].[Account] ([AccountID], [UserName], [HashedPassword], [Name], [Phone], [Email], [DateOfBirth], [Gender], [UserType]) VALUES (7, N'lamhoang9911', N'bf58ed71330992a364b948d21aa4df49b8074896398de59e1c7d100666cab312', N'Lăng Hoàng Lâm', N'9786343123 ', N'lamhoang9911@gmail.com', CAST(N'2003-08-15' AS Date), 1, 2)
INSERT [dbo].[Account] ([AccountID], [UserName], [HashedPassword], [Name], [Phone], [Email], [DateOfBirth], [Gender], [UserType]) VALUES (8, N'congthanh123', N'a216ed0ee6b0272c1333fc9d64b9c2e64a1563c1b73bbb71211f6c6db28b681b', N'Phạm Công Thành', N'1231841987 ', N'congthanh2002@gmail.com', CAST(N'2002-12-27' AS Date), 1, 2)
INSERT [dbo].[Account] ([AccountID], [UserName], [HashedPassword], [Name], [Phone], [Email], [DateOfBirth], [Gender], [UserType]) VALUES (12, N'hungduong987', N'c8de39d432916d76531c1114b51552433606e182e5e2dc1400d562ae4a1b76ad', N'Lê Trần Hùng Dương', N'1919292939 ', N'hungduong987@gmail.com', CAST(N'1999-10-02' AS Date), 1, 2)
INSERT [dbo].[Account] ([AccountID], [UserName], [HashedPassword], [Name], [Phone], [Email], [DateOfBirth], [Gender], [UserType]) VALUES (13, N'locnguyen1123', N'8ae0e8ea4945c766052374a7f6c8cdca71bd648fcd648c77ed69ca89dd5d8ba8', N'Nguyễn Hữu Lọc', N'1919191923 ', N'locnguyen123@gmail.com', CAST(N'2005-03-12' AS Date), 1, 2)
INSERT [dbo].[Account] ([AccountID], [UserName], [HashedPassword], [Name], [Phone], [Email], [DateOfBirth], [Gender], [UserType]) VALUES (14, N'ngocsuong1981', N'1dfe03fb7931cfcd68a3bb1b22c19fca78b5ae13ba8727d12e5d7232205e01d ', N'Đỗ Ngọc Sương', N'198112345  ', N'ngocsuong1981@gmail.com', CAST(N'2000-02-09' AS Date), 0, 2)
INSERT [dbo].[Account] ([AccountID], [UserName], [HashedPassword], [Name], [Phone], [Email], [DateOfBirth], [Gender], [UserType]) VALUES (15, N'han1999', N'e0210691515d899d147c7d5a66f3514017ac06b5ad61bf767a18f3423e43858 ', N'Ngọc Hân', N'199988812  ', N'ngochan1999@gmail.com', CAST(N'2001-04-28' AS Date), 0, 2)
INSERT [dbo].[Account] ([AccountID], [UserName], [HashedPassword], [Name], [Phone], [Email], [DateOfBirth], [Gender], [UserType]) VALUES (16, N'kiman2001', N'f3bf770bc084e09f842dfc3b21d2ac7d3c2c174b5b7301d3093dbe93ceaa35b8', N'Nguyễn Kim An', N'2001100212 ', N'kiman2001@gmail.com', CAST(N'2001-12-05' AS Date), 0, 2)
INSERT [dbo].[Account] ([AccountID], [UserName], [HashedPassword], [Name], [Phone], [Email], [DateOfBirth], [Gender], [UserType]) VALUES (17, N'thanhphuong2003', N'7df3d47573af43bee339d1bd4cd84a322af0206cbca6383c2bf306359768e1ad', N'Vũ Thanh Phương', N'20032001200', N'thanhphuong2003@gmail.com', CAST(N'2003-08-08' AS Date), 0, 2)
INSERT [dbo].[Account] ([AccountID], [UserName], [HashedPassword], [Name], [Phone], [Email], [DateOfBirth], [Gender], [UserType]) VALUES (18, N'hongnhi97', N'511885068a6105c18f280a52b9a2fea0714239efe6a488f4c6b56dfbf7b9431c', N'Lê Hồng Nhi', N'9786343232 ', N'hongnhi97@gmail.com', CAST(N'2000-08-28' AS Date), 0, 2)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (1, N'Quận Ba Đình')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (2, N'Quận Cầu Giấy')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (3, N'Quận Hoàn Kiếm')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (4, N'Quận Hai Bà Trưng')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (5, N'Quận Hoàng Mai')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (6, N'Quận Đống Đa')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (7, N'Quận Tây Hồ')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (8, N'Quận Thanh Xuân')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (9, N'Quận Bắc Từ Liêm')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (10, N'Quận Hà Đông')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (11, N'Quận Long Biên')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (12, N'Quận Nam Từ Liêm')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (13, N'Huyện Ba Vì')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (14, N'Huyện Chương Mỹ')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (15, N'Huyện Đan Phượng')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (16, N'Huyện Đông Anh')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (17, N'Huyện Gia Lâm')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (18, N'Huyện Hoài Đức')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (19, N'Huyện Mê Linh')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (20, N'Huyện Mỹ Đức')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (21, N'Huyện Phú Xuyên')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (22, N'Huyện Quốc Oai')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (23, N'Huyện Sóc Sơn')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (24, N'Huyện Thạch Thất')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (25, N'Huyện Thanh Oai')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (26, N'Huyện Thanh Trì')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (27, N'Huyện Thường Tín')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (28, N'Huyện Ứng Hòa')
INSERT [dbo].[Location] ([LocationID], [LocationName]) VALUES (29, N'Thị xã Sơn Tây')
SET IDENTITY_INSERT [dbo].[Location] OFF
GO
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (1, N'Toán tiểu học')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (2, N'Toán trung học cơ sở')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (3, N'Toán 10')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (4, N'Toán 11')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (5, N'Toán 12')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (6, N'Ngữ Văn trung học cơ sở')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (7, N'Tiếng Việt tiểu học')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (8, N'Ngữ Văn 10')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (9, N'Ngữ Văn 11')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (10, N'Ngữ Văn 12')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (11, N'Hóa lớp 8')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (12, N'Hóa lớp 9')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (13, N'Hóa lớp 10')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (14, N'Hóa lớp 11')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (15, N'Hóa lớp 12')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (16, N'Tin học tiểu học')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (17, N'Tin học trung học cơ sở')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (18, N'Tin học trung học phổ thông')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (19, N'Lý trung học cơ sở')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (20, N'Lý lớp 10')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (21, N'Lý lớp 11')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (22, N'Lý lớp 12')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (23, N'Tiếng Anh tiểu học')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (24, N'Tiếng Anh trung học phổ cơ sở')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (25, N'Tiếng Anh trung học phổ thông')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (26, N'Tiếng Anh luyện thi IELTS')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (27, N'Tiếng Anh luyện thi TOEIC')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (28, N'Đàn Piano')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (29, N'Đàn Guitar')
SET IDENTITY_INSERT [dbo].[Subject] OFF
GO
INSERT [dbo].[Tutor] ([TutorID], [School], [Major], [GraduationYear], [Introduction], [EducationLevel], [ProfilePic], [IDCardPic1], [IDCardPic2], [TutorStatus]) VALUES (5, N'Đại Học Ngoại Thương', N'Kinh Tế', N'2025', N'Đã có kinh nghiệm dạy 2 lớp trong đó có toán- tiếng việt lớp 3 và văn lớp 6. Trợ giảng 1 lớp ôn thi đại học môn văn 12', 1, N'Tutor-1.jpg', NULL, NULL, 1)
INSERT [dbo].[Tutor] ([TutorID], [School], [Major], [GraduationYear], [Introduction], [EducationLevel], [ProfilePic], [IDCardPic1], [IDCardPic2], [TutorStatus]) VALUES (6, N'Học Viện Nông Nghiệp', N'Công nghệ sinh học', N'2025', N'Đã có kinh nghiệm dạy 2 lớp trong đó có toán- tiếng việt lớp 3 và văn lớp 6. Trợ giảng 1 lớp ôn thi đại học môn văn 12', 1, N'Tutor-2.jpg', NULL, NULL, 1)
INSERT [dbo].[Tutor] ([TutorID], [School], [Major], [GraduationYear], [Introduction], [EducationLevel], [ProfilePic], [IDCardPic1], [IDCardPic2], [TutorStatus]) VALUES (7, N'Học Viện Tài Chính', N'Quản trị kinh doanh', N'2025', N'Đã có kinh nghiệm dạy 2 lớp trong đó có toán- tiếng việt lớp 3 và văn lớp 6. Trợ giảng 1 lớp ôn thi đại học môn văn 12', 1, N'Tutor-3.jpg', NULL, NULL, 1)
INSERT [dbo].[Tutor] ([TutorID], [School], [Major], [GraduationYear], [Introduction], [EducationLevel], [ProfilePic], [IDCardPic1], [IDCardPic2], [TutorStatus]) VALUES (8, N'Học Viện Tài Chính', N'Quản trị kinh doanh', N'2025', N'Đã có kinh nghiệm dạy 2 lớp trong đó có toán- tiếng việt lớp 3 và văn lớp 6. Trợ giảng 1 lớp ôn thi đại học môn văn 12', 1, N'Tutor-4.jpg', NULL, NULL, 1)
INSERT [dbo].[Tutor] ([TutorID], [School], [Major], [GraduationYear], [Introduction], [EducationLevel], [ProfilePic], [IDCardPic1], [IDCardPic2], [TutorStatus]) VALUES (12, N'Đại Học FPT', N'Ngôn ngữ Anh', N'2024', N'Đã có kinh nghiệm dạy tiếng anh IELTS', 1, N'Tutor-5.jpg', NULL, NULL, 1)
INSERT [dbo].[Tutor] ([TutorID], [School], [Major], [GraduationYear], [Introduction], [EducationLevel], [ProfilePic], [IDCardPic1], [IDCardPic2], [TutorStatus]) VALUES (13, N'Học Viện Tài Chính', N'Quản trị kinh doanh', N'2025', N'Đã có kinh nghiệm dạy 2 lớp trong đó có toán- tiếng việt lớp 3 và văn lớp 6. Trợ giảng 1 lớp ôn thi đại học môn văn 12', 1, N'Tutor-6.jpg', NULL, NULL, 1)
INSERT [dbo].[Tutor] ([TutorID], [School], [Major], [GraduationYear], [Introduction], [EducationLevel], [ProfilePic], [IDCardPic1], [IDCardPic2], [TutorStatus]) VALUES (14, N'Học Viện Tài Chính', N'Quản trị kinh doanh', N'2025', N'Đã có kinh nghiệm dạy 2 lớp trong đó có toán- tiếng việt lớp 3 và văn lớp 6. Trợ giảng 1 lớp ôn thi đại học môn văn 12', 1, N'Tutor-7.jpg', NULL, NULL, 1)
INSERT [dbo].[Tutor] ([TutorID], [School], [Major], [GraduationYear], [Introduction], [EducationLevel], [ProfilePic], [IDCardPic1], [IDCardPic2], [TutorStatus]) VALUES (15, N'Học Viện Tài Chính', N'Quản trị kinh doanh', N'2025', N'Đã có kinh nghiệm dạy 2 lớp trong đó có toán- tiếng việt lớp 3 và văn lớp 6. Trợ giảng 1 lớp ôn thi đại học môn văn 12', 1, N'Tutor-8.jpg', NULL, NULL, 1)
INSERT [dbo].[Tutor] ([TutorID], [School], [Major], [GraduationYear], [Introduction], [EducationLevel], [ProfilePic], [IDCardPic1], [IDCardPic2], [TutorStatus]) VALUES (16, N'Đại Học Bách Khoa', N'Quản trị kinh doanh', N'2026', N'Đã có kinh nghiệm dạy Công nghệ thông tin', 1, N'Tutor-9.jpg', NULL, NULL, 1)
INSERT [dbo].[Tutor] ([TutorID], [School], [Major], [GraduationYear], [Introduction], [EducationLevel], [ProfilePic], [IDCardPic1], [IDCardPic2], [TutorStatus]) VALUES (17, N'Học Viện Tài Chính', N'Quản trị kinh doanh', N'2025', N'Đã có kinh nghiệm dạy 2 lớp trong đó có toán- tiếng việt lớp 3 và văn lớp 6. Trợ giảng 1 lớp ôn thi đại học môn văn 12', 1, N'Tutor-10.jpg', NULL, NULL, 1)
INSERT [dbo].[Tutor] ([TutorID], [School], [Major], [GraduationYear], [Introduction], [EducationLevel], [ProfilePic], [IDCardPic1], [IDCardPic2], [TutorStatus]) VALUES (18, N'Học Viện Tài Chính', N'Quản trị kinh doanh', N'2025', N'Đã có kinh nghiệm dạy 2 lớp trong đó có toán- tiếng việt lớp 3 và văn lớp 6. Trợ giảng 1 lớp ôn thi đại học môn văn 12', 1, N'Tutor-11.jpg', NULL, NULL, 1)
GO
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (5, 1)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (5, 2)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (6, 3)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (6, 4)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (7, 5)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (7, 6)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (8, 1)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (8, 2)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (12, 7)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (13, 7)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (14, 7)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (15, 7)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (16, 8)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (16, 9)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (17, 2)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (17, 3)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (18, 11)
INSERT [dbo].[Tutor_Location] ([TutorID], [LocationID]) VALUES (18, 12)
GO
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (5, 1)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (5, 2)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (6, 3)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (6, 4)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (7, 5)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (7, 6)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (8, 1)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (8, 2)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (12, 7)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (13, 7)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (14, 7)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (15, 7)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (16, 8)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (16, 9)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (17, 2)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (17, 3)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (18, 11)
INSERT [dbo].[Tutor_Subject] ([TutorID], [SubjectID]) VALUES (18, 12)
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD FOREIGN KEY([LocationID])
REFERENCES [dbo].[Location] ([LocationID])
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD FOREIGN KEY([ParentID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subject] ([SubjectID])
GO
ALTER TABLE [dbo].[Tutor]  WITH CHECK ADD FOREIGN KEY([TutorID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Tutor_Location]  WITH CHECK ADD FOREIGN KEY([LocationID])
REFERENCES [dbo].[Location] ([LocationID])
GO
ALTER TABLE [dbo].[Tutor_Location]  WITH CHECK ADD FOREIGN KEY([TutorID])
REFERENCES [dbo].[Tutor] ([TutorID])
GO
ALTER TABLE [dbo].[Tutor_Subject]  WITH CHECK ADD FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subject] ([SubjectID])
GO
ALTER TABLE [dbo].[Tutor_Subject]  WITH CHECK ADD FOREIGN KEY([TutorID])
REFERENCES [dbo].[Tutor] ([TutorID])
GO
USE [master]
GO
ALTER DATABASE [Studium] SET  READ_WRITE 
GO
