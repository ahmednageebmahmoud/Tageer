USE [master]
GO
/****** Object:  Database [Rental]    Script Date: 12/27/2017 8:31:49 PM ******/
CREATE DATABASE [Rental]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Rental', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SEZER\MSSQL\DATA\Rental.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Rental_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SEZER\MSSQL\DATA\Rental_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Rental] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Rental].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Rental] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Rental] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Rental] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Rental] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Rental] SET ARITHABORT OFF 
GO
ALTER DATABASE [Rental] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Rental] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Rental] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Rental] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Rental] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Rental] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Rental] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Rental] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Rental] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Rental] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Rental] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Rental] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Rental] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Rental] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Rental] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Rental] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Rental] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Rental] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Rental] SET  MULTI_USER 
GO
ALTER DATABASE [Rental] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Rental] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Rental] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Rental] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Rental] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Rental]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 12/27/2017 8:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Street] [nvarchar](500) NOT NULL,
	[PostlCode] [int] NULL,
	[FKCountryId] [int] NOT NULL,
	[FKCityId] [int] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[City]    Script Date: 12/27/2017 8:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
	[FkCountryId] [int] NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 12/27/2017 8:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Date]    Script Date: 12/27/2017 8:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Date](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BeforeCurrentYear] [int] NOT NULL,
	[AfterCurrentYear] [int] NOT NULL,
	[FKDateTypeId] [int] NOT NULL,
	[IsDefult] [bit] NOT NULL,
 CONSTRAINT [PK_Date] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DateType]    Script Date: 12/27/2017 8:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DateType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DateType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gender]    Script Date: 12/27/2017 8:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](15) NOT NULL,
	[NameEn] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Images]    Script Date: 12/27/2017 8:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 12/27/2017 8:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Jops] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Month]    Script Date: 12/27/2017 8:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Month](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](50) NOT NULL,
	[NameEn] [nvarchar](50) NOT NULL,
	[ShortName] [nvarchar](6) NOT NULL,
	[FKDateTypeId] [int] NOT NULL,
	[MonthIndex] [int] NOT NULL,
 CONSTRAINT [PK_Month] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 12/27/2017 8:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Notes] [nvarchar](500) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SocialStatus]    Script Date: 12/27/2017 8:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SocialStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameAr] [nvarchar](15) NOT NULL,
	[NameEn] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_SocialStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserData]    Script Date: 12/27/2017 8:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserData](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FristName] [nvarchar](20) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[NationalId] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](15) NULL,
	[Phone2] [nvarchar](15) NULL,
	[BirthDate] [date] NULL,
	[FKImageId] [int] NOT NULL,
	[FkAddressId] [int] NULL,
	[FkGenderId] [int] NOT NULL,
	[FkSocialStatusId] [int] NOT NULL,
	[FKJobId] [int] NOT NULL,
 CONSTRAINT [PK_UaserData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 12/27/2017 8:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKUserId] [int] NOT NULL,
	[IsSuccess] [bit] NOT NULL,
	[IsBlock] [bit] NOT NULL CONSTRAINT [DF_UserLogin_IsBlock]  DEFAULT ((0)),
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_UserLogin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 12/27/2017 8:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKUserId] [int] NOT NULL,
	[FKRoleId] [int] NOT NULL,
	[Notes] [nvarchar](500) NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/27/2017 8:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FkUserId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([Id], [Street], [PostlCode], [FKCountryId], [FKCityId]) VALUES (1, N'sssssssssssssssss', NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[Address] OFF
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([Id], [NameAr], [NameEn], [FkCountryId]) VALUES (0, N'المنصورة', N'Mansoura', 1)
INSERT [dbo].[City] ([Id], [NameAr], [NameEn], [FkCountryId]) VALUES (2, N'ssss', N'sssssssssssss', 10)
INSERT [dbo].[City] ([Id], [NameAr], [NameEn], [FkCountryId]) VALUES (3, N'ddddd', N'dddddddddddddddd', 12)
INSERT [dbo].[City] ([Id], [NameAr], [NameEn], [FkCountryId]) VALUES (5, N'الجيزة', N'Giza', 1)
INSERT [dbo].[City] ([Id], [NameAr], [NameEn], [FkCountryId]) VALUES (6, N'القاهرة', N'Cairo', 1)
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([Id], [NameAr], [NameEn]) VALUES (1, N'مصر', N'Egypt')
INSERT [dbo].[Country] ([Id], [NameAr], [NameEn]) VALUES (2, N'لبيا', N'lypia')
INSERT [dbo].[Country] ([Id], [NameAr], [NameEn]) VALUES (9, N'fd', N'fdfdfdf')
INSERT [dbo].[Country] ([Id], [NameAr], [NameEn]) VALUES (10, N'fd', N'fdfdfdf')
INSERT [dbo].[Country] ([Id], [NameAr], [NameEn]) VALUES (11, N'sssssss', N'sssssssss')
INSERT [dbo].[Country] ([Id], [NameAr], [NameEn]) VALUES (12, N'ssss', N'ssssssssssssss')
SET IDENTITY_INSERT [dbo].[Country] OFF
SET IDENTITY_INSERT [dbo].[DateType] ON 

INSERT [dbo].[DateType] ([Id], [NameAr], [NameEn]) VALUES (1, N'ميلادى', N'Melady')
INSERT [dbo].[DateType] ([Id], [NameAr], [NameEn]) VALUES (2, N'هجرى', N'Hegrey')
SET IDENTITY_INSERT [dbo].[DateType] OFF
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([Id], [NameAr], [NameEn]) VALUES (1, N'ذكر', N'Male')
INSERT [dbo].[Gender] ([Id], [NameAr], [NameEn]) VALUES (2, N'انثى', N'Female ')
SET IDENTITY_INSERT [dbo].[Gender] OFF
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([Id], [ImageUrl]) VALUES (1, N'/Files/Images/Users/Profile/userDefult.jpg')
SET IDENTITY_INSERT [dbo].[Images] OFF
SET IDENTITY_INSERT [dbo].[Jobs] ON 

INSERT [dbo].[Jobs] ([Id], [NameAr], [NameEn]) VALUES (1, N'مطور', N'DEVELOPER')
INSERT [dbo].[Jobs] ([Id], [NameAr], [NameEn]) VALUES (4, N'مراقب', N'moraqp')
INSERT [dbo].[Jobs] ([Id], [NameAr], [NameEn]) VALUES (5, N'مسوق', N'markting')
INSERT [dbo].[Jobs] ([Id], [NameAr], [NameEn]) VALUES (6, N'مدير', N'manger')
SET IDENTITY_INSERT [dbo].[Jobs] OFF
SET IDENTITY_INSERT [dbo].[Month] ON 

INSERT [dbo].[Month] ([Id], [NameAr], [NameEn], [ShortName], [FKDateTypeId], [MonthIndex]) VALUES (2, N'dkh', N'dkh', N'sas', 1, 1)
INSERT [dbo].[Month] ([Id], [NameAr], [NameEn], [ShortName], [FKDateTypeId], [MonthIndex]) VALUES (3, N'223', N'32323', N'2323', 1, 2)
INSERT [dbo].[Month] ([Id], [NameAr], [NameEn], [ShortName], [FKDateTypeId], [MonthIndex]) VALUES (4, N'sdsd', N'sdsd', N'sdd', 1, 6)
INSERT [dbo].[Month] ([Id], [NameAr], [NameEn], [ShortName], [FKDateTypeId], [MonthIndex]) VALUES (5, N'hghgh', N'ghgh', N'sas', 1, 6)
INSERT [dbo].[Month] ([Id], [NameAr], [NameEn], [ShortName], [FKDateTypeId], [MonthIndex]) VALUES (6, N'dfdf', N'dfdf', N'222', 1, 2)
INSERT [dbo].[Month] ([Id], [NameAr], [NameEn], [ShortName], [FKDateTypeId], [MonthIndex]) VALUES (7, N'dfdfdf', N'fff', N'222', 1, 2)
INSERT [dbo].[Month] ([Id], [NameAr], [NameEn], [ShortName], [FKDateTypeId], [MonthIndex]) VALUES (8, N'a', N'sasas', N'as', 1, 6)
INSERT [dbo].[Month] ([Id], [NameAr], [NameEn], [ShortName], [FKDateTypeId], [MonthIndex]) VALUES (9, N'sedsds', N'dsd', N'sd', 1, 6)
INSERT [dbo].[Month] ([Id], [NameAr], [NameEn], [ShortName], [FKDateTypeId], [MonthIndex]) VALUES (10, N'qwwwwwwwww', N'wwwwwwwwwwwwwwww', N'g', 1, 6)
INSERT [dbo].[Month] ([Id], [NameAr], [NameEn], [ShortName], [FKDateTypeId], [MonthIndex]) VALUES (11, N'sds', N'dsdsd', N'sdsd', 1, 4)
SET IDENTITY_INSERT [dbo].[Month] OFF
SET IDENTITY_INSERT [dbo].[SocialStatus] ON 

INSERT [dbo].[SocialStatus] ([Id], [NameAr], [NameEn]) VALUES (1, N'متزوج', N'Married ')
INSERT [dbo].[SocialStatus] ([Id], [NameAr], [NameEn]) VALUES (2, N'اعزب', N'Single ')
INSERT [dbo].[SocialStatus] ([Id], [NameAr], [NameEn]) VALUES (3, N'ارمل', N'Widow ')
SET IDENTITY_INSERT [dbo].[SocialStatus] OFF
SET IDENTITY_INSERT [dbo].[UserData] ON 

INSERT [dbo].[UserData] ([Id], [FristName], [MiddleName], [LastName], [NationalId], [Phone], [Phone2], [BirthDate], [FKImageId], [FkAddressId], [FkGenderId], [FkSocialStatusId], [FKJobId]) VALUES (1, N'dsdsd', N'ahm', N'dssd', N'1212', NULL, NULL, NULL, 1, 1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[UserData] OFF
SET IDENTITY_INSERT [dbo].[UserLogin] ON 

INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (1, 1, 1, 0, CAST(N'2017-12-21 12:17:08.433' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (2, 1, 1, 0, CAST(N'2017-12-21 12:49:35.433' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (3, 1, 1, 0, CAST(N'2017-12-21 12:50:57.300' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (4, 1, 1, 0, CAST(N'2017-12-21 12:52:31.693' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (5, 1, 1, 0, CAST(N'2017-12-21 12:54:01.490' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (6, 1, 1, 0, CAST(N'2017-12-21 12:56:48.677' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (7, 1, 1, 0, CAST(N'2017-12-21 12:58:35.840' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (8, 1, 1, 0, CAST(N'2017-12-21 13:01:04.233' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (9, 1, 1, 0, CAST(N'2017-12-21 13:04:59.193' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (10, 1, 1, 0, CAST(N'2017-12-21 13:05:15.620' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (11, 1, 1, 0, CAST(N'2017-12-21 13:11:47.343' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (12, 1, 1, 0, CAST(N'2017-12-21 13:12:48.900' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (13, 1, 1, 0, CAST(N'2017-12-21 13:14:58.583' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (14, 1, 1, 0, CAST(N'2017-12-21 14:10:05.670' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (15, 1, 1, 0, CAST(N'2017-12-21 14:10:33.567' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (16, 1, 1, 0, CAST(N'2017-12-21 14:12:15.920' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (17, 1, 1, 0, CAST(N'2017-12-21 14:13:30.347' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (18, 1, 1, 0, CAST(N'2017-12-21 14:18:11.707' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (19, 1, 1, 0, CAST(N'2017-12-21 14:21:33.313' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (20, 1, 1, 0, CAST(N'2017-12-21 14:23:42.463' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (21, 1, 1, 0, CAST(N'2017-12-21 14:27:20.343' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (22, 1, 1, 0, CAST(N'2017-12-21 14:30:22.680' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (23, 1, 1, 0, CAST(N'2017-12-21 14:31:49.277' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (24, 1, 1, 0, CAST(N'2017-12-21 14:40:44.450' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (25, 1, 1, 0, CAST(N'2017-12-21 14:41:23.433' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (26, 1, 1, 0, CAST(N'2017-12-21 14:42:23.123' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (27, 1, 1, 0, CAST(N'2017-12-21 14:43:10.533' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (28, 1, 1, 0, CAST(N'2017-12-21 14:43:11.017' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (29, 1, 1, 0, CAST(N'2017-12-21 14:43:37.460' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (30, 1, 1, 0, CAST(N'2017-12-25 07:44:47.110' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (31, 1, 1, 0, CAST(N'2017-12-25 07:46:41.923' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (32, 1, 1, 0, CAST(N'2017-12-25 07:47:42.807' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (33, 1, 1, 0, CAST(N'2017-12-25 21:39:28.687' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (34, 1, 1, 0, CAST(N'2017-12-25 21:39:33.730' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (35, 1, 1, 0, CAST(N'2017-12-25 21:39:43.363' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (36, 1, 1, 0, CAST(N'2017-12-25 21:40:41.397' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (37, 1, 1, 0, CAST(N'2017-12-25 21:41:09.457' AS DateTime))
INSERT [dbo].[UserLogin] ([Id], [FKUserId], [IsSuccess], [IsBlock], [Date]) VALUES (38, 1, 1, 0, CAST(N'2017-12-26 06:29:47.613' AS DateTime))
SET IDENTITY_INSERT [dbo].[UserLogin] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [UserName], [Email], [Password], [FkUserId]) VALUES (1, N'ahmed', N'ahmed@gmail.com', N'123', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Cities] FOREIGN KEY([FKCityId])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Cities]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Countries] FOREIGN KEY([FKCountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Countries]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Countries] FOREIGN KEY([FkCountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_Cities_Countries]
GO
ALTER TABLE [dbo].[Date]  WITH CHECK ADD  CONSTRAINT [FK_Date_DateType] FOREIGN KEY([FKDateTypeId])
REFERENCES [dbo].[DateType] ([Id])
GO
ALTER TABLE [dbo].[Date] CHECK CONSTRAINT [FK_Date_DateType]
GO
ALTER TABLE [dbo].[Month]  WITH CHECK ADD  CONSTRAINT [FK_Month_DateType] FOREIGN KEY([FKDateTypeId])
REFERENCES [dbo].[DateType] ([Id])
GO
ALTER TABLE [dbo].[Month] CHECK CONSTRAINT [FK_Month_DateType]
GO
ALTER TABLE [dbo].[UserData]  WITH CHECK ADD  CONSTRAINT [FK_UaserData_Address] FOREIGN KEY([FkAddressId])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[UserData] CHECK CONSTRAINT [FK_UaserData_Address]
GO
ALTER TABLE [dbo].[UserData]  WITH CHECK ADD  CONSTRAINT [FK_UaserData_Gender] FOREIGN KEY([FkGenderId])
REFERENCES [dbo].[Gender] ([Id])
GO
ALTER TABLE [dbo].[UserData] CHECK CONSTRAINT [FK_UaserData_Gender]
GO
ALTER TABLE [dbo].[UserData]  WITH CHECK ADD  CONSTRAINT [FK_UaserData_Images] FOREIGN KEY([FKImageId])
REFERENCES [dbo].[Images] ([Id])
GO
ALTER TABLE [dbo].[UserData] CHECK CONSTRAINT [FK_UaserData_Images]
GO
ALTER TABLE [dbo].[UserData]  WITH CHECK ADD  CONSTRAINT [FK_UaserData_Jops] FOREIGN KEY([FKJobId])
REFERENCES [dbo].[Jobs] ([Id])
GO
ALTER TABLE [dbo].[UserData] CHECK CONSTRAINT [FK_UaserData_Jops]
GO
ALTER TABLE [dbo].[UserData]  WITH CHECK ADD  CONSTRAINT [FK_UaserData_UaserData] FOREIGN KEY([FkSocialStatusId])
REFERENCES [dbo].[SocialStatus] ([Id])
GO
ALTER TABLE [dbo].[UserData] CHECK CONSTRAINT [FK_UaserData_UaserData]
GO
ALTER TABLE [dbo].[UserLogin]  WITH CHECK ADD  CONSTRAINT [FK_UserLogin_Users] FOREIGN KEY([FKUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserLogin] CHECK CONSTRAINT [FK_UserLogin_Users]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Role] FOREIGN KEY([FKRoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Role]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([FKUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UaserData] FOREIGN KEY([FkUserId])
REFERENCES [dbo].[UserData] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UaserData]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'رتبة الشهر 
مثلا شهر يناير هوا شهر رقم 1 من عدد الشهور ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Month', @level2type=N'COLUMN',@level2name=N'MonthIndex'
GO
USE [master]
GO
ALTER DATABASE [Rental] SET  READ_WRITE 
GO
